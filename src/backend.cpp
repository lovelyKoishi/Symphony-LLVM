// SPDX-License-Identifier: MIT
// Standalone LLVM IR -> Symphony assembly backend. No target-specific regex IR
// parser.
#include <algorithm>
#include <cctype>
#include <cstdint>
#include <llvm/ADT/MapVector.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Operator.h>
#include <llvm/IR/Verifier.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Pass.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/MathExtras.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/IPO/GlobalDCE.h>
#include <llvm/Transforms/IPO/Internalize.h>
#include <llvm/Transforms/Utils/Local.h>
#include <map>
#include <set>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

using namespace llvm;
using S = std::string;
static cl::opt<S> Input(cl::Positional, cl::Required,
                        cl::desc("input .ll or .bc"));
static cl::opt<S> Output("o", cl::init("-"), cl::desc("output Symphony .asm"));
static cl::opt<S> Entry("entry", cl::init("main"));
static cl::opt<unsigned> StackTop("stack-top", cl::init(0x1000000));
static cl::opt<unsigned> DataBase("data-base", cl::init(0x10000));

static S str(const Value *v) {
  S s;
  raw_string_ostream o(s);
  v->print(o);
  return s;
}
[[noreturn]] static void fail(const S &s) { throw std::runtime_error(s); }
static uint64_t aligned(uint64_t v, uint64_t a) { return (v + a - 1) / a * a; }
static bool scalar(Type *t) {
  return t->isPointerTy() ||
         (t->isIntegerTy() && t->getIntegerBitWidth() <= 32);
}
static unsigned width(Type *t) {
  if (t->isPointerTy()) {
    if (t->getPointerAddressSpace())
      fail("nonzero pointer address space is unsupported");
    return 32;
  }
  if (!scalar(t))
    fail(
        "only scalar integers up to 32 bits and 32-bit pointers are supported");
  return t->getIntegerBitWidth();
}
static void storageType(Type *t) {
  if (scalar(t)) {
    width(t);
    return;
  }
  if (auto *a = dyn_cast<ArrayType>(t)) {
    storageType(a->getElementType());
    return;
  }
  if (auto *s = dyn_cast<StructType>(t)) {
    if (s->isOpaque())
      fail("opaque aggregate storage is unsupported");
    for (auto *e : s->elements())
      storageType(e);
    return;
  }
  fail("storage supports only <=32-bit integers, pointers, arrays and structs "
       "(no floats/vectors/i64)");
}
static unsigned memoryWidth(Type *t) {
  unsigned w = width(t);
  if (w == 1)
    return 8;
  if (w != 8 && w != 16 && w != 32)
    fail("memory integer width must be i1/i8/i16/i32");
  return w;
}

class Backend {
  Module &M;
  const DataLayout &DL;
  std::ostringstream O;
  std::map<const GlobalValue *, uint32_t> addresses;
  std::map<const Function *, S> functions;
  std::map<const BasicBlock *, S> blocks;
  std::map<S, uint32_t> codeAddresses;
  std::map<const Value *, unsigned> slots;
  std::map<const Value *, S> valueRegisters;
  std::map<const AllocaInst *, unsigned> objects;
  std::map<const PHINode *, unsigned> phiTemps;
  std::map<const CallBase *, std::vector<S>> callSavedRegisters;
  std::map<S, unsigned> callSaveSlots;
  std::vector<uint8_t> data;
  unsigned serial = 0, frame = 0, codeSize = 0;
  bool framePointer = true;
  uint64_t dataEnd;
  S fresh(const S &p) { return "__sym_" + p + "_" + std::to_string(serial++); }
  void label(const S &s) {
    codeAddresses[s] = codeSize;
    O << s << ":\n";
  }
  void emit(const S &s) {
    O << "    " << s << '\n';
    S op = s.substr(0, s.find(' '));
    codeSize += op == "call"                    ? 20
                : op == "ret"                   ? 12
                : (op == "push" || op == "pop") ? 8
                                                : 4;
    if (codeSize > DataBase || codeSize > 65536)
      fail("code exceeds direct U16 branch range or overlaps data; "
           "split/reduce this program");
  }
  void imm(const S &r, uint32_t n) {
    if (n <= 65535)
      emit("mov " + r + ", " + std::to_string(n));
    else {
      emit("mov " + r + ", " + std::to_string(n >> 16));
      emit("lsl " + r + ", " + r + ", 16");
      if (n & 65535)
        emit("or " + r + ", " + r + ", " + std::to_string(n & 65535));
    }
  }
  void normalize(const S &r, unsigned w) {
    if (w == 32)
      return;
    if (w <= 16)
      emit("and " + r + ", " + r + ", " + std::to_string((1u << w) - 1));
    else {
      emit("lsl " + r + ", " + r + ", " + std::to_string(32 - w));
      emit("lsr " + r + ", " + r + ", " + std::to_string(32 - w));
    }
  }
  void sign(const S &r, unsigned w) {
    if (w == 32)
      return;
    emit("lsl " + r + ", " + r + ", " + std::to_string(32 - w));
    emit("asr " + r + ", " + r + ", " + std::to_string(32 - w));
  }
  void frameAddress(const S &r, int offset) {
    emit(S(offset < 0 ? "sub " : "add ") + r + ", r13, " +
         std::to_string(std::abs(offset)));
  }
  void saveAt(unsigned offset, const S &r) {
    frameAddress("r12", -int(offset));
    emit("store_32 [r12], " + r);
  }
  void save(const Value *v, const S &r = "r1") {
    if (v->use_empty())
      return;
    normalize(r, width(v->getType()));
    auto reg = valueRegisters.find(v);
    if (reg != valueRegisters.end()) {
      if (r != reg->second)
        emit("mov " + reg->second + ", " + r);
    } else {
      saveAt(slots.at(v), r);
    }
  }
  uint32_t constant(const Constant *c) {
    if (auto *i = dyn_cast<ConstantInt>(c)) {
      width(i->getType());
      return uint32_t(i->getZExtValue());
    }
    if (isa<ConstantPointerNull>(c) || isa<UndefValue>(c) ||
        isa<ConstantAggregateZero>(c))
      return 0;
    if (auto *g = dyn_cast<GlobalValue>(c)) {
      if (addresses.count(g))
        return addresses.at(g);
      if (auto *f = dyn_cast<Function>(g);
          f && functions.count(f) && codeAddresses.count(functions.at(f)))
        return codeAddresses.at(functions.at(f));
      fail("unresolved or non-data constant: " + str(c));
    }
    if (auto *e = dyn_cast<ConstantExpr>(c)) {
      if (e->getOpcode() == Instruction::GetElementPtr) {
        APInt off(32, 0);
        if (!cast<GEPOperator>(e)->accumulateConstantOffset(DL, off))
          fail("nonconstant global GEP");
        return constant(cast<Constant>(e->getOperand(0))) +
               uint32_t(off.getZExtValue());
      }
      if (e->isCast()) {
        uint32_t n = constant(cast<Constant>(e->getOperand(0)));
        unsigned src = width(e->getOperand(0)->getType()),
                 dst = width(e->getType());
        if (e->getOpcode() == Instruction::SExt && src < 32 &&
            (n & (1u << (src - 1))))
          n |= ~((1u << src) - 1);
        return dst == 32 ? n : n & ((1u << dst) - 1);
      }
    }
    fail("unsupported constant: " + str(c));
  }
  void load(const Value *v, const S &r) {
    auto reg = valueRegisters.find(v);
    if (reg != valueRegisters.end()) {
      if (r != reg->second)
        emit("mov " + r + ", " + reg->second);
      return;
    }
    if (auto *f = dyn_cast<Function>(v->stripPointerCasts())) {
      if (!functions.count(f))
        fail("address of external function: " + f->getName().str());
      emit("mov " + r + ", " + functions.at(f));
      return;
    }
    if (auto *e = dyn_cast<ConstantExpr>(v); e && e->isCast()) {
      unsigned src = width(e->getOperand(0)->getType());
      unsigned dst = width(e->getType());
      load(e->getOperand(0), r);
      if (e->getOpcode() == Instruction::SExt)
        sign(r, src);
      normalize(r, dst);
      return;
    }
    if (auto *c = dyn_cast<Constant>(v)) {
      imm(r, constant(c));
      return;
    }
    auto it = slots.find(v);
    if (it == slots.end())
      fail("no value slot: " + str(v));
    frameAddress("r12", -int(it->second));
    emit("load_32 " + r + ", [r12]");
  }
  S operandRegister(const Value *v, const S &scratch) {
    auto reg = valueRegisters.find(v);
    if (reg != valueRegisters.end())
      return reg->second;
    load(v, scratch);
    return scratch;
  }
  void initialize(const Constant *c, Type *t, uint64_t offset) {
    if (isa<ConstantAggregateZero>(c) || isa<UndefValue>(c))
      return;
    if (scalar(t)) {
      unsigned bytes = DL.getTypeStoreSize(t).getFixedValue();
      uint32_t n = constant(c);
      for (unsigned i = 0; i < bytes; ++i)
        data.at(offset + i) = uint8_t(n >> (8 * (bytes - 1 - i)));
      return;
    }
    if (auto *a = dyn_cast<ArrayType>(t)) {
      uint64_t stride =
          DL.getTypeAllocSize(a->getElementType()).getFixedValue();
      for (uint64_t i = 0; i < a->getNumElements(); ++i)
        initialize(c->getAggregateElement(unsigned(i)), a->getElementType(),
                   offset + i * stride);
      return;
    }
    if (auto *s = dyn_cast<StructType>(t)) {
      auto *layout = DL.getStructLayout(s);
      for (unsigned i = 0; i < s->getNumElements(); ++i)
        initialize(c->getAggregateElement(i), s->getElementType(i),
                   offset + layout->getElementOffset(i));
      return;
    }
    fail("unsupported global initializer: " + str(c));
  }
  unsigned allocate(uint64_t size, uint64_t align = 4) {
    // r13 is 8-byte aligned; downward allocations keep both base and objects
    // aligned.
    uint64_t end = aligned(uint64_t(frame) + size, align);
    if (end > 65520 || align > 8)
      fail("frame exceeds 65520 bytes or requires alignment greater than 8");
    frame = unsigned(end);
    return frame;
  }
  S location(const Value *v) const {
    auto reg = valueRegisters.find(v);
    if (reg != valueRegisters.end())
      return reg->second;
    auto slot = slots.find(v);
    return slot == slots.end() ? "" : "stack" + std::to_string(slot->second);
  }
  using Copies = std::vector<const PHINode *>;
  std::pair<Copies, Copies> orderCopies(const BasicBlock *from,
                                        const BasicBlock *to) const {
    Copies pending, ordered;
    for (const auto &p : to->phis()) {
      if (p.use_empty())
        continue;
      S src = location(p.getIncomingValueForBlock(from));
      if (!src.empty() && src == location(&p))
        continue;
      pending.push_back(&p);
    }
    while (!pending.empty()) {
      auto safe =
          std::find_if(pending.begin(), pending.end(), [&](const PHINode *p) {
            S dest = location(p);
            return std::none_of(
                pending.begin(), pending.end(), [&](const PHINode *q) {
                  return q != p &&
                         location(q->getIncomingValueForBlock(from)) == dest;
                });
          });
      if (safe == pending.end())
        break;
      ordered.push_back(*safe);
      pending.erase(safe);
    }
    return {ordered, pending};
  }
  void edge(const BasicBlock *from, const BasicBlock *to) {
    auto [ordered, cyclic] = orderCopies(from, to);
    for (auto *p : ordered)
      save(p, operandRegister(p->getIncomingValueForBlock(from), "r1"));
    // A cycle can involve physical registers even when its SSA values are
    // different. Stage the remaining copies before overwriting any source.
    for (auto *p : cyclic) {
      load(p->getIncomingValueForBlock(from), "r1");
      saveAt(phiTemps.at(p), "r1");
    }
    for (auto *p : cyclic) {
      frameAddress("r12", -int(phiTemps.at(p)));
      emit("load_32 r1, [r12]");
      save(p);
    }
    emit("jmp " + blocks.at(to));
  }
  void binary(const BinaryOperator &i) {
    unsigned w = width(i.getType());
    S op;
    switch (i.getOpcode()) {
    case Instruction::Add:
      op = "add";
      break;
    case Instruction::Sub:
      op = "sub";
      break;
    case Instruction::Mul:
      op = "mul";
      break;
    case Instruction::UDiv:
      op = "div";
      break;
    case Instruction::URem:
      op = "mod";
      break;
    case Instruction::And:
      op = "and";
      break;
    case Instruction::Or:
      op = "or";
      break;
    case Instruction::Xor:
      op = "xor";
      break;
    case Instruction::Shl:
      op = "lsl";
      break;
    case Instruction::LShr:
      op = "lsr";
      break;
    case Instruction::AShr:
      op = "asr";
      break;
    case Instruction::SDiv:
    case Instruction::SRem: {
      load(i.getOperand(0), "r1");
      load(i.getOperand(1), "r2");
      sign("r1", w);
      sign("r2", w);
      emit("asr r3, r1, 31");
      emit("asr r4, r2, 31");
      emit("xor r1, r1, r3");
      emit("sub r1, r1, r3");
      emit("xor r2, r2, r4");
      emit("sub r2, r2, r4");
      emit(S(i.getOpcode() == Instruction::SDiv ? "div" : "mod") +
           " r1, r1, r2");
      if (i.getOpcode() == Instruction::SDiv)
        emit("xor r3, r3, r4");
      emit("xor r1, r1, r3");
      emit("sub r1, r1, r3");
      save(&i);
      return;
    }
    default:
      fail("unsupported binary: " + str(&i));
    }
    const Value *lhs = i.getOperand(0), *rhs = i.getOperand(1);
    if (i.isCommutative() && isa<ConstantInt>(lhs) && !isa<ConstantInt>(rhs))
      std::swap(lhs, rhs);
    S left;
    if (i.getOpcode() == Instruction::AShr && w < 32) {
      load(lhs, "r1");
      sign("r1", w);
      left = "r1";
    } else
      left = operandRegister(lhs, "r1");
    S result = valueRegisters.count(&i) ? valueRegisters.at(&i) : "r1";
    auto *c = dyn_cast<ConstantInt>(rhs);
    if (c) {
      uint32_t n = constant(c);
      if ((op == "mul" || op == "div" || op == "mod") && isPowerOf2_32(n)) {
        if (op == "mod") {
          if (n - 1 <= 65535)
            emit("and " + result + ", " + left + ", " + std::to_string(n - 1));
          else {
            imm("r2", n - 1);
            emit("and " + result + ", " + left + ", r2");
          }
        } else if (n != 1) {
          emit(S(op == "mul" ? "lsl" : "lsr") + " " + result + ", " + left +
               ", " + std::to_string(Log2_32(n)));
        } else {
          save(&i, left);
          return;
        }
        save(&i, result);
        return;
      }
      if (n <= 65535) {
        emit(op + " " + result + ", " + left + ", " + std::to_string(n));
        save(&i, result);
        return;
      }
    }
    S right = operandRegister(rhs, "r2");
    emit(op + " " + result + ", " + left + ", " + right);
    save(&i, result);
  }
  static bool branchCompare(const ICmpInst &i) {
    auto *b = dyn_cast_or_null<CondBrInst>(i.getNextNode());
    return i.hasOneUse() && b && b->getCondition() == &i;
  }
  S compareFlags(const ICmpInst &i) {
    S left, right;
    if (i.isSigned()) {
      unsigned w = width(i.getOperand(0)->getType());
      // Sign extension must not overwrite a live source register.
      if (w < 32) {
        load(i.getOperand(0), "r1");
        load(i.getOperand(1), "r2");
        sign("r1", w);
        sign("r2", w);
        left = "r1";
        right = "r2";
      }
    }
    if (left.empty()) {
      left = operandRegister(i.getOperand(0), "r1");
      right = operandRegister(i.getOperand(1), "r2");
    }
    S j;
    switch (i.getPredicate()) {
    case CmpInst::ICMP_EQ:
      j = "je";
      break;
    case CmpInst::ICMP_NE:
      j = "jne";
      break;
    case CmpInst::ICMP_ULT:
      j = "jb";
      break;
    case CmpInst::ICMP_ULE:
      j = "jbe";
      break;
    case CmpInst::ICMP_UGT:
      j = "ja";
      break;
    case CmpInst::ICMP_UGE:
      j = "jae";
      break;
    case CmpInst::ICMP_SLT:
      j = "jl";
      break;
    case CmpInst::ICMP_SLE:
      j = "jle";
      break;
    case CmpInst::ICMP_SGT:
      j = "jg";
      break;
    case CmpInst::ICMP_SGE:
      j = "jge";
      break;
    default:
      fail("unsupported comparison");
    }
    emit("cmp " + left + ", " + right);
    return j;
  }
  void compare(const ICmpInst &i) {
    if (branchCompare(i))
      return;
    S j = compareFlags(i);
    S yes = fresh("cmp_yes"), done = fresh("cmp_done");
    emit(j + " " + yes);
    imm("r1", 0);
    emit("jmp " + done);
    label(yes);
    imm("r1", 1);
    label(done);
    save(&i);
  }
  void gep(const GetElementPtrInst &i) {
    SmallMapVector<Value *, APInt, 4> vars;
    APInt off(32, 0);
    if (!cast<GEPOperator>(&i)->collectOffset(DL, 32, vars, off))
      fail("unsupported GEP: " + str(&i));
    load(i.getPointerOperand(), "r1");
    if (!off.isZero()) {
      imm("r2", uint32_t(off.getZExtValue()));
      emit("add r1, r1, r2");
    }
    for (auto &kv : vars) {
      load(kv.first, "r2");
      sign("r2", width(kv.first->getType()));
      uint32_t stride = uint32_t(kv.second.getZExtValue());
      if (stride != 1) {
        if (isPowerOf2_32(stride))
          emit("lsl r2, r2, " + std::to_string(Log2_32(stride)));
        else if (stride <= 65535)
          emit("mul r2, r2, " + std::to_string(stride));
        else {
          imm("r3", stride);
          emit("mul r2, r2, r3");
        }
      }
      emit("add r1, r1, r2");
    }
    save(&i);
  }
  void memoryIntrinsic(const CallBase &i, bool set, bool move) {
    load(i.getArgOperand(0), "r1");
    load(i.getArgOperand(1), "r2");
    load(i.getArgOperand(2), "r3");
    S forward = fresh("mem_forward"), loop = fresh("mem_loop"),
      done = fresh("mem_done");
    emit("cmp r3, 0");
    emit("je " + done);
    if (move) {
      emit("cmp r1, r2");
      emit("jbe " + forward);
      emit("add r1, r1, r3");
      emit("add r2, r2, r3");
      S back = fresh("mem_back");
      label(back);
      emit("sub r1, r1, 1");
      emit("sub r2, r2, 1");
      emit("load_8 r4, [r2]");
      emit("store_8 [r1], r4");
      emit("sub r3, r3, 1");
      emit("cmp r3, 0");
      emit("jne " + back);
      emit("jmp " + done);
    }
    label(forward);
    label(loop);
    if (!set)
      emit("load_8 r4, [r2]");
    emit(S("store_8 [r1], ") + (set ? "r2" : "r4"));
    emit("add r1, r1, 1");
    if (!set)
      emit("add r2, r2, 1");
    emit("sub r3, r3, 1");
    emit("cmp r3, 0");
    emit("jne " + loop);
    label(done);
  }
  bool intrinsic(const CallBase &i, const Function &f) {
    auto id = f.getIntrinsicID();
    switch (id) {
    case Intrinsic::lifetime_start:
    case Intrinsic::lifetime_end:
    case Intrinsic::assume:
    case Intrinsic::experimental_noalias_scope_decl:
    case Intrinsic::dbg_declare:
    case Intrinsic::dbg_value:
      return true;
    case Intrinsic::memcpy:
      memoryIntrinsic(i, false, false);
      return true;
    case Intrinsic::memmove:
      memoryIntrinsic(i, false, true);
      return true;
    case Intrinsic::memset:
      memoryIntrinsic(i, true, false);
      return true;
    case Intrinsic::expect:
      load(i.getArgOperand(0), "r1");
      save(&i);
      return true;
    case Intrinsic::usub_sat: {
      load(i.getArgOperand(0), "r1");
      load(i.getArgOperand(1), "r2");
      S subtract = fresh("usub_sat"), done = fresh("usub_sat_done");
      emit("cmp r1, r2");
      emit("jae " + subtract);
      imm("r1", 0);
      emit("jmp " + done);
      label(subtract);
      emit("sub r1, r1, r2");
      label(done);
      save(&i);
      return true;
    }
    case Intrinsic::scmp:
    case Intrinsic::ucmp: {
      load(i.getArgOperand(0), "r1");
      load(i.getArgOperand(1), "r2");
      if (id == Intrinsic::scmp) {
        unsigned w = width(i.getArgOperand(0)->getType());
        sign("r1", w);
        sign("r2", w);
      }
      S less = fresh("threeway_less"), done = fresh("threeway_done");
      emit("cmp r1, r2");
      imm("r1", 0);
      emit("je " + done);
      emit(S(id == Intrinsic::scmp ? "jl " : "jb ") + less);
      imm("r1", 1);
      emit("jmp " + done);
      label(less);
      imm("r1", 0xffffffff);
      label(done);
      save(&i);
      return true;
    }
    case Intrinsic::smin:
    case Intrinsic::smax:
    case Intrinsic::umin:
    case Intrinsic::umax: {
      load(i.getArgOperand(0), "r1");
      load(i.getArgOperand(1), "r2");
      bool signedOp = id == Intrinsic::smin || id == Intrinsic::smax;
      bool minOp = id == Intrinsic::smin || id == Intrinsic::umin;
      if (signedOp) {
        sign("r1", width(i.getType()));
        sign("r2", width(i.getType()));
      }
      S done = fresh("minmax");
      emit("cmp r1, r2");
      emit(S(signedOp ? (minOp ? "jle" : "jge") : (minOp ? "jbe" : "jae")) +
           " " + done);
      emit("mov r1, r2");
      label(done);
      save(&i);
      return true;
    }
    case Intrinsic::abs: {
      load(i.getArgOperand(0), "r1");
      sign("r1", width(i.getType()));
      emit("asr r2, r1, 31");
      emit("xor r1, r1, r2");
      emit("sub r1, r1, r2");
      save(&i);
      return true;
    }
    default:
      return false;
    }
  }
  bool device(const CallBase &i, StringRef n) {
    unsigned count = 0;
    bool result = false;
    S inst;
    if (n == "symphony_keyboard") {
      inst = "keyboard";
      result = true;
    } else if (n == "symphony_in") {
      inst = "in";
      result = true;
    } else if (n == "symphony_time_low") {
      inst = "time_0";
      result = true;
    } else if (n == "symphony_time_high_cached") {
      inst = "time_1";
      result = true;
    } else if (n == "symphony_counter") {
      inst = "counter";
      result = true;
    } else if (n == "symphony_out") {
      inst = "out";
      count = 1;
    } else if (n == "symphony_screen") {
      inst = "screen";
      count = 2;
    } else if (n == "symphony_pload") {
      inst = "pload";
      count = 1;
      result = true;
    } else if (n == "symphony_pstore") {
      inst = "pstore";
      count = 2;
    } else
      return false;
    if (i.arg_size() != count ||
        (result ? !i.getType()->isIntegerTy(32) : !i.getType()->isVoidTy()))
      fail("invalid device function signature: " + n.str());
    for (unsigned a = 0; a < count; ++a) {
      if (width(i.getArgOperand(a)->getType()) != 32)
        fail("device operands must be 32 bits");
      load(i.getArgOperand(a), "r" + std::to_string(a + 1));
    }
    if (inst == "screen")
      emit("screen r1, r2");
    else if (inst == "pload")
      emit("pload r1, [r1]");
    else if (inst == "pstore")
      emit("pstore [r1], r2");
    else
      emit(inst + " r1");
    if (result)
      save(&i);
    return true;
  }
  void call(const CallBase &i) {
    if (i.isInlineAsm() || i.getFunctionType()->isVarArg())
      fail("inline assembly and variadic calls are unsupported: " + str(&i));
    if (auto *ci = dyn_cast<CallInst>(&i); ci && ci->isMustTailCall())
      fail("musttail calls are unsupported");
    auto *f = dyn_cast<Function>(i.getCalledOperand()->stripPointerCasts());
    if (f && f->isIntrinsic()) {
      if (intrinsic(i, *f))
        return;
      fail("unsupported LLVM intrinsic: " + f->getName().str());
    }
    if (f && f->isDeclaration()) {
      if (device(i, f->getName()))
        return;
      fail("unresolved function: " + f->getName().str());
    }
    for (unsigned a = 0; a < i.arg_size(); ++a)
      if (i.isByValArgument(a) || i.paramHasAttr(a, Attribute::InAlloca) ||
          i.paramHasAttr(a, Attribute::StructRet))
        fail("aggregate call ABI is unsupported");
    auto saved = callSavedRegisters.find(&i);
    if (saved != callSavedRegisters.end())
      for (const auto &reg : saved->second)
        saveAt(callSaveSlots.at(reg), reg);
    unsigned extra = i.arg_size() > 6 ? unsigned(i.arg_size()) - 6 : 0;
    unsigned padding = extra % 2 ? 4 : 0;
    if (padding)
      emit("sub sp, sp, 4");
    for (unsigned a = unsigned(i.arg_size()); a > 6; --a) {
      load(i.getArgOperand(a - 1), "r1");
      emit("push r1");
    }
    for (unsigned a = 0; a < std::min(6u, unsigned(i.arg_size())); ++a)
      load(i.getArgOperand(a), "r" + std::to_string(a + 1));
    if (f)
      emit("call " + functions.at(f));
    else {
      load(i.getCalledOperand(), "r11");
      S back = fresh("indirect_return");
      emit("mov r12, " + back);
      emit("push r12");
      emit("jmp r11");
      label(back);
    }
    if (extra)
      emit("add sp, sp, " + std::to_string(extra * 4 + padding));
    if (saved != callSavedRegisters.end())
      for (const auto &reg : saved->second) {
        frameAddress("r12", -int(callSaveSlots.at(reg)));
        emit("load_32 " + reg + ", [r12]");
      }
    if (!i.getType()->isVoidTy())
      save(&i);
  }
  void instruction(const Instruction &i) {
    if (isa<PHINode>(i))
      return;
    if (auto *a = dyn_cast<AllocaInst>(&i)) {
      frameAddress("r1", -int(objects.at(a)));
      save(a);
      return;
    }
    if (auto *b = dyn_cast<BinaryOperator>(&i)) {
      binary(*b);
      return;
    }
    if (auto *c = dyn_cast<ICmpInst>(&i)) {
      compare(*c);
      return;
    }
    if (auto *g = dyn_cast<GetElementPtrInst>(&i)) {
      gep(*g);
      return;
    }
    if (auto *c = dyn_cast<CastInst>(&i)) {
      unsigned src = width(c->getSrcTy());
      width(c->getDestTy());
      if (c->getOpcode() != Instruction::Trunc &&
          c->getOpcode() != Instruction::ZExt &&
          c->getOpcode() != Instruction::SExt &&
          c->getOpcode() != Instruction::BitCast &&
          c->getOpcode() != Instruction::PtrToInt &&
          c->getOpcode() != Instruction::IntToPtr)
        fail("unsupported cast: " + str(&i));
      load(c->getOperand(0), "r1");
      if (c->getOpcode() == Instruction::SExt)
        sign("r1", src);
      save(c);
      return;
    }
    if (auto *l = dyn_cast<LoadInst>(&i)) {
      if (l->isAtomic())
        fail("atomic load is unsupported");
      S address = operandRegister(l->getPointerOperand(), "r2");
      S result = valueRegisters.count(l) ? valueRegisters.at(l) : "r1";
      emit("load_" + std::to_string(memoryWidth(l->getType())) + " " + result +
           ", [" + address + "]");
      save(l, result);
      return;
    }
    if (auto *s = dyn_cast<StoreInst>(&i)) {
      if (s->isAtomic())
        fail("atomic store is unsupported");
      S value = operandRegister(s->getValueOperand(), "r1");
      S address = operandRegister(s->getPointerOperand(), "r2");
      emit("store_" +
           std::to_string(memoryWidth(s->getValueOperand()->getType())) + " [" +
           address + "], " + value);
      return;
    }
    if (auto *c = dyn_cast<CallInst>(&i)) {
      call(*c);
      return;
    }
    if (auto *s = dyn_cast<SelectInst>(&i)) {
      S yes = fresh("select_yes"), done = fresh("select_done");
      load(s->getCondition(), "r1");
      emit("cmp r1, 0");
      emit("jne " + yes);
      load(s->getFalseValue(), "r1");
      emit("jmp " + done);
      label(yes);
      load(s->getTrueValue(), "r1");
      label(done);
      save(s);
      return;
    }
    if (auto *b = dyn_cast<UncondBrInst>(&i)) {
      edge(i.getParent(), b->getSuccessor(0));
      return;
    }
    if (auto *b = dyn_cast<CondBrInst>(&i)) {
      S yes = fresh("edge_true");
      auto *cmp = dyn_cast<ICmpInst>(b->getCondition());
      if (cmp && branchCompare(*cmp))
        emit(compareFlags(*cmp) + " " + yes);
      else {
        load(b->getCondition(), "r1");
        emit("cmp r1, 0");
        emit("jne " + yes);
      }
      edge(i.getParent(), b->getSuccessor(1));
      label(yes);
      edge(i.getParent(), b->getSuccessor(0));
      return;
    }
    if (auto *s = dyn_cast<SwitchInst>(&i)) {
      load(s->getCondition(), "r1");
      std::vector<std::pair<S, const BasicBlock *>> edges;
      for (auto &c : s->cases()) {
        S next = fresh("switch");
        load(c.getCaseValue(), "r2");
        emit("cmp r1, r2");
        emit("je " + next);
        edges.emplace_back(next, c.getCaseSuccessor());
      }
      edge(i.getParent(), s->getDefaultDest());
      for (auto &e : edges) {
        label(e.first);
        edge(i.getParent(), e.second);
      }
      return;
    }
    if (auto *r = dyn_cast<ReturnInst>(&i)) {
      if (r->getReturnValue())
        load(r->getReturnValue(), "r1");
      else
        imm("r1", 0);
      if (framePointer) {
        emit("mov sp, r13");
        emit("pop r13");
      }
      emit("ret");
      return;
    }
    if (auto *f = dyn_cast<FreezeInst>(&i)) {
      load(f->getOperand(0), "r1");
      save(f);
      return;
    }
    if (isa<UnreachableInst>(i)) {
      emit("jmp __sym_trap");
      return;
    }
    fail("unsupported instruction: " + str(&i));
  }
  static bool machineCall(const Instruction &i) {
    auto *call = dyn_cast<CallBase>(&i);
    if (!call)
      return false;
    auto *callee =
        dyn_cast<Function>(call->getCalledOperand()->stripPointerCasts());
    // Intrinsics and device declarations lower to inline instruction sequences.
    return !callee || !callee->isDeclaration();
  }
  void assignRegisters(const Function &f) {
    valueRegisters.clear();
    callSavedRegisters.clear();
    std::vector<const Value *> values;
    std::map<const Value *, unsigned> ids;
    auto add = [&](const Value *v) {
      if (!v->use_empty() && scalar(v->getType())) {
        ids[v] = unsigned(values.size());
        values.push_back(v);
      }
    };
    for (const auto &arg : f.args())
      add(&arg);
    for (const auto &b : f)
      for (const auto &i : b) {
        if (auto *cmp = dyn_cast<ICmpInst>(&i); cmp && branchCompare(*cmp))
          continue;
        if (!i.getType()->isVoidTy())
          add(&i);
      }
    using Live = std::set<unsigned>;
    std::map<const BasicBlock *, Live> uses, defs, liveIn, liveOut;
    std::vector<uint64_t> cost(values.size(), 1);
    std::vector<uint64_t> callCost(values.size(), 0);
    std::map<const BasicBlock *, uint64_t> blockWeight;
    std::map<const CallBase *, Live> acrossCalls;
    // Loop nesting weights spill choices toward keeping hot loop values.
    DominatorTree dom(const_cast<Function &>(f));
    LoopInfo loops(dom);
    for (const auto &b : f) {
      uint64_t weight = 1;
      for (unsigned n = 0; n < std::min(loops.getLoopDepth(&b), 3u); ++n)
        weight *= 10;
      blockWeight[&b] = weight;
      for (const auto &i : b) {
        if (!isa<PHINode>(i))
          for (const auto &operand : i.operands()) {
            auto id = ids.find(operand.get());
            if (id == ids.end())
              continue;
            if (!defs[&b].count(id->second))
              uses[&b].insert(id->second);
            cost[id->second] += weight;
          }
        auto id = ids.find(&i);
        if (id != ids.end()) {
          defs[&b].insert(id->second);
          cost[id->second] += weight;
        }
      }
    }
    bool changed;
    do {
      changed = false;
      for (auto it = f.end(); it != f.begin();) {
        const BasicBlock *b = &*--it;
        Live out;
        for (const auto *succ : successors(b)) {
          Live edgeLive = liveIn[succ];
          for (const auto &phi : succ->phis()) {
            auto dest = ids.find(&phi);
            if (dest != ids.end())
              edgeLive.erase(dest->second);
          }
          for (const auto &phi : succ->phis()) {
            auto incoming = ids.find(phi.getIncomingValueForBlock(b));
            if (!phi.use_empty() && incoming != ids.end())
              edgeLive.insert(incoming->second);
          }
          out.insert(edgeLive.begin(), edgeLive.end());
        }
        Live in = uses[b];
        for (unsigned v : out)
          if (!defs[b].count(v))
            in.insert(v);
        if (in != liveIn[b] || out != liveOut[b]) {
          liveIn[b] = std::move(in);
          liveOut[b] = std::move(out);
          changed = true;
        }
      }
    } while (changed);
    std::vector<Live> graph(values.size());
    Live mustSpill;
    auto interfere = [&](unsigned a, unsigned b) {
      if (a != b) {
        graph[a].insert(b);
        graph[b].insert(a);
      }
    };
    for (const auto &b : f) {
      Live live = liveOut[&b];
      for (auto it = b.rbegin(); it != b.rend(); ++it) {
        const Instruction &i = *it;
        auto dest = ids.find(&i);
        if (dest != ids.end()) {
          for (unsigned v : live)
            interfere(dest->second, v);
          live.erase(dest->second);
        }
        // Keep profitable values in registers between calls; spill only at
        // actual call sites. ABI and inline device/intrinsic behavior stay
        // intact.
        if (machineCall(i)) {
          acrossCalls[cast<CallBase>(&i)] = live;
          for (unsigned v : live)
            callCost[v] += blockWeight[&b];
        }
        if (!isa<PHINode>(i))
          for (const auto &operand : i.operands()) {
            auto id = ids.find(operand.get());
            if (id != ids.end())
              live.insert(id->second);
          }
      }
      if (&b == &f.getEntryBlock())
        for (const auto &arg : f.args()) {
          auto id = ids.find(&arg);
          if (id != ids.end())
            for (unsigned v : live)
              interfere(id->second, v);
        }
    }
    // Call-site save/reload costs four instructions per register. Values with
    // too few other accesses are cheaper to leave in a stack home throughout.
    for (unsigned v = 0; v < values.size(); ++v)
      if (callCost[v] && cost[v] <= 3 * callCost[v])
        mustSpill.insert(v);
    // Optimistic graph coloring: simplify low-degree nodes first; when under
    // pressure, prefer spilling values with low loop-weighted use cost.
    Live remaining;
    for (unsigned n = 0; n < values.size(); ++n)
      if (!mustSpill.count(n))
        remaining.insert(n);
    std::vector<unsigned> order;
    while (!remaining.empty()) {
      unsigned chosen = *remaining.begin(), chosenDegree = 0;
      for (unsigned v : remaining) {
        unsigned degree = 0;
        for (unsigned other : graph[v])
          degree += remaining.count(other);
        if (degree < 5) {
          chosen = v;
          break;
        }
        if (!chosenDegree || cost[v] * chosenDegree < cost[chosen] * degree) {
          chosen = v;
          chosenDegree = degree;
        }
      }
      order.push_back(chosen);
      remaining.erase(chosen);
    }
    for (auto it = order.rbegin(); it != order.rend(); ++it) {
      unsigned v = *it;
      std::set<S> occupied;
      for (unsigned other : graph[v]) {
        auto reg = valueRegisters.find(values[other]);
        if (reg != valueRegisters.end())
          occupied.insert(reg->second);
      }
      // Prefer the same register as related PHIs where interference permits.
      S preferred;
      for (auto *user : values[v]->users())
        if (isa<PHINode>(user)) {
          auto reg = valueRegisters.find(user);
          if (reg != valueRegisters.end() && !occupied.count(reg->second))
            preferred = reg->second;
        }
      if (auto *phi = dyn_cast<PHINode>(values[v]))
        for (const auto &incoming : phi->incoming_values()) {
          auto reg = valueRegisters.find(incoming.get());
          if (reg != valueRegisters.end() && !occupied.count(reg->second))
            preferred = reg->second;
        }
      if (!preferred.empty())
        valueRegisters[values[v]] = preferred;
      else
        for (unsigned n = 7; n <= 11; ++n) {
          S reg = "r" + std::to_string(n);
          if (!occupied.count(reg)) {
            valueRegisters[values[v]] = reg;
            break;
          }
        }
    }
    for (const auto &[call, live] : acrossCalls)
      for (unsigned v : live) {
        auto reg = valueRegisters.find(values[v]);
        if (reg != valueRegisters.end())
          callSavedRegisters[call].push_back(reg->second);
      }
  }
  void function(const Function &f) {
    if (f.isVarArg())
      fail("variadic definitions are unsupported");
    if (!f.getReturnType()->isVoidTy())
      width(f.getReturnType());
    slots.clear();
    assignRegisters(f);
    objects.clear();
    phiTemps.clear();
    callSaveSlots.clear();
    frame = 0;
    for (auto &a : f.args()) {
      width(a.getType());
      if (a.hasByValAttr() || a.hasStructRetAttr() || a.hasInAllocaAttr())
        fail("aggregate parameter ABI is unsupported");
      if (!a.use_empty() && !valueRegisters.count(&a))
        slots[&a] = allocate(4);
    }
    for (auto &b : f)
      for (auto &i : b) {
        if (!i.getType()->isVoidTy()) {
          width(i.getType());
          auto *cmp = dyn_cast<ICmpInst>(&i);
          if (!i.use_empty() && !valueRegisters.count(&i) &&
              !(cmp && branchCompare(*cmp)))
            slots[&i] = allocate(4);
        }
        if (auto *a = dyn_cast<AllocaInst>(&i)) {
          auto *n = dyn_cast<ConstantInt>(a->getArraySize());
          if (!n || a->getParent() != &f.getEntryBlock())
            fail("only fixed-size entry-block alloca is supported");
          storageType(a->getAllocatedType());
          uint64_t count = n->getLimitedValue(65521),
                   size = DL.getTypeAllocSize(a->getAllocatedType())
                              .getFixedValue();
          if (size > 65520 || count > 65520 || (count && size > 65520 / count))
            fail("alloca exceeds frame limit");
          objects[a] = allocate(std::max(uint64_t(1), size * count),
                                a->getAlign().value());
        }
      }
    std::set<S> savedRegs;
    for (const auto &[call, regs] : callSavedRegisters)
      savedRegs.insert(regs.begin(), regs.end());
    for (const auto &reg : savedRegs)
      callSaveSlots[reg] = allocate(4);
    for (const auto &b : f)
      for (const auto *succ : successors(&b))
        for (auto *p : orderCopies(&b, succ).second)
          if (!phiTemps.count(p))
            phiTemps[p] = allocate(4);
    frame = unsigned(aligned(frame, 8));
    framePointer = frame != 0;
    for (const auto &b : f)
      for (const auto &i : b)
        if (machineCall(i))
          framePointer = true;
    unsigned argIndex = 0;
    for (const auto &arg : f.args())
      if (argIndex++ >= 6 && !arg.use_empty())
        framePointer = true;
    O << "\n; function " << f.getName().str() << ", frame " << frame
      << " bytes\n";
    label(functions.at(&f));
    if (framePointer) {
      emit("push r13");
      emit("mov r13, sp");
    }
    if (frame)
      emit("sub sp, sp, " + std::to_string(frame));
    unsigned index = 0;
    for (auto &a : f.args()) {
      if (a.use_empty()) {
        ++index;
        continue;
      }
      if (index < 6)
        save(&a, "r" + std::to_string(index + 1));
      else {
        if (index > 16000)
          fail("too many arguments");
        frameAddress("r12", 8 + int(index - 6) * 4);
        emit("load_32 r1, [r12]");
        save(&a);
      }
      ++index;
    }
    for (auto &b : f) {
      label(blocks.at(&b));
      for (auto &i : b)
        instruction(i);
    }
  }

public:
  explicit Backend(Module &m)
      : M(m), DL(m.getDataLayout()), dataEnd(DataBase) {}
  S run() {
    if (DL.isLittleEndian() || DL.getPointerSizeInBits() != 32)
      fail("input IR must have a big-endian, 32-bit-pointer DataLayout; use "
           "symphony-cc instead of host clang");
    if (DataBase < 4096 || DataBase > 0x800000 || DataBase % 8)
      fail("data-base must be 8-byte aligned in [4096, 8388608]");
    if (StackTop > 0x1000000 || StackTop % 8 || StackTop <= DataBase)
      fail("invalid stack-top (must be 8-byte aligned, above data, at most 16 "
           "MiB)");
    if (!M.alias_empty() || !M.ifunc_empty())
      fail("global aliases/ifuncs are unsupported");
    auto *entry = M.getFunction(Entry);
    if (!entry || entry->isDeclaration() || entry->arg_size())
      fail("entry must be a defined function with no parameters");
    for (auto &f : M)
      if (!f.isDeclaration()) {
        functions[&f] = fresh("fn_" + f.getName().str());
        // Function names may contain punctuation not accepted by the game
        // assembler.
        auto &name = functions[&f];
        for (char &c : name)
          if (!std::isalnum(static_cast<unsigned char>(c)) && c != '_')
            c = '_';
        for (auto &b : f)
          blocks[&b] = fresh("block");
      }
    for (auto &g : M.globals()) {
      if (g.getName().starts_with("llvm."))
        fail("LLVM special global is unsupported: " + g.getName().str());
      if (g.isDeclaration() || g.isThreadLocal() || g.getAddressSpace())
        fail("external/TLS/nonzero-AS global unsupported: " +
             g.getName().str());
      storageType(g.getValueType());
      uint64_t alignment =
          std::max(DL.getABITypeAlign(g.getValueType()).value(),
                   g.getAlign().valueOrOne().value());
      dataEnd = aligned(dataEnd, alignment);
      addresses[&g] = uint32_t(dataEnd);
      uint64_t size = DL.getTypeAllocSize(g.getValueType()).getFixedValue();
      if (dataEnd + size > StackTop || dataEnd + size > 0x800000)
        fail("global data too large or overlaps stack");
      dataEnd += std::max(uint64_t(1), size);
    }
    data.resize(dataEnd - DataBase, 0);
    O << "; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.\n";
    label("__sym_start");
    imm("sp", StackTop);
    emit("call " + functions.at(entry));
    label("__sym_halt");
    emit("jmp __sym_halt");
    label("__sym_trap");
    emit("jmp __sym_trap");
    for (auto &f : M)
      if (!f.isDeclaration())
        function(f);
    for (auto &g : M.globals())
      initialize(g.getInitializer(), g.getValueType(),
                 addresses.at(&g) - DataBase);
    if (!data.empty()) {
      // The target starts with zeroed RAM outside the program image. Keep
      // address allocation unchanged, but omit the implicit zero-filled tail.
      size_t initialized = data.size();
      while (initialized && data[initialized - 1] == 0)
        --initialized;
      O << "\n; Global addresses (zero tail uses initially zeroed RAM).\n";
      for (auto &g : M.globals())
        O << "; " << g.getName().str() << " = " << addresses.at(&g) << "\n";
      if (initialized) {
        O << "@" << DataBase << "\n";
        for (size_t i = 0; i < initialized;) {
          size_t end = i;
          while (end < initialized && data[end] == 0)
            ++end;
          if (end - i >= 4) {
            O << "@" << DataBase + end << "\n";
            i = end;
          } else {
            O << "U8 " << unsigned(data[i++]) << "\n";
          }
        }
      }
    }
    return O.str();
  }
};

int main(int argc, char **argv) {
  cl::ParseCommandLineOptions(argc, argv, "LLVM IR -> Symphony assembly\n");
  LLVMContext context;
  SMDiagnostic diagnostic;
  auto module = parseIRFile(Input, diagnostic, context);
  if (!module) {
    diagnostic.print(argv[0], errs());
    return 1;
  }
  if (verifyModule(*module, &errs()))
    return 1;
  try {
    internalizeModule(
        *module, [](const GlobalValue &v) { return v.getName() == Entry; });
    legacy::PassManager cleanup;
    cleanup.add(createGlobalDCEPass());
    cleanup.run(*module);
    // Clang O0 may emit unused i64 casts for i32 conditional expressions.
    // Remove only trivially dead instructions, preserving calls, volatile loads
    // and other effects. This does not add support for live 64-bit arithmetic.
    for (auto &f : *module) {
      SmallVector<WeakTrackingVH, 16> dead;
      for (auto &b : f)
        for (auto &i : b)
          if (isInstructionTriviallyDead(&i))
            dead.push_back(&i);
      RecursivelyDeleteTriviallyDeadInstructions(dead);
    }
    S result = Backend(*module).run();
    std::error_code ec;
    raw_fd_ostream out(Output, ec);
    if (ec) {
      errs() << "cannot open output: " << ec.message() << "\n";
      return 1;
    }
    out << result;
  } catch (const std::exception &e) {
    errs() << "llvm2symphony: " << e.what() << "\n";
    return 1;
  }
  return 0;
}

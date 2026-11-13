#!/usr/bin/env python3
"""Compile real C / typed LLVM IR, assemble, then execute machine words."""
import argparse
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))
from symphony_machine import assemble, Machine

parser = argparse.ArgumentParser()
parser.add_argument('--backend', type=Path, default=ROOT / 'build/llvm2symphony')
args, remaining = parser.parse_known_args()
sys.argv = [sys.argv[0]] + remaining
BACKEND = args.backend.resolve()
LAYOUT = 'target datalayout = "E-p:32:32-i64:64-n32-S64"\n'

class ToolchainTests(unittest.TestCase):
    def c(self, body, expected, *, outputs=(), opts=('0', '1'), inputs=(), keys=()):
        for opt in opts:
            with self.subTest(opt=opt), tempfile.TemporaryDirectory() as tmp:
                source = Path(tmp) / 'test.c'; asm = Path(tmp) / 'test.asm'
                source.write_text('#include "symphony.h"\n' + body)
                command = [sys.executable, str(ROOT/'tools/symphony-cc'), str(source),
                           '-o', str(asm), '-O'+opt, '--backend', str(BACKEND)]
                p = subprocess.run(command, capture_output=True, text=True)
                self.assertEqual(p.returncode, 0, p.stderr)
                machine = Machine(assemble(asm.read_text()), inputs=inputs, keyboard=keys)
                result = machine.run(2_000_000)
                self.assertEqual(result.reason, 'breakpoint')
                self.assertEqual(result.exit_code, expected & 0xffffffff)
                self.assertEqual(machine.outputs, list(outputs))
                self.assertEqual(machine.registers[14], 0x1000000, 'SP must restore after main')
                self.assertEqual(machine.registers[13], 0, 'frame pointer must restore')

    def ir(self, source, expected):
        with tempfile.TemporaryDirectory() as tmp:
            ir = Path(tmp)/'test.ll'; asm=Path(tmp)/'test.asm'
            ir.write_text(LAYOUT+source)
            p=subprocess.run([str(BACKEND),str(ir),'-o',str(asm)],capture_output=True,text=True)
            self.assertEqual(p.returncode,0,p.stderr)
            m=Machine(assemble(asm.read_text()));result=m.run(2_000_000)
            self.assertEqual(result.reason,'breakpoint')
            self.assertEqual(result.exit_code,expected&0xffffffff)
            return asm.read_text(), m.program

    def rejects(self, source, message):
        with tempfile.TemporaryDirectory() as tmp:
            path=Path(tmp)/'bad.ll';output=Path(tmp)/'bad.asm'
            path.write_text(source)
            p=subprocess.run([str(BACKEND),str(path),'-o',str(output)],capture_output=True,text=True)
            self.assertNotEqual(p.returncode,0)
            self.assertIn(message,p.stderr)
            self.assertFalse(output.exists(), 'failed compilation must not leave partial assembly')

    def test_recursive_nested_calls(self):
        self.c('''__attribute__((noinline)) int fact(int n) {return n<2?1:n*fact(n-1);}
int main(void){int r=fact(6)+fact(4);symphony_out(r);return r;}''',744,outputs=[744])

    def test_unsigned_hardware_arithmetic(self):
        self.c('''int main(void){unsigned a=symphony_in(),b=symphony_in();
symphony_out(a*b);symphony_out(a/b);return a%b;}''',1,
               outputs=[0xfffffffe,0x7fffffff],inputs=[0xffffffff,2])

    def test_constant_arithmetic_boundaries(self):
        expressions = [('a*7u', lambda a: a*7), ('65535u*a', lambda a: a*65535),
                       ('a*65536u', lambda a: a*65536),
                       ('a*0x80000000u', lambda a: a*0x80000000),
                       ('a/65536u', lambda a: a//65536),
                       ('a%65536u', lambda a: a%65536),
                       ('a%0x80000000u', lambda a: a%0x80000000),
                       ('a/0x80000000u', lambda a: a//0x80000000),
                       ('a-65535u', lambda a: a-65535),
                       ('a^65535u', lambda a: a^65535)]
        values = [0, 1, 0x7fffffff, 0x80000000, 0xffffffff]
        body = 'int main(void){for(unsigned i=0;i<5;++i){unsigned a=symphony_in();'
        body += ''.join(f'symphony_out({expr});' for expr, _ in expressions)
        body += '}return 0;}'
        outputs = [f(a)&0xffffffff for a in values for _, f in expressions]
        self.c(body,0,outputs=outputs,inputs=values)

    def test_direct_branch_predicates_and_narrow_signs(self):
        predicates = {'eq':False, 'ne':True, 'ult':False, 'ule':False,
                      'ugt':True, 'uge':True, 'slt':True, 'sle':True,
                      'sgt':False, 'sge':False}
        for predicate, expected in predicates.items():
            with self.subTest(predicate=predicate):
                self.ir(f'''define i32 @choose(i8 %a, i8 %b) {{
 %c=icmp {predicate} i8 %a,%b
 br i1 %c,label %yes,label %no
yes:
 ret i32 1
no:
 ret i32 0
}}
define i32 @main() {{
 %v=call i32 @choose(i8 -1,i8 1)
 ret i32 %v
}}''',int(expected))

    def test_compare_keeps_boolean_when_not_adjacent_to_branch(self):
        self.ir('''define i32 @main() {
 %a=add i8 -2,1
 %condition=icmp slt i8 %a,0
 %b=add i32 40,2
 br i1 %condition,label %yes,label %no
yes:
 ret i32 %b
no:
 ret i32 99
}''',42)

    def test_signed_div_rem_all_signs(self):
        self.c('''int main(void){int a=(int)symphony_in(),b=(int)symphony_in();
symphony_out(a/b);symphony_out(a%b);symphony_out((-a)/b);
symphony_out(a/(-b));symphony_out((-a)%b);return a%b;}''',-1,
               outputs=[0xfffffffe,0xffffffff,2,2,1],inputs=[0xfffffff9,3])

    def test_int_min_divisor(self):
        self.c('''int main(void){int a=(int)symphony_in(),b=(int)symphony_in();
symphony_out(a/b);return a%b;}''',-2,outputs=[0xd5555556],inputs=[0x80000000,3])

    def test_arrays_structs_and_big_endian(self):
        self.c('''struct Pair {unsigned char c; unsigned n;};
static struct Pair pairs[2]={{7,0x12345678},{9,5}};
static unsigned values[4]={1,2,3,4};
static unsigned *ptr=&values[2];
int main(void){unsigned i=symphony_in();pairs[i].n+=*ptr;
unsigned char *p=(unsigned char*)&pairs[0].n;
symphony_out(p[0]);symphony_out(p[3]);return pairs[0].n+sizeof(pairs[0]);}''',0x12345683,outputs=[0x12,0x7b],inputs=[0])

    def test_locals_pointer_gep(self):
        self.c('''__attribute__((noinline)) int sum(int *p,int n){int s=0;for(int i=0;i<n;i++)s+=p[i];return s;}
int main(void){int a[4]={2,4,6,8};int *p=a+3;symphony_out(p[-2]);return sum(a,4);}''',20,outputs=[4])

    def test_more_than_six_args(self):
        self.c('''__attribute__((noinline)) int f(int a,int b,int c,int d,int e,int f,int g,int h,int i){return a+2*b+3*c+4*d+5*e+6*f+7*g+8*h+9*i;}
int main(void){int a=(int)symphony_in();return f(a,2,3,4,5,6,7,8,9)+f(9,8,7,6,5,4,3,2,a);}''',450,inputs=[1])

    def test_seven_args_nested_recursion(self):
        self.c('''__attribute__((noinline)) int f(int n,int b,int c,int d,int e,int x,int y){if(n==0)return b+c+d+e+x+y;return f(n-1,b+1,c,d,e,x,y)+y;}
int main(void){return f(3,1,2,3,4,5,6);}''',42)

    def test_signed_narrow_casts_and_shifts(self):
        self.c('''int main(void){signed char a=(signed char)symphony_in();short b=(short)symphony_in();
symphony_out(a);symphony_out(b);symphony_out(a>>2);symphony_out((unsigned char)a);
return a<0 && b<0 && (unsigned char)(a+10)==4;}''',1,
               outputs=[0xfffffffa,0xffff8001,0xfffffffe,250],inputs=[250,32769])

    def test_switch_and_boolean(self):
        self.c('''int main(void){int x=(int)symphony_in();int y;
switch(x){case -1:y=11;break;case 3:y=17;break;case 40:y=23;break;default:y=9;}
return (x!=0 && y>10)?y:99;}''',17,inputs=[3])

    def test_volatile_memory(self):
        self.c('''volatile unsigned char b[3];int main(void){b[0]=255;b[1]=7;b[2]=(unsigned char)(b[0]+b[1]);return b[2];}''',6)

    def test_indirect_call_and_global_function_pointer(self):
        self.c('''int add(int a,int b){return a+b;}int sub(int a,int b){return a-b;}
static int (*ops[2])(int,int)={add,sub};
int main(void){unsigned i=symphony_in();return ops[i](20,3);}''',17,inputs=[1])

    def test_function_pointer_integer_roundtrip(self):
        self.c('''int add(int a,int b){return a+b;}
int main(void){uintptr_t a=(uintptr_t)add;int (*fp)(int,int)=(int (*)(int,int))a;return fp(20,3);}''',23)

    def test_memory_intrinsics(self):
        self.c('''int main(void){unsigned char a[12];__builtin_memset(a,3,12);
a[0]=9;__builtin_memmove(a+1,a,8);unsigned char b[12];__builtin_memcpy(b,a,12);
return b[0]+b[1]+b[2]+b[11];}''',24,opts=('0',))

    def test_devices_and_keys(self):
        self.c('''int main(void){symphony_screen(0,SYMPHONY_ASCII8);symphony_out(symphony_keyboard());
symphony_out(symphony_keyboard());symphony_pstore(4,0x12345678);return symphony_pload(4);}''',0x12345678,
               outputs=[0x10a,0x10d],keys=[0x10a,0x10d])

    def test_phi_parallel_copy(self):
        self.ir('''define i32 @main() {
entry: br label %loop
loop:
 %a=phi i32 [1,%entry],[%b,%loop]
 %b=phi i32 [2,%entry],[%a,%loop]
 %n=phi i32 [0,%entry],[%next,%loop]
 %next=add i32 %n,1
 %more=icmp ult i32 %next,3
 br i1 %more,label %loop,label %exit
exit:
 %x=mul i32 %a,10
 %y=add i32 %x,%b
 ret i32 %y
}''',12)

    def test_ir_i8_wrap_compare_divide(self):
        self.ir('''define i32 @main(){
 %x=add i8 250,10
 %q=sdiv i8 -7,3
 %r=srem i8 -7,3
 %s=icmp slt i8 %q,0
 %a=zext i8 %x to i32
 %b=sext i8 %r to i32
 %v=add i32 %a,%b
 %out=select i1 %s,i32 %v,i32 99
 ret i32 %out
}''',3)

    def test_local_register_pressure_and_call_liveness(self):
        self.ir('''declare i32 @symphony_in()
define i32 @clobber(i32 %v) {
 %x=add i32 %v,1
 %y=add i32 %v,2
 %z=mul i32 %x,%y
 ret i32 %z
}
define i32 @main() {
 %a=call i32 @symphony_in()
 %b=add i32 %a,2
 %c=add i32 %a,3
 %d=add i32 %a,4
 %e=add i32 %a,5
 %f=add i32 %a,6
 %p=call i32 @clobber(i32 %a)
 %u1=add i32 %p,1
 %u2=add i32 %p,2
 %u3=add i32 %p,3
 %u4=add i32 %p,4
 %u5=add i32 %p,5
 %u6=add i32 %p,6
 %s1=add i32 %u1,%u2
 %s2=add i32 %u3,%u4
 %s3=add i32 %u5,%u6
 %s4=add i32 %s1,%s2
 %s5=add i32 %s4,%s3
 %q=add i32 %b,%c
 %r=add i32 %d,%e
 %s=add i32 %q,%r
 %t=add i32 %s,%f
 %out=add i32 %t,%s5
 ret i32 %out
}''',53)

    def test_global_phi_rotation_under_register_pressure(self):
        # Six simultaneous loop values plus an induction variable exceed the
        # five allocatable registers. Parallel copies must also preserve spills.
        self.ir('''define i32 @main() {
entry:
 br label %loop
loop:
 %a=phi i32 [1,%entry],[%b,%loop]
 %b=phi i32 [2,%entry],[%c,%loop]
 %c=phi i32 [3,%entry],[%d,%loop]
 %d=phi i32 [4,%entry],[%e,%loop]
 %e=phi i32 [5,%entry],[%f,%loop]
 %f=phi i32 [6,%entry],[%a,%loop]
 %n=phi i32 [0,%entry],[%next,%loop]
 %next=add i32 %n,1
 %more=icmp ult i32 %next,4
 br i1 %more,label %loop,label %done
done:
 %t1=mul i32 %b,10
 %t2=mul i32 %c,100
 %t3=mul i32 %d,1000
 %t4=mul i32 %e,10000
 %t5=mul i32 %f,100000
 %s1=add i32 %a,%t1
 %s2=add i32 %s1,%t2
 %s3=add i32 %s2,%t3
 %s4=add i32 %s3,%t4
 %result=add i32 %s4,%t5
 ret i32 %result
}''',321654)

    def test_frameless_leaf_preserves_parent_frame_pointer(self):
        text, _ = self.ir('''define i32 @leaf(i32 %x) {
 %a=mul i32 %x,7
 %b=add i32 %a,3
 ret i32 %b
}
define i32 @main() {
 %storage=alloca i32
 store volatile i32 19,ptr %storage
 %v=call i32 @leaf(i32 6)
 %saved=load volatile i32,ptr %storage
 %result=add i32 %v,%saved
 ret i32 %result
}''',64)
        leaf = text.split('; function leaf,')[1].split('; function ')[0]
        self.assertNotIn('push r13',leaf)
        self.assertNotIn('pop r13',leaf)

    def test_loop_phi_survives_conditional_indirect_calls(self):
        self.c('''static __attribute__((noinline)) unsigned mix(unsigned a,unsigned b){return a*7+b;}
unsigned (*volatile callback)(unsigned,unsigned)=mix;
int main(void){unsigned sum=3,keep=17;
for(unsigned i=0;i<12;++i){
 if(i&1)sum=callback(sum,i)+keep;else sum+=i*13;
 keep+=i+1;
}return sum^keep;}''',1345077,opts=('1',))

    def test_executor_profile_excludes_instruction_fetch(self):
        program=assemble('''mov sp,4096
call f
stop:
jmp stop
f:
cmp zr,1
je fallthrough
fallthrough:
push r13
mov r13,sp
store_8 [1024],r1
load_8 r1,[1024]
pop r13
ret
''')
        m=Machine(program,profile=True,stack_top=4096)
        self.assertEqual(m.run(100,stop_labels=('stop',)).reason,'breakpoint')
        self.assertEqual(m.stats,dict(loads=3,stores=3,load_bytes=9,store_bytes=9,
                                    branches=3,taken_branches=2,max_stack_bytes=8))

    def test_call_site_preserves_hot_value_and_eight_argument_indirect_result(self):
        self.c('''static __attribute__((noinline)) unsigned clobber(unsigned a,unsigned b,
unsigned c,unsigned d,unsigned e,unsigned f,unsigned g,unsigned h){
return (a+b)*(c+d)^((e+f)*(g+h));}
unsigned (*volatile callback)(unsigned,unsigned,unsigned,unsigned,unsigned,unsigned,unsigned,unsigned)=clobber;
int main(void){unsigned keep=symphony_in()*17+5;
unsigned r=callback(1,2,3,4,5,6,7,8);
for(unsigned i=0;i<8;++i)symphony_out(keep+i);
return r^keep;}''',176^2096,inputs=[123],outputs=range(2096,2104),opts=('1','2'))

    def test_threeway_intrinsics_and_unused_wide_casts(self):
        self.ir('''declare i2 @llvm.scmp.i2.i8(i8, i8)
declare i2 @llvm.ucmp.i2.i32(i32, i32)
define i32 @main() {
 %dead1=zext i8 1 to i64
 %dead2=add i64 %dead1,4
 %a=call i2 @llvm.scmp.i2.i8(i8 -1,i8 1)
 %b=sext i2 %a to i32
 %c=call i2 @llvm.ucmp.i2.i32(i32 -1,i32 1)
 %d=sext i2 %c to i32
 %e=call i2 @llvm.scmp.i2.i8(i8 7,i8 7)
 %f=sext i2 %e to i32
 %x=add i32 %b,3
 %y=mul i32 %d,10
 %z=add i32 %x,%y
 %result=add i32 %z,%f
 ret i32 %result
}''',12)

    def test_time_snapshot(self):
        program=assemble('''time_1 r1\ntime_0 r2\ntime_1 r3\nstop:\njmp stop\n''')
        m=Machine(program,time_ns=lambda step:0x1122334455667788+step)
        m.run(20,stop_labels=('stop',))
        self.assertEqual(m.registers[1:4],[0,0x55667789,0x11223344])

    def test_unsigned_saturating_subtract(self):
        self.ir('''declare i32 @llvm.usub.sat.i32(i32,i32)
declare i8 @llvm.usub.sat.i8(i8,i8)
define i32 @main(){
 %a=call i32 @llvm.usub.sat.i32(i32 95,i32 96)
 %b=call i32 @llvm.usub.sat.i32(i32 96,i32 96)
 %c=call i32 @llvm.usub.sat.i32(i32 -1,i32 1)
 %d=call i8 @llvm.usub.sat.i8(i8 1,i8 -1)
 %e=call i8 @llvm.usub.sat.i8(i8 -1,i8 1)
 %de=zext i8 %d to i32
 %ee=zext i8 %e to i32
 %s1=add i32 %a,%b
 %s2=add i32 %c,%de
 %s3=add i32 %s1,%s2
 %result=add i32 %s3,%ee
 ret i32 %result
}''',252)

    def test_alias_pc_stack_and_encoding(self):
        program=assemble('''mov sp,4096\ncall f\nstop:\njmp stop\nf:\nret\n''')
        self.assertEqual(program.symbols['stop'],24)
        self.assertEqual(program.symbols['f'],28)
        self.assertEqual(len(program.image),40)
        m=Machine(program);m.run(50,stop_labels=('stop',))
        self.assertEqual(m.pc,24);self.assertEqual(m.registers[14:],[4096,24])
        self.assertEqual(m.read(4092,4),24)
        self.assertEqual(assemble('mul r3,r1,r2').image,bytes.fromhex('2c310200'))

    def test_generated_display_examples(self):
        for name in ('hello', 'typewriter'):
            with self.subTest(example=name), tempfile.TemporaryDirectory() as tmp:
                asm=Path(tmp)/'example.asm'
                p=subprocess.run([sys.executable,str(ROOT/'tools/symphony-cc'),
                                  str(ROOT/'examples'/f'{name}.c'),'-o',str(asm),
                                  '-O1','--backend',str(BACKEND)],capture_output=True,text=True)
                self.assertEqual(p.returncode,0,p.stderr)
                m=Machine(assemble(asm.read_text()),keyboard=[0x161,0x061,0x162])
                result=m.run(10000)
                base=m.screen[1]
                self.assertEqual(m.screen[0],0)
                self.assertEqual(m.screen[2],0xffffff)
                if name=='hello':
                    self.assertEqual(result.reason,'breakpoint')
                    self.assertEqual(m.memory[base:base+10],b'Hello from')
                else:
                    self.assertEqual(result.reason,'step-limit')
                    self.assertEqual(m.memory[base:base+3],b'ab\0')

    def test_typewriter_newline_backspace_wrap_scroll(self):
        with tempfile.TemporaryDirectory() as tmp:
            asm=Path(tmp)/'typewriter.asm'
            p=subprocess.run([sys.executable,str(ROOT/'tools/symphony-cc'),
                              str(ROOT/'examples/typewriter.c'),'-o',str(asm),
                              '-O1','--backend',str(BACKEND)],capture_output=True,text=True)
            self.assertEqual(p.returncode,0,p.stderr)
            program=assemble(asm.read_text())
            def run(events):
                m=Machine(program,keyboard=events)
                base=None
                # Stop at the next poll AFTER all supplied events have finished,
                # including any final scroll. Do not stop on queue exhaustion alone.
                for _ in range(2_000_000):
                    if not m.keyboard and m.read(m.pc,4)>>24==3:
                        break
                    m.step()
                    if 1 in m.screen and base is None:
                        base=m.screen[1]
                        m.memory[base-1]=0xa5
                        m.memory[base+3840]=0x5a
                else:
                    self.fail('typewriter did not finish handling keyboard events')
                self.assertEqual(m.memory[base-1],0xa5)
                self.assertEqual(m.memory[base+3840],0x5a)
                return bytes(m.memory[base:base+3840])
            down=lambda text:[0x100|ord(ch) for ch in text]
            with self.subTest(case='empty backspace'):
                self.assertEqual(run([0x10d]),bytes(3840))
            with self.subTest(case='delete and ignore releases'):
                frame=run([0x161,0x061,0x162,0x10d,0x00d,0x163])
                self.assertEqual(frame[:4],b'ac\0\0')
            with self.subTest(case='enter is 10'):
                frame=run(down('a')+[0x10a]+down('b'))
                self.assertEqual(frame[:2],b'a\0')
                self.assertEqual(frame[96:98],b'b\0')
            with self.subTest(case='enter release ignored'):
                self.assertEqual(run(down('a')+[0x00a]+down('b'))[:3],b'ab\0')
            with self.subTest(case='automatic wrap after 96 characters'):
                frame=run(down('x'*96+'y'))
                self.assertEqual(frame[:97],b'x'*96+b'y')
            with self.subTest(case='backspace across automatic wrap'):
                frame=run(down('x'*96)+[0x10d]+down('y'))
                self.assertEqual(frame[:97],b'x'*95+b'y\0')
            with self.subTest(case='newline scroll'):
                events=[]
                for row in range(40):events+=down(chr(65+row%26))+[0x10a]
                frame=run(events+down('Z'))
                for row in range(39):
                    self.assertEqual(frame[row*96],65+(row+1)%26)
                    self.assertEqual(frame[row*96+1:(row+1)*96],bytes(95))
                self.assertEqual(frame[39*96:],b'Z'+bytes(95))
            with self.subTest(case='full-screen automatic wrap scroll'):
                frame=run(down('x'*3840))
                self.assertEqual(frame,b'x'*3744+bytes(96))

    def test_implicit_zero_tail_and_internal_gap(self):
        text, program = self.ir('''@head = global [4096 x i8] zeroinitializer
@marker = global [2 x i8] [i8 7, i8 9]
@tail = global [4096 x i8] zeroinitializer
define i32 @main() {
 %a = load i8, ptr @head
 %b = load i8, ptr getelementptr ([2 x i8], ptr @marker, i32 0, i32 1)
 %c = load i8, ptr getelementptr ([4096 x i8], ptr @tail, i32 0, i32 4095)
 %x = add i8 %a, %b
 %y = add i8 %x, %c
 %v = zext i8 %y to i32
 ret i32 %v
}''', 9)
        self.assertLess(len(text.splitlines()), 150)
        self.assertEqual(len(program.image), 65536+4096+2)
        self.assertEqual(program.image[65536:65536+4096], bytes(4096))
        self.assertEqual(program.image[-2:], bytes([7, 9]))
        self.assertNotIn('__sym_init_bss', text)

    def test_all_zero_globals_need_no_image_data(self):
        text, program = self.ir('''@buffer = global [8192 x i8] zeroinitializer
define i32 @main() {
 %a = load i8, ptr getelementptr ([8192 x i8], ptr @buffer, i32 0, i32 8191)
 %v = zext i8 %a to i32
 ret i32 %v
}''', 0)
        self.assertLess(len(program.image), 65536)
        self.assertNotIn('U8 ', text)
        self.assertNotIn('\n@', text)
        self.assertNotIn('__sym_init_bss', text)

    def test_diagnostics(self):
        self.rejects('target datalayout="e-p:64:64"\ndefine i32 @main(){ret i32 0}', 'big-endian')
        self.rejects(LAYOUT+'define i64 @main(){ret i64 0}', '32 bits')
        self.rejects(LAYOUT+'declare i32 @missing()\ndefine i32 @main(){%v=call i32 @missing()\nret i32 %v}', 'unresolved function')
        self.rejects(LAYOUT+'define i32 @main(){%p=alloca i32,i32 undef\n%x=load volatile i32,ptr %p\nret i32 0}', 'fixed-size')
        with self.assertRaisesRegex(ValueError,'outside U16'):assemble('mov r1,65536')
        with self.assertRaisesRegex(ValueError,'division'):Machine(assemble('div r1,zr,zr')).step()

if __name__=='__main__':unittest.main()

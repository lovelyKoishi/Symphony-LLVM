# 首版 LLVM 后端实现

## 1. 实现结构

| 文件 | 用途 |
| --- | --- |
| `src/backend.cpp` | 使用 LLVM IRReader、Verifier、DataLayout 解析并降低 typed IR |
| `tools/symphony-cc` | 调用 Clang，生成布局正确的 IR，运行后端并验证最终汇编编码 |
| `tools/symphony_machine.py` | 依据当前 ISA 定义装配，再按实际机器字执行 |
| `include/symphony.h` | 无须链接库的设备接口与实测键码 |
| `runtime/libc/*.c` | 常用 C 函数及 TTY stdio，驱动 `--libc` 自动链接 |
| `include/gfx.h`、`runtime/gfx.c` | 整数 2D 图形与屏幕裁剪，驱动 `--gfx` 自动链接 |
| `include/tty.h`、`runtime/tty.c` | 规范模式行规程和显示输出；驱动 `--tty` 自动链接 |
| `tests/test_toolchain.py` | C/IR → 汇编 → 机器字端到端回归 |
| `examples/*.c` | 乘除余、字符串显示、最简单的打字机 |

该后端是 standalone IR code generator，尚不是 LLVM TargetMachine/SelectionDAG/TableGen/MC target，也没有修改 Clang 或 lld。输出是游戏汇编文本；附带的汇编器可导出大端 flat binary，不产生 ELF 对象。

使用 LLVM 官方解析库而不是字符串匹配，因此能理解 SSA 引用、类型、常量表达式、块引用及已验证的 IR 结构。遇到未支持指令/类型会报错，不静默忽略。

## 2. 前端与 C 数据模型

驱动使用：

```text
--target=armeb-none-eabi -march=armv7-a -mfloat-abi=soft
-std=c11 -ffreestanding -fno-builtin -fno-stack-protector
-fno-vectorize -fno-slp-vectorize -S -emit-llvm
```

借用 Clang 大端 ARM32 的**前端 C 类型和布局**，不生成 ARM 机器码。所得到的 `E-...p:32:32...` DataLayout 原样供后端查询数组步长、结构体填充、GEP 与全局初始化。没有在小端优化之后替换 DataLayout。

当前 C 尺寸：char 8、short 16、int/long 32、pointer 32；long long 由前端定义为 64 位，但后端目前拒绝其存储/运算，不宣称支持。普通 char 使用该前端的 unsigned-char 约定；有符号字节用 `signed char`/`int8_t` 显式表示。

不是完整 ARM EABI：实际寄存器参数和返回约定是下节的 Symphony 私有 ABI。Clang 已经做过的聚合参数/返回 ABI lowering 可能包含 byval/sret 等，首版对此显式拒绝；不能把对局部结构体布局的支持说成完整聚合传参兼容。

IR 入口工具接受 `.ll/.bc`，要求有大端、32 位指针的 DataLayout。对宿主小端/64 位 IR 报错；仅满足端序和指针宽度还不足以保证任意外部 IR 都符合本 C ABI，直接 IR 使用者须保证完整类型/对齐约定一致。

参考：[Clang 跨平台编译](https://clang.llvm.org/docs/CrossCompilation.html)、[LLVM Language Reference](https://llvm.org/docs/LangRef.html)。

## 3. 选定的 Symphony 私有 ABI

| 用途 | 首版约定 |
| --- | --- |
| 第 1..6 个标量参数 | r1..r6；窄整数按低位位串传递 |
| 第 7 个及以后参数 | caller 逆序压栈，每项 4 字节 |
| 返回值 | r1，最多 32 位；void 返回时置 0 |
| r1..r12 | caller-clobbered；r7..r11 可保存跨块/循环的值；跨调用值可按收益在调用点保存/恢复；低收益及溢出值保留栈槽 |
| r13 | frame pointer，callee 保存并恢复 |
| flags | caller-clobbered；不跨调用保存比较结果 |
| sp | 向下增长；返回地址使用当前 ISA 的 call/ret 布局 |
| 栈对齐 | 调用前 8 字节；额外参数为奇数项时在参数之外补 4 字节 |
| entry | 默认定义为无参数 `main`，可用 `--entry` 修改 |

这与游戏两参数教学示例是不同的软件 ABI，不能把按另一约定手写的函数直接混用。

callee 入口时 sp 指向返回地址：

```text
更高地址
    可选参数对齐填充
    第 8 参数（若存在）
    第 7 参数（若存在）
    返回地址                  ← call 后的 sp
    保存的旧 r13              ← push r13 后的新 sp / 新 r13
    局部对象、SSA 槽、PHI 暂存
更低地址                      ← 分配整个 frame 后的 sp
```

因此第 7 参数在 `r13+8`，第 8 在 `r13+12`。返回序列是 `mov sp,r13; pop r13; ret`；caller 回收额外参数与对齐填充。每次递归都有独立帧。

间接调用显式装入返回标签、push 返回地址，然后 `jmp` 函数地址；不输出当前 ISA 不存在的 `call rN`。函数地址作为全局初始化数据时，在计算完函数机器码偏移后写入大端指针。

对全函数的标量 SSA 值和参数做 CFG 活跃分析，以图着色分配 r7..r11，并按循环深度加权选择溢出值。PHI 输入按前驱边归属；跨块和循环的值可留在寄存器。为兼容 caller-clobbered ABI，跨真实调用的高频值在调用前存入专用槽、返回后恢复；低收益值继续保留栈 home，内联设备及 intrinsic 不造成此类保存。保存槽按物理寄存器复用，递归时归属于各自的帧。已无用户的结果不写回。PHI 复制根据物理寄存器/栈槽依赖排序，跳过同位置复制，仅对剩余循环依赖使用暂存槽。局部固定大小对象采用 LLVM DataLayout 与实际 alloca 对齐，最大帧 65520 字节、最大局部对象对齐 8。

## 4. 程序布局

| 区域 | 默认地址/行为 |
| --- | --- |
| 启动及函数代码 | 从 0 开始，所有直接目标必须小于 65536 |
| 初始化全局数据 | 从 65536（0x10000）开始，按对象对齐，最大结束地址不超过 0x800000 |
| 初始栈顶 | 0x1000000，首次 push 后进入实际主存顶端 |
| 屏幕缓冲区 | 普通 C 数组，不强制固定为 0x8000 |
| 程序结束 | main 返回后停在显式 `__sym_halt: jmp __sym_halt` |
| LLVM unreachable | 跳到 `__sym_trap`；参考执行器将其报告为错误 |

栈顶 0x1000000 是向下增长栈的空栈边界值，不在该地址先 store。sp 是 32 位，物理主存仍按 24 位字节索引寻址。

全局对象的完整大小与对齐仍参与地址分配；序列化时省略末尾连续的零，依赖用户确认的“程序映像之外的主内存启动时为 0”，不生成额外清零代码。后面还有非零初始化值的内部零区间用 `@地址` 保留偏移。初始化过程处理整数、数据指针、函数指针、常量 GEP、数组和结构体；不复用宿主的小端序列化。非零数据及短填充使用 U8，避免对汇编器宽数据字面值边界的依赖。

`--stack-top` 可调整栈顶；驱动与后端均支持 `--data-base`，限制 8 字节对齐、至少 4096 且至多 0x800000。修改布局必须保证代码、数据、帧缓冲区与实际运行栈不冲突。当前没有运行时栈溢出保护；递归太深可能覆盖数据。

因为直接调用/分支只编码 U16，代码超过范围时拒绝，而不是截断或声称支持任意大小程序。驱动最后再次用 ISA 装配验证每个标签和立即数。

## 5. 指令降低

- add/sub/bitwise/shift/mul/udiv/urem → 对应硬件指令。
- sdiv/srem → 先对两个源取 32 位符号掩码，算无符号绝对值，执行 div/mod，再恢复商或余数符号。余数跟随被除数。
- signed 窄整数比较/右移先符号扩展；普通窄运算和结果槽规范化为低 N 位。
- load/store 按 i1/i8/i16/i32/ptr 选择 8/16/32 位；符号扩展由独立 IR cast 处理。
- GEP 使用 LLVM DataLayout 的常量及变量偏移，变量步长可选原生 mul；负索引正确扩展到 32 位。
- icmp → cmp 与正确 signed/unsigned 分支，产生规范化的 0/1。
- br/switch/select → 显式标签与分支；PHI 在对应 CFG 边上处理。
- LLVM memcpy/memmove/memset intrinsic → byte 循环，memmove 选择前/后方向处理重叠；链接的 libc memcpy/memset 另有对齐 word 快速路径。
- 常见 smin/smax/umin/umax/scmp/ucmp/abs/expect、生命周期/assume 与 noalias scope 声明已处理。

LLVM 的 nsw/nuw/inbounds 等限制仍由 LLVM IR 语义决定；后端不承诺对源程序未定义行为给出 C 级错误。硬件除零和移位越界仍未确认，参考执行器对此停止诊断。

## 6. C 设备接口

```c
#include "symphony.h"

unsigned event = symphony_keyboard();
unsigned pressed = event & SYMPHONY_KEY_DOWN;
unsigned key = event & SYMPHONY_KEY_MASK;
/* 用户实测：KEY_ENTER=10，KEY_BACKSPACE=13。 */

symphony_screen(0, SYMPHONY_ASCII8);
symphony_screen(1, (uintptr_t)framebuffer);
symphony_screen(2, 0x00ffffff);
symphony_screen(3, 0);
symphony_out(value);
```

这些名称保留为后端设备接口，声明本身无须链接外部库。screen 的第一个参数是设置索引值。设备调用保留为有副作用的外部调用，Clang 不会把 keyboard/time 轮询当纯函数移走。

`time_low()` 刷新快照，`time_high_cached()` 只取缓存。两次返回的 32 位值可分别使用；把它们在 C 中拼成 uint64_t 目前会触发后端的 64 位限制。

## 7. 参考汇编器/执行器的实际范围

当前工具依据 `isa/spec.isa` 编码，并验证基础机器码。支持标签、const、前向 @ 零填充、U<n>、ASCII 字符串、行/非嵌套块注释和全部当前别名。

CPU 核心按机器字执行大端 load/store、PC、寄存器、栈别名的实际展开、无符号乘除余、比较与跳转、键盘/输入/时间和持久内存设备。支持输入脚本和确定性时钟；默认持久设备容量显式取 1 MiB 作为测试配置，**不声称是硬件容量**。

它还没有完整游戏 ISA-language 的 patterns/虚拟操作数/include/pub，没有门级延迟，没有字体/像素画面渲染，没有完整寄存器变化 trace/监视点 UI。screen 调用记录设置和事件，测试直接检查 framebuffer 字节。`docs/executor.md` 中未实现的调试/记录要求仍是后续目标。

`__sym_halt` 是测试框架约定的断点，不是硬件停机。普通自循环会达到步数预算，不能自动判成功。除零/大移位/非规范机器码给出诊断，不能把诊断声称为真实电路异常。

## 8. 验证与限制

回归以已知 C/IR 结果和固定编码/地址向量为 oracle；不是只让编译器和执行器对比彼此输出。覆盖 O0/O1 编译、递归/多参数、负数除法/余数、INT_MIN、窄整数、GEP/负索引、数组/结构体大端布局、全局函数指针、PHI 交换、memmove 重叠、设备与时间快照。

尚无游戏硬件差分运行结果。应在本地 newtech 依次打开生成的 arithmetic/hello/typewriter 示例确认实际表现。字体编号、模式切换保留、设备非法参数等未因本后端实现而自动变成已确认行为。

明确不支持：i64/浮点/向量、TLS、全局 alias/ifunc、非零地址空间、原子、varargs、inline asm、musttail、动态/非入口 alloca、byval/sret/inalloca 聚合 ABI、异常/invoke、任意 intrinsic、完整 libc 与目标对象链接。未支持时应返回非零并保留原输出文件，不输出不完整汇编。

后端提供全函数活跃分析和图着色寄存器分配，并以指定 entry 为根做 LLVM GlobalDCE，移除不可达函数及数据（包括保留函数指针所需的依赖）。目前不使用 callee-saved 寄存器分配；已支持调用点保存/恢复与低收益值保留栈 home，尚未实现完整指令选择优化。

规范模式 TTY 的多源文件 IR 链接、缓冲区和输出约定见 [tty.md](tty.md)。

2D 图形库的坐标、颜色与裁剪约定见 [gfx.md](gfx.md)。

常用 C 库子集及 `--libc` 的接口和边界见 [libc.md](libc.md)。

## 指令选择与循环边优化

后端直接使用已分配的操作数和结果寄存器，减少经 r1/r2 中转的 mov；r11 可参与分配，跨调用存活时由调用点保存/恢复，间接调用仍在参数准备后使用它。比较只被紧邻的条件分支使用时直接产生 cmp 与对应跳转；有其他使用或间隔指令时保留布尔值。窄有符号比较/右移在临时寄存器内符号扩展，不覆盖仍活跃的原值。

可交换运算将整型常数放右侧并使用 U16 立即数形式；2 的幂常数乘法和无符号除法分别使用移位，无符号余数使用掩码。动态 GEP 的常数步长使用移位或立即数乘法。有符号除法/余数继续按原有符号处理实现。全函数寄存器分配与通用基准结果见 [optimization.md](optimization.md)。

甜甜圈相同 O1、无诊断的双帧指令数从 24,155,038 降到 14,123,389（减少 41.53%，等周期模型约 1.71 倍速度）；O2/O3 的额外变化很小。完整数据与复现命令见 [ports.md](ports.md)。验证包含普通回归及常数边界、所有整数比较谓词、PHI 交换、调用存活值、窄整数符号处理，以及真实上游双帧差分。

无 spill、局部对象、PHI 暂存、真实函数调用且不读取栈实参的叶子函数会省略 frame pointer 的保存/建立/恢复；否则继续使用原有帧布局，以保持调用前 8 字节对齐和栈实参偏移正确。未使用参数和融合比较不分配栈槽。

后端支持 LLVM `usub.sat`（<=32 位无符号饱和减法）：比较后选择 a−b 或 0，用于 Clang 将屏幕锚点边界保护优化成该 intrinsic 的情况；覆盖 i8/i32 的小于、等于及高位边界。

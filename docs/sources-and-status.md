# 证据来源、确认范围与后续验证

## 1. 本阶段结果

本页记录第一阶段交付时的证据状态。第一阶段建立当前 newtech 的架构、汇编器、执行器契约与 ABI 边界文档。随后已开始实现独立 LLVM IR 后端与参考执行器，当前实现范围见 [backend.md](backend.md)。之前为编译器准备的 CMake 骨架已撤下，避免把尚未实现的目标留作可构建入口。

确认时间：2026-11-08，Asia/Shanghai。当前 ISA 快照共 76 种汇编形式：72 种 4 字节、2 种 8 字节、1 种 12 字节、1 种 20 字节。

```text
isa/spec.isa SHA-256
1227abe5ef896d5dede01272ddf4a426bb452406b08d539475fcd920868518e9
```

本地 ISA 在本次会话期间更新过：早先读取的版本没有末尾的别名段；重新读取的当前版本已包含 `mov/neg/not/push/pop/call/ret`。本文与仓库快照采用重新读取后的版本。以后本地 ISA 再变动，应重新核对 hash 与编码表，不能沿用本次确认。

## 2. 证据等级

| 等级 | 来源 | 能够确定什么 |
| --- | --- | --- |
| 用户明确确认 | div/mod 无符号；除 mul/div/mod 外保持标准 Symphony；实测回车=10、BS=13；程序映像外主内存启动时为零；当前机器时钟 11 MHz | 当前硬件配置相对于标准设计的范围 |
| 当前 ISA | 原文语法和位串 | 合法文本形式、字段值、编码与别名长度；不是硬件接线的独立证明 |
| 游戏自带测试/说明 | 本机安装的 campaign、asset/manual | 标准 Symphony 的参考状态变化、设备与汇编规则 |
| 用户手册截图 | 两张附图 | 用户当前界面中的标签、注释、字面值、const、@ 规则 |
| 当前示例/测试源码 | newtech 的 asm | 现有程序的用法、作者的预期值；不证明这些测试已运行并通过 |
| 上游参考编译器 | 固定 Git commit 的 Python 源码和 README | 原项目的软件约定、支持范围与设计参考 |
| 本项目规定 | 执行器严格模式、诊断、运行记录等 | 后续软件应如何实现；不能冒充硬件事实 |

当前 `circuit.data` 已定位并计算 hash，但本阶段没有解码其二进制电路布局，也没有通过游戏逐线检查或执行硬件测试。当前硬件按标准解释的依据是用户确认与游戏参考模型。本文不宣称已核实电路时序、门级实现或全部边界输出。

网页检索仅用于寻找线索；文档中的标准语义以本机游戏自带材料为主要证据，不用社区网页替代当前 ISA 或用户确认。

## 3. 本地来源索引

路径前缀：

```text
SAVE = 游戏存档中的 schematics/architecture/newtech
GAME = Turing Complete 安装目录
PROJECT = 本仓库根目录
```

所有源文件的相对路径、字节数、SHA-256 已记录在 [evidence/sources.json](evidence/sources.json)。文档正文用下表 ID 引用，不必重复很长的安装路径。

| ID | 路径（相对 SAVE / GAME / 本仓库） | 重点 |
| --- | --- | --- |
| ISA | SAVE/spec.isa；快照 [../isa/spec.isa](../isa/spec.isa) | 当前 76 种文本形式及机器位串 |
| CIRCUIT | SAVE/circuit.data | 当前电路文件身份；未解码，不将其 hash 当行为证明 |
| ARITH | PROJECT/asm/diagnostics/arithmetic_test.asm | 36 个乘除余测试的源程序及预期注释，无通过记录 |
| HELLO | PROJECT/asm/diagnostics/hello_screen.asm | ASCII8 缓冲地址与 24 位 RGB 前景色用法 |
| SIMPLE | PROJECT/asm/diagnostics/mul_div_simple.asm | 7×9 和 20÷3 的简单显示程序，无通过记录 |
| ASM | GAME/asset/manual/Assembly/Assembly programming/doc.txt | 标签、字面值、const、@、include/pub |
| SETTINGS | GAME/asset/manual/Assembly/Language creation/Settings/doc.txt | 默认大端，行/块注释，RAM 自身端序配置 |
| FIELDS | GAME/asset/manual/Assembly/Language creation/Fields/doc.txt | 自定义字段、保留 immediate/label |
| ISA-LANG | GAME/asset/manual/Assembly/Language creation/doc.txt | 顺序匹配语法、位串替换 |
| ISA-INST | GAME/asset/manual/Assembly/Language creation/Instructions/doc.txt | 虚拟操作数、断言、位切片、$start/$end |
| OPS | GAME/asset/manual/Assembly/Language creation/Instructions/Operators/doc.txt | 汇编计算运算符，不是机器操作码表 |
| SCREEN | GAME/asset/manual/Circuits/The screen/doc.txt | 四种模式、单元字节布局、设置、分辨率 |
| KEYBOARD | GAME/asset/manual/Circuits/The keyboard/doc.txt | 按下/松开、本地化和位置模式 |
| REF | GAME/campaign/symphony_8_io_devices/test.si | 完整标准取指/执行参考、主存 24 位掩码、大端、设备行为 |
| IO | GAME/campaign/symphony_8_io_devices/meta.txt | Unix 纳秒时间、time_0 缓存及 time_1 |
| ALU | GAME/campaign/symphony_alu/test.si | 标准 ALU 的 0..10 操作和有效移位范围 |
| CMP | GAME/campaign/symphony_cmp/test.si | E/U/S 三位的公式 |
| COND | GAME/campaign/symphony_condition_test/test.si | 条件位匹配/取反公式 |
| PC | GAME/campaign/symphony_counter_1/test.si | 32 位计数器正常 +4、跳转覆盖与当前地址输出 |
| RAM | GAME/campaign/symphony_6_ram/meta.txt | 8/16/32 位访存、程序与数据共用主存、端口顺序 |
| SSD | GAME/campaign/symphony_7_ssd/meta.txt | 独立持久内存、pload/pstore |
| STACK | GAME/campaign/symphony_10_stack/meta.txt | push/pop 展开与栈向下增长 |
| FUNC | GAME/campaign/symphony_11_functions/meta.txt | call/ret 是多机器指令别名，调用约定由软件制定 |
| GAME-ABI | GAME/campaign/symphony_11_functions/new_program.asm | 教学示例的 r1/r2 参数、r1 返回、通用寄存器保存 |

后续电路层检查还应覆盖 SAVE 依赖的自定义 foundry 组件；目前没有取得它们的完整接线审计，不把源路径遍历等同于验证。

## 4. 上游参考固定版本

仓库：[lovelyKoishi/Symphony-compiler](https://github.com/lovelyKoishi/Symphony-compiler)。本次读取版本：`dadbbed5ec43c5f6ab513e9f369206aaab680260`。

阅读了该版本的 README、`melc/compiler.py`、`melc/llvm_ir.py`，并检查仓库目录树。只参考其语言/寄存器分工和设备调用方式，没有复制其编译器代码到本项目。

原仓库的“最多六参数”“六个局部寄存器”“没有通用乘除”等是原编译器的实现限制，不是当前硬件的限制。游戏示例的两参数约定和它的六参数约定分别见 [calling-convention.md](calling-convention.md)。

## 5. 已纠正的容易误读点

| 容易误读 | 本阶段确定的解释 |
| --- | --- |
| 当前 ISA 没有 push/call | 更新后的 ISA 有，且是精确定义的多机器指令别名 |
| 一行源码就是 4 字节 | 基础指令 4 字节；push/pop 8、ret 12、call 20 |
| 立即数是有符号 16 位 | 当前立即数为 U16、零扩展 |
| 立即数/指令字段只有 16 位，所以指针也只能 16 位 | 32 位寄存器地址、标准 24 位物理主存、16 位直接编码是不同层次 |
| Symphony 内存与 x86 一样小端 | 标准目标是大端，LLVM 数据布局必须匹配 |
| 普通算术自动更新 CPU 状态标志 | 只写目的寄存器；比较位由 cmp 写 flags |
| flags 是传统 Z/N/C/V | 实际是 E/U/S 三个比较结果位 |
| load_16/load_32 注释写 8 位，所以都只读 8 位 | 注释笔误，正式指令和参考模型读取 16/32 位 |
| 有 div 就能直接编译 C signed division | 当前硬件无符号，signed division/remainder 要展开 |
| ".bin" 后缀一定是机器码 | 本地 sandbox 中同名后缀文件可能是文本，不据后缀判格式 |
| 持久内存只有 1000 字节 | 1000 是参考测试模型的局部范围，实际容量未核实 |
| 游戏函数示例已经定义完整 C ABI | 只有教学约定，C 数据类型、聚合、变参等还需设计 |
| 读到 `\0` 就停止屏幕输出 | framebuffer 固定网格读取，NUL 不是硬件字符串终止协议 |

## 6. 待验证清单及具体方法

以下不阻止记录已确认语义，但在宣称“完整硬件兼容执行器”前必须逐项解决。不得把本清单写成已经通过的测试。

| 优先级 | 问题 | 建议最小观测 |
| --- | --- | --- |
| P0 | div/mod 的零除数行为 | 分别设置非零/零及 0/0，记录结果、Z/错误状态与是否推进 PC |
| P0 | 新增 div/mod 全 32 位无符号边界 | `0xffffffff/2`、`0x80000000/3`、对应 mod；同时测寄存器/立即数形式 |
| P0 | 新增 mul 溢出与目的/源重叠 | `0xffffffff*2`，d=a/d=b，与低 32 位预期对比 |
| P0 | 移位量 >=32 | 对 0x80000001 测 0、1、31、32、33、255、0xffffffff，区分饱和、低位掩码或其他结果 |
| P0 | 当前硬件布局的基础回归 | counter 当前地址、PC+4、E/U/S、大小端读写、zr 写入、push/call/ret 往返 |
| P1 | 非对齐与内存末尾 | 地址 1 的 load/store，0xfffffe 跨边界多字节访问，记录逐字节值 |
| P1 | PC 高地址/非对齐取指 | 构造已知四字节机器字，用寄存器跳转并观察取指地址和结果 |
| P1 | 持久内存实际配置与越界 | 核对组件容量/端序/地址位宽，再选最后一个合法完整字和跨边界位置 |
| P1 | 汇编数字范围 | U16 -1/65536，超过 16 位标签，直接内存标签，观察报错或截断；不覆盖正常保存文件 |
| P1 | 字面值与字符串 | U24、U40、U64、空串、\0、引号/反斜杠转义、非 ASCII、跨指令对齐 |
| P1 | @ 与符号解析 | 前向填充、向后 @、重复标签、const 重定义/作用域、include/pub 与环 |
| P2 | 非规范机器码 | 保留位为 1、没有当前语法的 opcode/字段组合；区分电路输出与严格工具诊断 |
| P2 | 屏幕设备边界 | 字体编号、非法模式/分辨率、换模式保留设置情况与默认值 |
| P2 | 键盘设备边界 | 输入模式、队列上限、重复按键、丢焦点时事件 |
| P2 | 实际硬件延迟 | 记录新增 ALU 的组合延迟与关卡运行速度；功能模拟步数不等于门级延迟 |

主内存越界与非对齐的标准参考算法已经确定；上述硬件回归用于核对当前电路实际实现，不是把它们全部改成未知。除零、越界移位、持久内存容量则确实没有足够证据给出数值结论。

## 7. 后续阶段的进入条件

下一阶段应先据这些文档选定 C 数据模型、调用 ABI、程序内存布局和 LLVM 集成路径，再实现工具。实现后至少运行 [executor.md](executor.md) 的验收向量并做游戏硬件差分。

当前文档的完整性是“已识别并记录所有当前指令形式、标准行为、软件约定和未决边界”，不等于“全部硬件边界已实测”。

## donut 实际运行反馈

用户确认显示首帧自检和低地址单帧计算版在实际电路正常运行；高地址动画曾黑屏。低地址配置为 data-base=0x8000、空栈顶=0x10000。该结果尚不能确定具体的内存/加载限制，动画正在应用同一布局验证。详见 [ports.md](ports.md)。

实机反馈补充：低地址连续动画仍黑屏，布局调整没有解决问题；目前改为带启动、帧号和 ring 进度的动画诊断版，尚待实际电路反馈。不能把模拟器通过表述为实机修复。

最终实机反馈更新：用户已定位并修复乘法电路位宽错误，随后确认连续旋转甜甜圈能运行。此前低地址布局不是已确认的修复原因。编译器优化的双帧差分结果见 ports.md；优化版实机速度仍待用户确认，不能把指令数降低写成已测得帧率提升。

通用优化第二轮增加调用点保存/恢复与 libc 对齐 word 复制/填充，八类基准结果、代码体积代价和复现用 runtime 快照见 optimization.md。此处性能数字仍来自参考执行器，未测实机时间。

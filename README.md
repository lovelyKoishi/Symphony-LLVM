# Symphony LLVM

将 freestanding C 编译为 Turing Complete `architecture/newtech` 的 Symphony 汇编：

```text
C → Clang（大端 ARM32 前端配置）→ LLVM IR → llvm2symphony → .asm
                                                        ↓
                                          ISA 汇编器 → 机器字执行验证
```

这是基于 LLVM C++ API 的**独立 IR 后端**，尚未集成成上游 LLVM 的 `llc -march=symphony` / `clang --target=symphony` target。没有用正则解析 LLVM IR。

## 构建

需要 LLVM 23+ 开发库、相匹配的 Clang、CMake、Ninja、C++17 编译器和 Python 3。

```bash
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build build
ctest --test-dir build --output-on-failure
```

若 CMake 找不到 LLVM，可加 `-DLLVM_DIR="$(llvm-config --cmakedir)"`。

## 工作区目录

- `examples/`：C 示例源码。
- `asm/`：可直接在游戏中打开的汇编。
- `build/`：本地构建目录。
- `docs/previews/`：参考执行器生成的画面预览。

汇编统一输出到本项目，不再写入游戏的电路目录。详见 [汇编目录](asm/README.md)。编译和软件测试无需安装游戏。

## 编译和运行

```bash
python3 tools/symphony-cc examples/arithmetic.c -o asm/arithmetic.asm --save-ir build/arithmetic.ll
python3 tools/symphony_machine.py asm/arithmetic.asm --run
```

预期 `out: 60 6 2`。在游戏中打开生成的 `.asm`，采用本项目 [ISA 快照](isa/spec.isa)。

```bash
# 显示 C 字符串
python3 tools/symphony-cc examples/hello.c -o asm/hello.asm

# 96×40 打字机：回车、退格、自动换行和满屏滚动；键盘设为 Localized
python3 tools/symphony-cc examples/typewriter.c -o asm/typewriter.asm

# 静止线框正方体，Pixel8 128×96，不填充面
python3 tools/symphony-cc examples/cube.c --gfx -O1 -o asm/cube.asm

# 2D 图形库：点、线、矩形边框
python3 tools/symphony-cc examples/gfx_demo.c --gfx -O1 -o asm/gfx_demo.asm

# 规范模式 TTY：回显、退格编辑、回车提交整行；输出统一整理换行
python3 tools/symphony-cc examples/tty_echo.c --tty -O1 -o asm/tty_echo.asm
# ASCII32 逐格颜色与反色光标；输入输出 API 相同
python3 tools/symphony-cc examples/tty_echo.c --tty-display ascii32 -O1 -o asm/tty_echo_ascii32.asm

# 常用 C 库：字符串、内存、整数转换和 TTY 标准字符 I/O
python3 tools/symphony-cc examples/libc_demo.c --libc -O1 -o asm/libc_demo.asm

# 移植已有程序：a1k0n 的整数版旋转 donut.c
python3 tools/symphony-cc ports/donut.c --libc -O3 --data-base 0x8000 --stack-top 0x10000 -o asm/donut.asm

# 已有正确布局的 LLVM IR / bitcode 也可直接转换
build/llvm2symphony build/arithmetic.ll -o build/from_ir.asm

# 输出实际大端机器码映像
python3 tools/symphony_machine.py asm/arithmetic.asm --binary build/arithmetic.bin
```

默认 C 编译为 `-O0`，也可用 `-O1/-O2/-O3`；优化器可能引入首版未支持的 intrinsic，此时给出错误而不生成错误代码。请使用驱动生成的大端、32 位指针 IR，不能直接传宿主 x86_64 IR。

## 示例程序

- **旋转甜甜圈**。在 Turing Complete 中打开 [donut.asm](asm/donut.asm)。[C 源码](ports/donut.c) · [动画预览](docs/previews/donut.gif)
- **BMP 查看器**。将未压缩的 24/32 位 BMP 导入持久磁盘地址 0，再运行 [bmp_viewer.asm](asm/bmp_viewer.asm)。程序自动识别图片尺寸。[使用说明](docs/bmp-viewer.md) · [示例图片](images/test_pattern.bmp)
- **简单 Shell**。支持 `help`、`echo`、`clear`、`about`、`exit`。[ASCII32 版](asm/shell.asm) · [ASCII8 版](asm/shell_ascii8.asm) · [使用说明](docs/shell.md)

其他程序见 [汇编示例](asm/README.md)。

## 当前能力

- 32 位以内整数、指针、局部数组/结构体、全局初始化及指针重定位。
- 分支、switch、select、PHI、循环、递归、直接及间接函数调用，六个以上标量参数。
- 真实栈帧、自动保存中间值，不限于原参考编译器的六个局部寄存器。
- 原生 `mul/div/mod`，C 有符号除法与取余的符号处理。
- byte/halfword/word 大端访存、符号/零扩展、常用内存 intrinsic。
- [symphony.h](include/symphony.h) 的键盘、屏幕、输入输出、时间和持久内存接口。
- [常用 C 库](docs/libc.md)：标准 string/ctype/stdlib 子集、TTY puts/getchar/putchar，以及有界整数转字符串；编译加 `--libc`。
- [2D 图形库](docs/gfx.md)：`gfx.h` 提供初始化、清屏、画点、裁剪画线和矩形边框；编译加 `--gfx`。
- [规范模式 TTY](docs/tty.md)：通过 `tty.h` 使用整行输入、回显编辑、流式输出及自动换行/滚屏；`--tty` 默认 ASCII8，`--tty-display ascii32` 选择逐格颜色后端；两者共用行规程，支持左右行编辑及可禁用的闪烁光标，也支持多个 C 源文件。

尚不支持完整 libc、浮点、64 位整数运算、向量、原子、变参、动态 alloca、完整聚合传参 ABI、ELF 链接。指令地址必须适合当前 ISA 的 16 位直接跳转；较大代码会明确报错。后端用全函数活跃分析和图着色分配 r7–r11；支持跨基本块和循环保留变量，跨调用的高频值在调用点保存/恢复，低收益值及寄存器溢出值保留栈槽。无局部栈需求的叶子函数可省略栈帧。也会移除入口不可达的库函数。

## 文档

- [C 库接口和使用示例](docs/libc.md)
- [图形库接口和使用示例](docs/gfx.md)
- [TTY 接口和使用示例](docs/tty.md)
- [后端实现、ABI、内存布局和限制](docs/backend.md)
- [架构与硬件行为](docs/architecture.md)
- [汇编器规定](docs/assembly.md)
- [全部 76 种 ISA 编码](docs/isa-encoding.md)
打字机每行 96 个字符；回车到下一行行首，退格删除前一个屏幕单元（可跨行），左上角退格无动作，满屏后上滚。`asm/typewriter.asm` 是由对应 C 源码生成的可运行版本。

第三方移植代码保留各自许可证，见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

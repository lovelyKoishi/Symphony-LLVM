# Symphony LLVM

将 freestanding C 编译为 Turing Complete 的 Symphony 汇编。驱动调用 Clang 生成 LLVM IR，再由独立后端 `llvm2symphony` 生成汇编。项目附带汇编器和参考仿真器。

## 构建

需要 LLVM 23+ 开发库、相匹配的 Clang、CMake、Ninja、C++17 编译器和 Python 3。

```bash
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build build
ctest --test-dir build --output-on-failure
```

若 CMake 找不到 LLVM，可加 `-DLLVM_DIR="$(llvm-config --cmakedir)"`。

## 编译和运行

```bash
python3 tools/symphony-cc examples/arithmetic.c -o build/arithmetic.asm
python3 tools/symphony_machine.py build/arithmetic.asm --run
```

预期输出为 `out: 60 6 2`。也可在 Turing Complete 中使用项目的 [ISA 定义](isa/spec.isa) 打开生成的汇编。运行 `python3 tools/symphony-cc --help` 可查看编译选项。LLVM IR 输入格式见 [后端文档](docs/backend.md)。

## 示例程序

- **旋转甜甜圈**。在 Turing Complete 中打开 [donut.asm](asm/donut.asm)。[C 源码](ports/donut.c) · [动画预览](docs/previews/donut.gif)
- **BMP 查看器**。将未压缩的 24/32 位 BMP 导入持久磁盘地址 0，再运行 [bmp_viewer.asm](asm/bmp_viewer.asm)。程序自动识别图片尺寸。[使用说明](docs/bmp-viewer.md) · [示例图片](images/test_pattern.bmp)
- **简单 Shell**。支持 `help`、`echo`、`clear`、`about`、`exit`。[ASCII32 版](asm/shell.asm) · [ASCII8 版](asm/shell_ascii8.asm) · [使用说明](docs/shell.md)

其他程序见 [汇编示例](asm/README.md)。

## 支持范围

支持 32 位以内的整数、指针、数组、结构体、递归和函数指针。运行库提供设备接口、常用 C 库函数、TTY 和 2D 图形。浮点、64 位整数运算、可变参数和完整 libc 尚未支持。

## 文档

- [C 库接口和使用示例](docs/libc.md)
- [图形库接口和使用示例](docs/gfx.md)
- [TTY 接口和使用示例](docs/tty.md)
- [后端实现、ABI、内存布局和限制](docs/backend.md)
- [架构与硬件行为](docs/architecture.md)
- [汇编器规定](docs/assembly.md)
- [全部 76 种 ISA 编码](docs/isa-encoding.md)

第三方移植代码保留各自许可证，见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

# Symphony 汇编程序

- 根目录：arithmetic、hello、typewriter、tty_echo、gfx_demo、cube、libc_demo、donut。`tty_echo.asm` 为 ASCII8，`tty_echo_ascii32.asm` 为 ASCII32，均带可见光标。
- `donut.LICENSE.txt`：甜甜圈上游许可证，适用于这里的对应程序。

游戏中直接打开本目录的汇编。C 源码在 [examples](../examples)，甜甜圈源码在 [ports](../ports)。打字机使用 Localized 键盘模式。

旋转甜甜圈可直接运行 [donut.asm](donut.asm)。

在项目根目录运行下列命令可重新编译示例。

```bash
python3 tools/symphony-cc examples/hello.c -o build/hello.asm
python3 tools/symphony-cc examples/typewriter.c -o build/typewriter.asm
python3 tools/symphony-cc examples/cube.c --gfx -O1 -o build/cube.asm
python3 tools/symphony-cc examples/gfx_demo.c --gfx -O1 -o build/gfx_demo.asm
python3 tools/symphony-cc examples/tty_echo.c --tty -O1 -o build/tty_echo.asm
python3 tools/symphony-cc examples/tty_echo.c --tty-display ascii32 -O1 -o build/tty_echo_ascii32.asm
python3 tools/symphony-cc examples/libc_demo.c --libc -O1 -o build/libc_demo.asm
python3 tools/symphony-cc ports/donut.c --libc -O3 --data-base 0x8000 --stack-top 0x10000 -o build/donut.asm
```

简单 Shell：[shell.asm](shell.asm) 使用 ASCII32，[shell_ascii8.asm](shell_ascii8.asm) 使用 ASCII8。命令与编译说明见 [shell.md](../docs/shell.md)。

通用 BMP 查看器：[bmp_viewer.asm](bmp_viewer.asm)，直接读取完整 BMP 文件并自动设置尺寸，换图不重新编译。测试文件为 [test_pattern.bmp](../images/test_pattern.bmp)，格式范围和导入方法见 [bmp-viewer.md](../docs/bmp-viewer.md)。

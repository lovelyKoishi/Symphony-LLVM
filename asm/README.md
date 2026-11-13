# Symphony 汇编程序

- 根目录：arithmetic、hello、typewriter、tty_echo、gfx_demo、cube、libc_demo、donut。`tty_echo.asm` 为 ASCII8，`tty_echo_ascii32.asm` 为 ASCII32，均带可见光标。
- `donut.LICENSE.txt`：甜甜圈上游许可证，适用于这里的对应程序。

游戏中直接打开本目录的汇编。C 源码在 `../examples/`，甜甜圈在 `../ports/`。编译命令见项目 README。

旋转甜甜圈可直接运行 [donut.asm](donut.asm)。

简单 Shell：[shell.asm](shell.asm) 使用 ASCII32，[shell_ascii8.asm](shell_ascii8.asm) 使用 ASCII8。命令与编译说明见 [shell.md](../docs/shell.md)。

通用 BMP 查看器：[bmp_viewer.asm](bmp_viewer.asm)，直接读取完整 BMP 文件并自动设置尺寸，换图不重新编译。测试文件为 [test_pattern.bmp](../images/test_pattern.bmp)，格式范围和导入方法见 [bmp-viewer.md](../docs/bmp-viewer.md)。

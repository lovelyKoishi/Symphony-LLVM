# Symphony 汇编程序

已有文件从原游戏电路目录迁入，迁移时内容逐字节保持一致。两个 tty_echo 示例随后使用当前双后端 TTY 重新生成。它们保留了当时的编译版本，不会因更新后端而自动改变；重新编译才使用当前优化。

- 根目录：arithmetic、hello、typewriter、tty_echo、gfx_demo、cube、libc_demo、donut。`tty_echo.asm` 为 ASCII8，`tty_echo_ascii32.asm` 为 ASCII32，均带可见光标。
- `diagnostics/`：ALU 与显示自检、单帧及带统计的甜甜圈、早期算术测试。
- `donut.LICENSE.txt`：甜甜圈上游许可证，适用于这里的对应程序及诊断变体。

游戏中直接打开本目录的汇编。C 源码在 `../examples/`，甜甜圈在 `../ports/`。编译命令见项目 README；输出放在这里，不写入游戏电路目录。

例如，在项目根目录重新生成连续旋转版：

```bash
python3 tools/symphony-cc ports/donut.c --libc -O3 --data-base 0x8000 --stack-top 0x10000 -o asm/donut.asm
```

简单 Shell：[shell.asm](shell.asm) 使用 ASCII32，[shell_ascii8.asm](shell_ascii8.asm) 使用 ASCII8。命令与编译说明见 [shell.md](../docs/shell.md)。

磁盘图片查看器：[image_viewer.asm](image_viewer.asm)，搭配 [test_pattern.bin](../images/test_pattern.bin) 导入持久磁盘地址 0 使用。图片转换和配套程序生成见 [image-viewer.md](../docs/image-viewer.md)。

通用 BMP 查看器：[bmp_viewer.asm](bmp_viewer.asm)，直接读取完整 BMP 文件并自动设置尺寸，换图不重新编译。测试文件为 [test_pattern.bmp](../images/test_pattern.bmp)，格式范围和导入方法见 [bmp-viewer.md](../docs/bmp-viewer.md)。

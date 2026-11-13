# 简单 Shell

源码：[examples/shell.c](../examples/shell.c)。默认可运行汇编：[asm/shell.asm](../asm/shell.asm)，使用 ASCII32 和反色光标；另提供 [ASCII8 版本](../asm/shell_ascii8.asm)。两者使用相同源码、TTY 行规程和 libc。

在游戏中打开项目 asm 目录的文件，键盘使用 Localized 模式。启动后显示 `sym> `，按回车执行；Left/Right 移动，输入会在光标处插入，BS 删除光标前的字符；回车执行整条命令。自动折行和滚屏由 TTY 处理，等待输入时光标每半秒切换显隐。

| 命令 | 用途 |
| --- | --- |
| `help` | 显示内置命令 |
| `echo TEXT` | 输出文本，保留文本内部空格；不解释引号或转义 |
| `clear` | 清屏并重新显示提示符 |
| `about` | 显示系统与终端信息 |
| `exit` | 显示 Bye，隐藏光标并返回启动代码的停驻循环 |

空行及仅空格/Tab 的输入直接重新提示。未知命令给出错误后继续运行；除 echo 外的命令若带额外参数会显示用法，不执行对应动作。每条输入最多 255 字节，包含命令本身；该上限由 TTY 实施。

这是内置命令解释器，不创建进程，也不提供文件系统、管道、重定向、变量展开或历史记录。

## 生成

从项目根目录运行：

```bash
python3 tools/symphony-cc examples/shell.c --libc --tty-display ascii32 -O1 --data-base 0x8000 --stack-top 0x10000 -o asm/shell.asm
python3 tools/symphony-cc examples/shell.c --libc --tty-display ascii8 -O1 --data-base 0x8000 --stack-top 0x10000 -o asm/shell_ascii8.asm
```

汇编保存在本项目，不写入游戏电路目录。两种布局均在低 64 KiB 内运行。屏幕颜色初始化由对应 TTY 后端负责，没有在程序末尾输出大量无意义的零。

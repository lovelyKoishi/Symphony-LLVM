# Symphony 规范模式 TTY

TTY 把键盘事件与字符显示封装为 C 的流式输入输出。ASCII8、ASCII32 共用行规程与终端逻辑，显示由编译时选择的后端实现。应用不必计算 96 列换行、键盘事件位或滚屏地址。

共用实现：[runtime/tty.c](../runtime/tty.c)，显示后端：[ASCII8](../runtime/tty_ascii8.c)、[ASCII32](../runtime/tty_ascii32.c)，内部契约：[tty_display.h](../runtime/tty_display.h)，公共接口：[include/tty.h](../include/tty.h)，可运行示例：[examples/tty_echo.c](../examples/tty_echo.c)。这是单线程、单控制台的 freestanding 驱动，使用轮询，不需要 libc、操作系统或中断。

## 快速使用

```c
#include "tty.h"

int main(void) {
    char text[TTY_LINE_CAPACITY];
    tty_init();
    for (;;) {
        tty_puts("> ");
        unsigned n = tty_readline(text, sizeof text);
        tty_puts("You typed: ");
        tty_write(text, n);
        tty_putc('\n');
    }
}
```

```bash
python3 tools/symphony-cc examples/tty_echo.c --tty -O1 -o asm/tty_echo.asm
python3 tools/symphony-cc examples/tty_echo.c --tty-display ascii32 -O1 -o asm/tty_echo_ascii32.asm
```

游戏中打开生成的 `.asm`，键盘使用 **Localized** 模式。两种后端均为 96×40 字符、默认白字黑底，并管理各自的 framebuffer。`--tty` 和 `--libc` 默认选择 ASCII8；`--tty-display ascii32` 选择并链接 ASCII32，也可与 `--libc` 合用。

驱动将 `runtime/tty.c`、选中的单个显示后端与应用分别编译为相同大端 ARM32 布局的 LLVM IR，再由 [llvm-link](https://llvm.org/docs/CommandGuide/llvm-link.html) 合并，最后交给 Symphony 后端。支持多个应用源文件，例如：

```bash
python3 tools/symphony-cc main.c commands.c --tty -O1 -o build/shell.asm
```

如工具不在 PATH，可分别指定 `--clang`、`--llvm-link` 和 `--backend`。使用同一版本的 LLVM 工具。

## 输入：按回车提交

规范模式的核心是整行缓冲、行内编辑与包含行终止符的读取，参考 [termios 的 canonical mode](https://man7.org/linux/man-pages/man3/termios.3.html)。本驱动实现这部分行规程；没有 POSIX 的 fd/termios ioctl、进程信号、Ctrl-D EOF、任务调度或 Unicode 编辑。

- 每次只处理一个键盘事件；只接收 key-down，忽略普通键的 release。
- Localized 模式键码为 Up=1、Right=2、Down=3、Left=4、Enter=10、BS=13。按下事件加 bit 8，例如 Left down=0x104、Right down=0x102。
- 可打印 ASCII 和 Tab 立即回显，但在回车之前不向程序暴露。
- Left/Right 在当前未提交记录内按字符移动，不能越过提示符或行尾；可跨视觉折行。普通字符在光标处插入，BS 删除光标前一个字符并整理后缀。Tab 在输入记录中仍是一个字符，移动跨过整个 Tab，编辑后重新计算其显示宽度。
- Up/Down 当前不提供历史记录，也不插入输入数据。回车总是提交整条输入，并从整条回显的末尾换行，即使光标停在中间。
- Shift（键码 16）跟踪按下/松开，支持英文字母大写与美式键盘符号映射；Caps Lock 和其他键盘布局转换不在本版范围内。
- 每行最多 **255 个输入字节**，另留一字节存换行。达到上限后忽略新的可打印键，仍允许退格和回车，不自动提前提交半行。
- 回车追加 `\n` 并提交；空行提交一个 `\n`。
- 已提交但未读完时暂停消费硬件键盘事件，保留该行的剩余部分。下一行不会覆盖尚未读完的数据。

输入缓冲区的大小与物理屏幕行宽是两个概念：一条输入记录可以跨越多个 96 列屏幕行。

## 输入 API

| 接口 | 行为 |
| --- | --- |
| `tty_poll()` | 维护光标闪烁，至多消费一个事件并更新回显；返回已提交、尚未读取的字节数；编辑中返回 0 |
| `tty_available()` | 只查询已提交剩余字节数，不读取硬件 |
| `tty_read(dst, count)` | 阻塞等待一条已提交记录，返回该记录最多 count 字节；包括 `\n`，不追加 NUL；短读保留剩余字节 |
| `tty_getchar()` | 从完整记录中阻塞读取一个字节，仍不会提前取得未提交的字符 |
| `tty_readline(dst, capacity)` | 消费一整条记录，去掉末尾 LF，存储至多 capacity−1 字节并追加 NUL；返回原记录的完整长度，不含 LF |

`tty_readline` 的返回长度可能大于存储长度：若返回值 `>= capacity`，缓冲区中的文本被截断，但整条输入记录（含 LF）已经消费，不会把残余误作下一行。需要无损小块读取时使用 `tty_read`。

```c
char small[8];
unsigned full_length = tty_readline(small, sizeof small);
/* small 总有 NUL；若 full_length >= sizeof small，只有前 7 字节被存储。 */
```

`tty_read` 的 count=0、`tty_readline` 的 capacity=0 或目标指针为 NULL 时返回 0，不消费输入。有效阻塞读取采用忙轮询，没有超时；不把“暂时没有按键”当 EOF。

## 输出与自动换行

| 字节/情况 | 行为 |
| --- | --- |
| 普通可显示字节 | 写当前单元，按 96 列折行 |
| `\n`（10） | 进入下一行行首，相当于整理好的 CR+LF |
| `\r`（13） | 回到当前行行首，用于覆盖当前行；不是输入 BS |
| `\r\n` | 一次换行，不会多空一行 |
| `\t`（9） | 展开为空格，移动到下一个 8 列 tab stop |
| `\b`（8） | 删除前一个屏幕单元；这是程序输出控制字符，与原始键盘 BS=13 分开 |
| 屏幕底部继续输出 | 上滚一行，仅清空新的最后一行 |
| 其他控制字节与 DEL | 忽略 |

采用**延迟折行**：第 96 个字符写到本行末尾，直到下一个普通字符才进入下一行。因此输出恰好 96 字后再输出 `\n`，只换一行。底部末列也不会刚写完就立即滚走内容。

| 接口 | 行为 |
| --- | --- |
| `tty_putc(ch)` | 输出一个字节并进行上述控制字符处理 |
| `tty_write(data, count)` | 输出指定数量的字节，返回消费字节数；包括被解释为控制符的字节 |
| `tty_puts(text)` | 输出 NUL 结束字符串，返回字节数；**不自动追加换行** |
| `tty_clear()` | 清空显示并回到左上角；取消未提交的编辑，保留已提交的未读记录 |
| `tty_init()` | 设置选定的显示后端，重置行规程与显示状态，默认显示光标 |
| `tty_set_cursor_visible(visible)` | 启用或禁用闪烁光标；隐藏会恢复覆盖前的字符或颜色，重新启用会立即显示 |

输出 API 会自动首次初始化；应用仍可显式调用 `tty_init()`。应用在编辑过程中另行输出内容时按当前光标正常交错，不提供 shell/readline 式的异步消息与编辑行重绘；简单交互程序用“提示 → readline → 输出”的调用顺序即可。

framebuffer 与行规程缓冲区属于运行时私有存储，应用不应直接写它们，也不应在驱动工作时把 screen 切换到其他模式或其他 framebuffer。

## 初始化与生成文件

沿用目标的“程序映像之外主内存初始为零”约定。空 framebuffer 和行缓冲区只分配地址，不在汇编末尾展开几千行零，不添加隐式 BSS 清零。ASCII8 首次初始化使用初始零显存；ASCII32 为每格写入白色前景、黑色背景属性，因为全零意味着黑字黑底。`tty_clear()`、再次初始化和滚屏按模式显式清理显示。

TTY 占用一个全局控制台；不分配堆、不使用动态 alloca、浮点或 64 位运算。库与应用使用同一 Symphony 私有调用约定。

## 显示后端与可见光标

| | ASCII8 | ASCII32 |
| --- | --- | --- |
| 选择 | `--tty` 或 `--tty-display ascii8` | `--tty-display ascii32` |
| 显存 | 3840 字节 | 15360 字节 |
| 单元布局 | 字符字节 | 字符、RGB332 前景、RGB332 背景、填充 |
| 光标 | 临时下划线，保存并恢复原字符 | 交换本格前景/背景，保留字符及填充字节 |

终端层负责位置、换行、Tab 和延迟折行；行规程负责输入编辑及提交。后端只负责初始化、清屏、单元写入、滚屏和光标覆盖。通过普通 C 直接调用静态链接，不使用运行时函数指针分派，也不在运行中切换模式。

光标默认每 500 ms 切换一次显隐；写内容、移动、退格等活动后立即显示并重新计时。使用 Symphony 的纳秒硬件时钟，按 time_low 后 high_cached 读取同一快照，并用两个 32 位数计算时间差，处理低 32 位回绕，不需要 i64 运算。

闪烁由 `tty_poll()` 驱动，阻塞的 read/getchar/readline 会持续调用它，因此 Shell 等待输入时自动闪烁；其他应用若长时间自行计算，需要在事件循环调用 tty_poll 才会刷新，没有后台线程或中断刷新。已提交记录背压期间也维护闪烁，不消费下一行键盘事件。

写内容、退格、滚屏前先恢复光标下的数据，完成后重画；puts/write 按整段批量隐藏、重画。空闲、Shift 或释放事件仅在到达闪烁时刻时重画，不会每轮反色。清屏保留显隐设置，重新 tty_init 恢复默认闪烁。

延迟折行时，若还有下一行，光标显示在下一行首但不提前修改逻辑位置或滚屏；写满右下角时，可逆地覆盖最后一格。ASCII32 因为仅改颜色，该格字符始终保留；ASCII8 隐藏光标可恢复完整字符。滚屏不会把光标复制到上一行留下残影。

```c
tty_set_cursor_visible(0); /* 隐藏并恢复原显示 */
tty_set_cursor_visible(1); /* 在当前逻辑位置显示 */
```

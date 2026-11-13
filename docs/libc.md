# Freestanding C 常用库

本项目提供一组面向 Symphony 的 C11 常用函数，包含内存/字符串、ASCII 字符分类、32 位整数转换、伪随机、二分查找和 TTY 标准字符 I/O。这是源码运行时子集，不是完整的宿主 libc。

```bash
python3 tools/symphony-cc examples/libc_demo.c --libc -O1 -o asm/libc_demo.asm
```

`--libc` 编译并链接 `runtime/libc/*.c`，同时提供 TTY 以满足标准字符 I/O。未被入口引用的函数及数据会被后端移除；只使用字符串和数字函数不会初始化屏幕，也不会把整个 TTY 放进结果。

## 已实现接口

| 头文件 | 函数/内容 |
| --- | --- |
| [string.h](../include/string.h) | memcpy、memmove、memset、memcmp、memchr |
| 同上 | strlen、strnlen、strcmp、strncmp、strcpy、strncpy、strcat、strncat |
| 同上 | strchr、strrchr、strstr、strspn、strcspn、strpbrk、strtok、strtok_r |
| [ctype.h](../include/ctype.h) | isalnum、isalpha、isblank、iscntrl、isdigit、isgraph、islower、isprint、ispunct、isspace、isupper、isxdigit、tolower、toupper |
| [stdlib.h](../include/stdlib.h) | atoi、atol、strtol、strtoul、abs、labs、srand、rand、bsearch |
| [stdio.h](../include/stdio.h) | puts、putchar、getchar、EOF |
| [symphony_num.h](../include/symphony_num.h) | sym_u32toa、sym_i32toa：带容量的 32 位整数转字符串扩展 |
| [errno.h](../include/errno.h) | errno、EINVAL、ERANGE |
| [limits.h](../include/limits.h) | CHAR_BIT 及字符/整数类型的边界宏；取值依据 Clang 目标定义 |

`stddef.h`、`stdint.h` 等基础类型仍使用 Clang 的 freestanding 头文件。Symphony 前端的 int、long、指针、size_t 都是 32 位；long long 的边界宏可以被预处理器使用，但没有增加后端的 64 位运算支持。

## 内存与字符串

```c
#include <string.h>

char text[32];
strcpy(text, "hello");
strcat(text, " world");
size_t n = strlen(text);
memmove(text + 1, text, n + 1); /* 允许重叠，连同 NUL 一起右移。 */
text[0] = '>';
```

- memcpy 要求源/目的不重叠；允许重叠时用 [memmove](https://man7.org/linux/man-pages/man3/memmove.3.html)。比较按 unsigned char 值进行，返回值的符号表示大小关系。
- strcpy/strcat 的目标容量由调用者保证。strncat 的 n 限制追加的源字符数，不是目的缓冲区容量，并会额外写 NUL。
- [strncpy](https://man7.org/linux/man-pages/man3/strncpy.3.html) 写满 n 字节：源不足时补零，源长度达到 n 时不保证 NUL。它不能被当成“总能安全终止的 strcpy”。
- strchr/strrchr 支持搜索字符串的 NUL；strstr 的空 needle 返回原 haystack。
- strnlen 是有界长度扩展；strtok_r 是显式保存状态的扩展。
- strtok/strtok_r 会把分隔符改写成 NUL，跳过连续分隔符，不生成空 token；传入可修改数组，不能修改字符串字面值。strtok 使用单份私有状态，需要交错解析时用 strtok_r。

## 字符分类

使用 ASCII/C locale，接受 unsigned char 值以及 EOF；大小写转换保留 EOF。处理 char 类型输入时可写：

```c
if (isspace((unsigned char)text[i])) { /* ... */ }
text[i] = (char)toupper((unsigned char)text[i]);
```

不提供 locale 切换或 Unicode 分类。屏幕字体中的扩展字形不会自动成为 ASCII 字母。

## 解析整数

```c
#include <stdlib.h>
#include <errno.h>

char *end;
errno = 0;
long value = strtol(" -0x2a tail", &end, 0);
/* value=-42；end 指向数字之后的空格。 */
```

strtol/strtoul 支持 base=2..36；base=0 按前导 0 选择八进制，按有效 `0x` 前缀选择十六进制，其余十进制。采用本项目 C11 约定，不接受 C23 新增的 `0b` 前缀。`0x` 后没有十六进制数字时不会无条件吞掉前缀。

遵循 [strtol 的转换和错误处理规则](https://man7.org/linux/man-pages/man3/strtol.3.html)：允许前导空白及正负号；无转换时返回 0、end 指向原字符串；溢出时饱和到目标边界并设置 ERANGE，同时继续扫描数字以得到正确 end。非法 base 在本实现中返回 0、end 保持原串、设置 EINVAL。成功和无转换不会主动清除已有 errno。

strtoul 接受负号，正常范围内按无符号 32 位取负；例如 `-1` 得到 ULONG_MAX。溢出时返回 ULONG_MAX，不再对饱和值取负。

atoi/atol 为十进制简化接口。本实现通过 strtol 转换，因此溢出时也采用饱和/ERANGE；需要区分合法 0、无转换和错误时应直接用 strtol。

errno 是单线程的全局可修改 lvalue，不使用 TLS。abs/labs 的最小负数无法由对应有符号类型表示，仍属于 C 的未定义情形。

## 整数转字符串

```c
#include "symphony_num.h"

char number[34];
sym_i32toa(-2147483647 - 1, number, sizeof(number), 10);
/* "-2147483648" */
sym_u32toa(0xffffffffu, number, sizeof(number), 16);
/* "ffffffff" */
```

两函数支持 base=2..36，字母使用小写。成功时追加 NUL，返回不含 NUL 的长度。signed 版本在所有进制下都使用负号，正确处理 INT32_MIN；要显示补码位串请用 unsigned 版本。

容量不足返回 -1/ERANGE；非法进制或 NULL 目的返回 -1/EINVAL。有可用目的字节时，错误会写入空字符串；capacity=0 时不写内存。成功不重置 errno。最坏的 signed 二进制形式需要 34 字节（负号＋32 位＋NUL）。

## 其他 stdlib 接口

rand 使用 32 位确定性线性同余状态，结果为 0..RAND_MAX（32767）；相同 srand seed 可重放相同序列，初始状态相当于 seed=1。

bsearch 接受已按比较器排序的数组和函数指针，找不到或 count=0 时返回 NULL；相等元素有多个时可返回其中任意一个。比较器应返回负/零/正，不宜用会溢出的整数减法实现比较。

## 标准字符 I/O

```c
#include <stdio.h>

puts("hello"); /* 自动追加 LF。 */
putchar('>');
int c = getchar();
```

puts/putchar 输出到已有规范模式 TTY。puts 自动换行，与不追加换行的 tty_puts 有区别；putchar 返回写入的 unsigned char 值。当前设备输出没有错误通道，puts 成功返回 0。

getchar 使用规范模式：按回车提交后逐字节读取，包括 LF；无完整行时忙轮询，不把“没有按键”当 EOF。没有硬件/文件 EOF 输入源，也没有 FILE、文件 I/O、printf/scanf、变参格式化。

## 链接与限制

可与 `--tty`、`--gfx` 及多 C 源文件一起使用。`--libc --tty` 不会重复链接 TTY。stdio 使用 TTY 字符显示，和 gfx 图形显示切换时仍由应用显式选择模式。

还没有 malloc/free/realloc、qsort、exit/abort、浮点转换、宽字符、完整 locale 或完整标准库 ABI。调用未声明/未提供的接口会得到编译或链接错误。

## 内存批量操作快速路径

`memcpy`/`memset` 在长度至少 16 字节时可进入 32 位路径。`memcpy` 要求源、目的地址模 4 相同，先复制前导零散字节直至双方对齐，再复制完整 word 和尾字节；不同对齐仍按字节复制。`memset` 同样先处理对齐前缀，将输入值截断为 unsigned char 后复制为四字节填充值，再写 word 和尾字节。

word 使用 `may_alias` 类型，避免对 char 数组的访问受到严格别名优化干扰。只在剩余长度至少 4 时访问完整 word；不通过读取请求范围外的内容来加速。返回值、重叠限制不变，memmove 继续按方向逐字节处理。LLVM 内存 intrinsic 的独立 lowering 仍按字节循环，不应与这里的 libc 快速路径混同。

#ifndef SYMPHONY_STDIO_H
#define SYMPHONY_STDIO_H
#include <stddef.h>
#define EOF (-1)
/* TTY-backed subset. Link with --libc (includes --tty). No FILE/printf yet. */
int putchar(int ch);
int getchar(void);
int puts(const char *s); /* Appends LF, unlike tty_puts. */
#endif

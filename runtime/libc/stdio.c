#include "stdio.h"
#include "tty.h"

int putchar(int ch) {
  unsigned char byte = (unsigned char)ch;
  tty_putc(byte);
  return byte;
}

int getchar(void) { return tty_getchar(); }

int puts(const char *s) {
  tty_puts(s);
  tty_putc('\n');
  return 0;
}

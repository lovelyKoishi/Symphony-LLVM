#include "tty.h"

int main(void) {
    char input[TTY_LINE_CAPACITY];
    tty_init();
    tty_puts("Symphony canonical TTY\n");
    tty_puts("Left/Right move; type to insert; BS deletes; Enter submits.\n");
    for (;;) {
        tty_puts("> ");
        unsigned length = tty_readline(input, sizeof(input));
        tty_puts("You typed: ");
        tty_write(input, length);
        tty_putc('\n');
    }
}

#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symphony_num.h"
#include "tty.h"

int main(void) {
    char input[TTY_LINE_CAPACITY], number[34];
    puts("C library demo: enter an integer, or quit.");
    puts("Decimal, 0x hex and leading-zero octal are supported.");
    for (;;) {
        tty_puts("> ");
        tty_readline(input, sizeof(input));
        if (strcmp(input, "quit") == 0)
            return 0;
        errno = 0;
        char *end;
        long value = strtol(input, &end, 0);
        int valid = end != input && !errno;
        while (isspace((unsigned char)*end))
            ++end;
        if (!valid || *end) {
            puts("Invalid integer or value outside signed 32-bit range.");
            continue;
        }
        sym_i32toa((int32_t)value, number, sizeof(number), 10);
        tty_puts("decimal: ");
        puts(number);
        sym_u32toa((uint32_t)value, number, sizeof(number), 16);
        tty_puts("hex bits: 0x");
        puts(number);
    }
}

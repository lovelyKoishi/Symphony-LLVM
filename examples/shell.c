#include <stdio.h>
#include <string.h>
#include "tty.h"

static int no_arguments(const char *command, const char *arguments) {
    if (!*arguments) return 1;
    tty_puts("Usage: ");
    puts(command);
    return 0;
}

static void help(void) {
    puts("help       Show commands");
    puts("echo TEXT  Print text");
    puts("clear      Clear the screen");
    puts("about      Show system information");
    puts("exit       Leave the shell");
}

int main(void) {
    char line[TTY_LINE_CAPACITY];
    tty_init();
    puts("Symphony shell");
    puts("Type 'help' for commands. Left/Right edit the line.");
    for (;;) {
        tty_puts("sym> ");
        tty_readline(line, sizeof line);
        char *command = line;
        while (*command == ' ' || *command == '\t') ++command;
        if (!*command) continue;

        char *arguments = command;
        while (*arguments && *arguments != ' ' && *arguments != '\t') ++arguments;
        if (*arguments) *arguments++ = 0;
        while (*arguments == ' ' || *arguments == '\t') ++arguments;

        if (!strcmp(command, "echo")) {
            puts(arguments);
        } else if (!strcmp(command, "help")) {
            if (no_arguments(command, arguments)) help();
        } else if (!strcmp(command, "clear")) {
            if (no_arguments(command, arguments)) tty_clear();
        } else if (!strcmp(command, "about")) {
            if (no_arguments(command, arguments)) {
                puts("Symphony - 96x40 character terminal");
                puts("Canonical input with echo and backspace editing.");
            }
        } else if (!strcmp(command, "exit")) {
            if (no_arguments(command, arguments)) {
                puts("Bye.");
                tty_set_cursor_visible(0);
                return 0;
            }
        } else {
            tty_puts("Unknown command: ");
            puts(command);
        }
    }
}

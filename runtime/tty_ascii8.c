#include "tty_display.h"
#include "tty.h"
#include "symphony.h"

enum { CELLS = TTY_COLUMNS * TTY_ROWS };
static volatile unsigned char framebuffer[CELLS];
static unsigned initialized, cursor_drawn, cursor_position;
static unsigned char cursor_saved;

void tty_display_cursor(unsigned position, int visible) {
    if (cursor_drawn) {
        framebuffer[cursor_position] = cursor_saved;
        cursor_drawn = 0;
    }
    if (visible) {
        cursor_position = position;
        cursor_saved = framebuffer[position];
        framebuffer[position] = '_';
        cursor_drawn = 1;
    }
}

void tty_display_clear(void) {
    tty_display_cursor(0, 0);
    for (unsigned i = 0; i < CELLS; ++i) framebuffer[i] = 0;
}

void tty_display_init(void) {
    if (initialized) tty_display_clear();
    initialized = 1;
    symphony_screen(0, SYMPHONY_ASCII8);
    symphony_screen(1, (uintptr_t)framebuffer);
    symphony_screen(2, 0x00ffffff);
    symphony_screen(3, 0);
    symphony_screen(4, 0);
}

void tty_display_put(unsigned position, unsigned ch) {
    framebuffer[position] = (unsigned char)ch;
}

void tty_display_scroll(void) {
    for (unsigned i = 0; i < CELLS - TTY_COLUMNS; ++i)
        framebuffer[i] = framebuffer[i + TTY_COLUMNS];
    for (unsigned i = CELLS - TTY_COLUMNS; i < CELLS; ++i) framebuffer[i] = 0;
}

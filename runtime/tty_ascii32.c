#include "tty_display.h"
#include "tty.h"
#include "symphony.h"

/* Big endian: character, RGB332 foreground, RGB332 background, padding. */
enum { CELLS = TTY_COLUMNS * TTY_ROWS };
static volatile uint32_t framebuffer[CELLS];
static unsigned cursor_drawn, cursor_position;
static uint32_t cursor_saved;

void tty_display_cursor(unsigned position, int visible) {
    if (cursor_drawn) {
        framebuffer[cursor_position] = cursor_saved;
        cursor_drawn = 0;
    }
    if (visible) {
        cursor_position = position;
        cursor_saved = framebuffer[position];
        uint32_t foreground = (cursor_saved >> 16) & 255;
        uint32_t background = (cursor_saved >> 8) & 255;
        framebuffer[position] = (cursor_saved & 0xff0000ffu) |
                                (background << 16) | (foreground << 8);
        cursor_drawn = 1;
    }
}

void tty_display_clear(void) {
    tty_display_cursor(0, 0);
    for (unsigned i = 0; i < CELLS; ++i) framebuffer[i] = 0x00ff0000u;
}

void tty_display_init(void) {
    /* Zero RAM is black-on-black; foreground attributes need explicit setup. */
    tty_display_clear();
    symphony_screen(0, SYMPHONY_ASCII32);
    symphony_screen(1, (uintptr_t)framebuffer);
}

void tty_display_put(unsigned position, unsigned ch) {
    framebuffer[position] = ((uint32_t)(unsigned char)ch << 24) | 0x00ff0000u;
}

void tty_display_scroll(void) {
    for (unsigned i = 0; i < CELLS - TTY_COLUMNS; ++i)
        framebuffer[i] = framebuffer[i + TTY_COLUMNS];
    for (unsigned i = CELLS - TTY_COLUMNS; i < CELLS; ++i)
        framebuffer[i] = 0x00ff0000u;
}

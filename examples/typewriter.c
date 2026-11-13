#include "symphony.h"

/* ASCII8: 96 columns x 40 rows. Keyboard: Localized mode.
 * Enter=10, Backspace=13. Process key-down events only.
 * Backspace deletes the previous screen cell, including across a row boundary.
 */
enum { WIDTH = 96, HEIGHT = 40, CELLS = WIDTH * HEIGHT };
static volatile unsigned char framebuffer[CELLS];

int main(void) {
    symphony_screen(0, SYMPHONY_ASCII8);
    symphony_screen(1, (uintptr_t)framebuffer);
    symphony_screen(2, 0x00ffffff);
    symphony_screen(3, 0);
    unsigned cursor = 0;

    for (;;) {
        unsigned event = symphony_keyboard();
        if (!(event & SYMPHONY_KEY_DOWN))
            continue;
        unsigned ch = event & SYMPHONY_KEY_MASK;

        if (ch == SYMPHONY_KEY_BACKSPACE) {
            if (cursor != 0)
                framebuffer[--cursor] = 0;
            continue;
        }
        if (ch == SYMPHONY_KEY_ENTER) {
            cursor += WIDTH - cursor % WIDTH;
        } else if (ch >= 32 && ch <= 126) {
            framebuffer[cursor++] = (unsigned char)ch;
        } else {
            continue;
        }

        if (cursor >= CELLS) {
            /* Copy upward, then clear just the new last row. */
            for (unsigned i = 0; i < CELLS - WIDTH; ++i)
                framebuffer[i] = framebuffer[i + WIDTH];
            for (unsigned i = CELLS - WIDTH; i < CELLS; ++i)
                framebuffer[i] = 0;
            cursor -= WIDTH;
        }
    }
}

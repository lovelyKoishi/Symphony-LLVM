#ifndef SYMPHONY_TTY_DISPLAY_H
#define SYMPHONY_TTY_DISPLAY_H

/* Private, statically linked display backend. Positions are character cells,
 * not byte offsets. The terminal removes its cursor before changing content. */
void tty_display_init(void);
void tty_display_clear(void);
void tty_display_put(unsigned position, unsigned ch);
void tty_display_scroll(void);
void tty_display_cursor(unsigned position, int visible);

#endif

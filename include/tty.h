#ifndef SYMPHONY_TTY_H
#define SYMPHONY_TTY_H

/* Single-console canonical TTY; --tty selects ASCII8 by default.
 * Use --tty-display ascii32 for per-cell colors and an inverse cursor.
 * Keyboard must be in Localized mode. No libc or OS is required.
 */
enum { TTY_COLUMNS = 96, TTY_ROWS = 40, TTY_LINE_CAPACITY = 256 };

void tty_init(void);
void tty_clear(void); /* Clear display; preserve any committed input record. */
void tty_set_cursor_visible(int visible); /* Visible + blinking by default. */
void tty_putc(int ch); /* LF => new line, CR => column 0, TAB => 8-column stop. */
unsigned tty_write(const char *data, unsigned count);
unsigned tty_puts(const char *text); /* Write text as-is; no implicit LF. */

/* Service cursor blinking and poll at most one event; return committed bytes.
 * No partial edited line is exposed. Pending records apply backpressure.
 */
unsigned tty_poll(void);
unsigned tty_available(void); /* Query only, without polling hardware. */
unsigned tty_read(char *data, unsigned count); /* Blocking, at most one record. */
int tty_getchar(void); /* Blocking, reads a byte from a completed record. */

/* Consume one full record; exclude LF and append NUL to the stored prefix.
 * Return FULL length excluding LF, even if capacity truncates the stored text.
 * NULL or capacity=0: no-op. Use tty_read for lossless partial reads.
 */
unsigned tty_readline(char *data, unsigned capacity);

#endif

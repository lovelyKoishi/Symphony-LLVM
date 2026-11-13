#include "tty.h"
#include "symphony.h"
#include "tty_display.h"

/* Share renderer/scrolling bodies rather than cloning them at each call. */
#define TTY_NOINLINE __attribute__((noinline))

enum { CELLS = TTY_COLUMNS * TTY_ROWS, TAB_WIDTH = 8, KEY_SHIFT = 16 };
static unsigned cursor;
static unsigned wrap_pending;
static unsigned initialized;
static unsigned shift_down;
static unsigned char line[TTY_LINE_CAPACITY];
static unsigned char echo_width[TTY_LINE_CAPACITY];
static unsigned char echo_pending[TTY_LINE_CAPACITY];
static unsigned edit_length;
static unsigned edit_position;
static unsigned edit_active;
static unsigned edit_start_cursor;
static unsigned edit_start_pending;
static unsigned edit_cells;
static unsigned ready_length;
static unsigned read_offset;
static unsigned cursor_disabled;
static unsigned cursor_phase;
static unsigned cursor_time_low;
static unsigned cursor_time_high;

static void hide_cursor(void) { tty_display_cursor(0, 0); }

static void show_cursor(void) {
    unsigned position = cursor;
    /* Preview the next cell without performing delayed wrap or scrolling.
     * At the bottom-right cell the backend overlays that cell reversibly. */
    if (wrap_pending && position + 1 < CELLS) ++position;
    if (!cursor_disabled) tty_display_cursor(position, 1);
}

static TTY_NOINLINE void reset_cursor(void) {
    cursor_phase = 1;
    if (cursor_disabled) return;
    cursor_time_low = symphony_time_low();
    cursor_time_high = symphony_time_high_cached();
    show_cursor();
}

static TTY_NOINLINE void update_cursor(void) {
    if (cursor_disabled) return;
    unsigned low = symphony_time_low();
    unsigned high = symphony_time_high_cached();
    unsigned elapsed_low = low - cursor_time_low;
    unsigned elapsed_high = high - cursor_time_high - (low < cursor_time_low);
    /* The clock is nanoseconds. Two 32-bit halves avoid unsupported i64
     * arithmetic and handle the low half wrapping every ~4.29 seconds. */
    if (elapsed_high || elapsed_low >= 500000000u) {
        cursor_time_low = low;
        cursor_time_high = high;
        cursor_phase ^= 1;
        if (cursor_phase) show_cursor();
        else hide_cursor();
    }
}

static TTY_NOINLINE void next_line(void) {
    cursor += TTY_COLUMNS - cursor % TTY_COLUMNS;
    wrap_pending = 0;
    if (cursor < CELLS)
        return;
    tty_display_scroll();
    cursor -= TTY_COLUMNS;
    if (edit_active) {
        if (edit_start_cursor >= TTY_COLUMNS) edit_start_cursor -= TTY_COLUMNS;
        else edit_start_cursor = 0;
    }
}

static TTY_NOINLINE void erase_cell(void) {
    if (wrap_pending) {
        wrap_pending = 0;
    } else if (cursor != 0) {
        --cursor;
    } else {
        return;
    }
    tty_display_put(cursor, 0);
}

/* Deferred wrap: writing column 95 does not move until the next character.
 * Thus exactly 96 characters followed by LF advances ONE row, not two.
 */
static TTY_NOINLINE void print_cell(unsigned ch) {
    if (wrap_pending)
        next_line();
    tty_display_put(cursor, ch);
    if (cursor % TTY_COLUMNS == TTY_COLUMNS - 1)
        wrap_pending = 1;
    else
        ++cursor;
}

static TTY_NOINLINE unsigned render(unsigned ch) {
    if (ch == '\n') {
        next_line();
    } else if (ch == '\r') {
        cursor -= cursor % TTY_COLUMNS;
        wrap_pending = 0;
    } else if (ch == '\b') {
        erase_cell();
    } else if (ch == '\t') {
        if (wrap_pending)
            next_line();
        unsigned count = TAB_WIDTH - cursor % TAB_WIDTH;
        for (unsigned i = 0; i < count; ++i)
            print_cell(' ');
        return count;
    } else if (ch >= 32 && ch != 127) {
        print_cell(ch);
        return 1;
    }
    return 0;
}

static void begin_edit(void) {
    if (edit_active) return;
    edit_active = 1;
    edit_start_cursor = cursor;
    edit_start_pending = wrap_pending;
    edit_cells = 0;
    edit_position = 0;
}

static TTY_NOINLINE void position_edit_cursor(void) {
    cursor = edit_start_cursor;
    wrap_pending = edit_start_pending;
    if (!edit_position) return;
    unsigned end = edit_start_cursor + edit_start_pending;
    for (unsigned i = 0; i < edit_position; ++i) end += echo_width[i];
    wrap_pending = end % TTY_COLUMNS == 0;
    cursor = end - wrap_pending;
}

static TTY_NOINLINE void redraw_edit(void) {
    unsigned start = edit_start_cursor + edit_start_pending;
    for (unsigned i = 0; i < edit_cells; ++i) tty_display_put(start + i, 0);
    cursor = edit_start_cursor;
    wrap_pending = edit_start_pending;
    edit_cells = 0;
    for (unsigned i = 0; i < edit_length; ++i) {
        echo_pending[i] = (unsigned char)wrap_pending;
        echo_width[i] = (unsigned char)render(line[i]);
        edit_cells += echo_width[i];
    }
    /* Redrawing the suffix can scroll; calculate the caret afterwards using
     * the updated anchor, not a coordinate captured before that scroll. */
    position_edit_cursor();
}

void tty_clear(void) {
    if (!initialized) {
        tty_init();
        return;
    }
    hide_cursor();
    tty_display_clear();
    cursor = 0;
    wrap_pending = 0;
    /* Discard an uncommitted edit since its screen cells no longer exist. */
    edit_length = 0;
    edit_position = 0;
    edit_active = 0;
    edit_cells = 0;
    reset_cursor();
}

TTY_NOINLINE void tty_init(void) {
    initialized = 1;
    cursor = 0;
    wrap_pending = 0;
    edit_length = 0;
    edit_position = 0;
    edit_active = 0;
    edit_cells = 0;
    ready_length = 0;
    read_offset = 0;
    shift_down = 0;
    cursor_disabled = 0;
    tty_display_init();
    reset_cursor();
}

void tty_set_cursor_visible(int visible) {
    if (!initialized) tty_init();
    hide_cursor();
    cursor_disabled = !visible;
    reset_cursor();
}

TTY_NOINLINE void tty_putc(int ch) {
    if (!initialized)
        tty_init();
    hide_cursor();
    render((unsigned char)ch);
    reset_cursor();
}

unsigned tty_write(const char *data, unsigned count) {
    if (!data || !count)
        return 0;
    if (!initialized) tty_init();
    hide_cursor();
    for (unsigned i = 0; i < count; ++i)
        render((unsigned char)data[i]);
    reset_cursor();
    return count;
}

unsigned tty_puts(const char *text) {
    if (!text || !*text)
        return 0;
    if (!initialized) tty_init();
    hide_cursor();
    unsigned count = 0;
    while (text[count]) {
        render((unsigned char)text[count]);
        ++count;
    }
    reset_cursor();
    return count;
}

static unsigned shifted(unsigned ch) {
    if (ch >= 'a' && ch <= 'z')
        return ch - 'a' + 'A';
    static const char plain[] = "`1234567890-=[]\\;',./";
    static const char upper[] = "~!@#$%^&*()_+{}|:\"<>?";
    _Static_assert(sizeof(plain) == sizeof(upper), "shift tables must match");
    for (unsigned i = 0; plain[i]; ++i)
        if (ch == (unsigned char)plain[i])
            return (unsigned char)upper[i];
    return ch;
}

unsigned tty_available(void) {
    return ready_length - read_offset;
}

unsigned tty_poll(void) {
    if (!initialized)
        tty_init();
    if (ready_length) {
        update_cursor();
        return tty_available();
    }
    unsigned event = symphony_keyboard();
    unsigned ch = event & SYMPHONY_KEY_MASK;
    if (ch == KEY_SHIFT) {
        shift_down = event & SYMPHONY_KEY_DOWN;
        update_cursor();
        return 0;
    }
    if (!(event & SYMPHONY_KEY_DOWN)) {
        update_cursor();
        return 0;
    }
    hide_cursor();
    if (ch == SYMPHONY_KEY_LEFT || ch == SYMPHONY_KEY_RIGHT) {
        begin_edit();
        if (ch == SYMPHONY_KEY_LEFT && edit_position) --edit_position;
        if (ch == SYMPHONY_KEY_RIGHT && edit_position < edit_length) ++edit_position;
        position_edit_cursor();
    } else if (ch == SYMPHONY_KEY_BACKSPACE) {
        if (edit_position == edit_length && edit_length) {
            --edit_length;
            --edit_position;
            edit_cells -= echo_width[edit_length];
            for (unsigned i = 0; i < echo_width[edit_length]; ++i)
                erase_cell();
            if (echo_pending[edit_length] && cursor) {
                --cursor;
                wrap_pending = 1;
            }
        } else if (edit_position) {
            --edit_position;
            --edit_length;
            for (unsigned i = edit_position; i < edit_length; ++i) line[i] = line[i+1];
            redraw_edit();
        }
    } else if (ch == SYMPHONY_KEY_ENTER) {
        begin_edit();
        edit_position = edit_length;
        position_edit_cursor();
        line[edit_length] = '\n';
        ready_length = edit_length + 1;
        read_offset = 0;
        edit_length = 0;
        edit_position = 0;
        edit_active = 0;
        edit_cells = 0;
        render('\n');
    } else if ((ch == '\t' || (ch >= 32 && ch <= 126)) &&
               edit_length < TTY_LINE_CAPACITY - 1) {
        if (shift_down)
            ch = shifted(ch);
        begin_edit();
        if (edit_position == edit_length) {
            line[edit_length] = (unsigned char)ch;
            echo_pending[edit_length] = (unsigned char)wrap_pending;
            echo_width[edit_length] = (unsigned char)render(ch);
            edit_cells += echo_width[edit_length];
            ++edit_length;
            ++edit_position;
        } else {
            for (unsigned i = edit_length; i > edit_position; --i) line[i] = line[i-1];
            line[edit_position++] = (unsigned char)ch;
            ++edit_length;
            redraw_edit();
        }
    }
    reset_cursor();
    return tty_available();
}

TTY_NOINLINE unsigned tty_read(char *data, unsigned count) {
    if (!data || !count)
        return 0;
    while (!tty_poll()) {
    }
    unsigned available = tty_available();
    if (count > available)
        count = available;
    for (unsigned i = 0; i < count; ++i)
        data[i] = (char)line[read_offset++];
    if (read_offset == ready_length) {
        read_offset = 0;
        ready_length = 0;
    }
    return count;
}

int tty_getchar(void) {
    char ch;
    tty_read(&ch, 1);
    return (unsigned char)ch;
}

unsigned tty_readline(char *data, unsigned capacity) {
    if (!data || !capacity)
        return 0;
    unsigned length = 0;
    for (;;) {
        unsigned ch = (unsigned)tty_getchar();
        if (ch == '\n')
            break;
        if (length < capacity - 1)
            data[length] = (char)ch;
        ++length;
    }
    data[length < capacity - 1 ? length : capacity - 1] = 0;
    return length;
}

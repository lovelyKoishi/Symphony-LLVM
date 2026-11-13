#ifndef SYMPHONY_H
#define SYMPHONY_H
#include <stdint.h>
/* Reserved device functions: lowered directly by llvm2symphony. */
uint32_t symphony_keyboard(void);
uint32_t symphony_in(void);
void symphony_out(uint32_t value);
void symphony_screen(uint32_t setting, uint32_t value);
uint32_t symphony_time_low(void); /* refresh snapshot, return low half */
uint32_t symphony_time_high_cached(void); /* cached high half, no refresh */
uint32_t symphony_counter(void);
uint32_t symphony_pload(uint32_t address);
void symphony_pstore(uint32_t address, uint32_t value);

enum { SYMPHONY_KEY_UP = 1, SYMPHONY_KEY_RIGHT = 2,
       SYMPHONY_KEY_DOWN_ARROW = 3, SYMPHONY_KEY_LEFT = 4,
       SYMPHONY_KEY_ENTER = 10, SYMPHONY_KEY_BACKSPACE = 13,
       SYMPHONY_KEY_DOWN = 0x100, SYMPHONY_KEY_MASK = 0xff };
enum { SYMPHONY_ASCII8 = 0, SYMPHONY_ASCII32 = 1,
       SYMPHONY_PIXEL8 = 2, SYMPHONY_PIXEL32 = 3 };
#endif

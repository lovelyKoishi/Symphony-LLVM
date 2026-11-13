#ifndef SYMPHONY_NUM_H
#define SYMPHONY_NUM_H
#include <stddef.h>
#include <stdint.h>
/* Bases 2..36. Return length excluding NUL, or -1 (EINVAL/ERANGE).
 * An available destination is set to an empty string on error.
 * Signed conversion uses a leading '-' in every base, including INT32_MIN.
 */
int sym_u32toa(uint32_t value, char *dst, size_t capacity, unsigned base);
int sym_i32toa(int32_t value, char *dst, size_t capacity, unsigned base);
#endif

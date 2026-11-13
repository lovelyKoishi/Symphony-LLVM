#include "errno.h"
#include "symphony_num.h"

static int format(uint32_t value, int negative, char *dst, size_t capacity,
                  unsigned base) {
  if (dst && capacity)
    dst[0] = 0;
  if (!dst || base < 2 || base > 36) {
    errno = EINVAL;
    return -1;
  }
  char digits[32];
  unsigned count = 0;
  do {
    unsigned digit = value % base;
    digits[count++] = (char)(digit < 10 ? '0' + digit : 'a' + digit - 10);
    value /= base;
  } while (value);
  if (capacity < count + (unsigned)negative + 1) {
    errno = ERANGE;
    return -1;
  }
  unsigned index = 0;
  if (negative)
    dst[index++] = '-';
  while (count)
    dst[index++] = digits[--count];
  dst[index] = 0;
  return (int)index;
}

int sym_u32toa(uint32_t value, char *dst, size_t capacity, unsigned base) {
  return format(value, 0, dst, capacity, base);
}

int sym_i32toa(int32_t value, char *dst, size_t capacity, unsigned base) {
  uint32_t magnitude = value < 0 ? 0u - (uint32_t)value : (uint32_t)value;
  return format(magnitude, value < 0, dst, capacity, base);
}

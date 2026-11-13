#include "stdlib.h"
#include "ctype.h"
#include "errno.h"
#include "limits.h"
#include <stdint.h>

int sym_errno;

static int digit_value(unsigned char c) {
  if (c >= '0' && c <= '9')
    return c - '0';
  if (c >= 'a' && c <= 'z')
    return c - 'a' + 10;
  if (c >= 'A' && c <= 'Z')
    return c - 'A' + 10;
  return 36;
}

static unsigned long parse(const char *text, char **end, int base,
                           int signed_value, int *negative, int *overflow) {
  const char *p = text;
  *negative = 0;
  *overflow = 0;
  if (end)
    *end = (char *)text;
  if (base != 0 && (base < 2 || base > 36)) {
    errno = EINVAL;
    return 0;
  }
  while (isspace((unsigned char)*p))
    ++p;
  if (*p == '-' || *p == '+') {
    *negative = *p == '-';
    ++p;
  }
  if ((base == 0 || base == 16) && p[0] == '0' &&
      (p[1] == 'x' || p[1] == 'X') && digit_value((unsigned char)p[2]) < 16) {
    base = 16;
    p += 2;
  }
  if (base == 0)
    base = *p == '0' ? 8 : 10;
  unsigned long limit =
      signed_value ? (unsigned long)LONG_MAX + (unsigned)*negative : ULONG_MAX;
  unsigned long cutoff = limit / (unsigned)base,
                remainder = limit % (unsigned)base;
  const char *digits = p;
  unsigned long value = 0;
  for (;;) {
    unsigned digit = (unsigned)digit_value((unsigned char)*p);
    if (digit >= (unsigned)base)
      break;
    if (!*overflow) {
      if (value > cutoff || (value == cutoff && digit > remainder))
        *overflow = 1;
      else
        value = value * (unsigned)base + digit;
    }
    ++p;
  }
  if (p == digits)
    return 0;
  if (end)
    *end = (char *)p;
  if (*overflow) {
    errno = ERANGE;
    return limit;
  }
  return value;
}

long strtol(const char *restrict s, char **restrict end, int base) {
  int negative, overflow;
  unsigned long value = parse(s, end, base, 1, &negative, &overflow);
  if (overflow)
    return negative ? LONG_MIN : LONG_MAX;
  if (negative) {
    if (value == (unsigned long)LONG_MAX + 1UL)
      return LONG_MIN;
    return -(long)value;
  }
  return (long)value;
}

unsigned long strtoul(const char *restrict s, char **restrict end, int base) {
  int negative, overflow;
  unsigned long value = parse(s, end, base, 0, &negative, &overflow);
  if (overflow)
    return ULONG_MAX;
  return negative ? 0UL - value : value;
}

int atoi(const char *s) { return (int)strtol(s, NULL, 10); }
long atol(const char *s) { return strtol(s, NULL, 10); }
int abs(int value) { return value < 0 ? -value : value; }
long labs(long value) { return value < 0 ? -value : value; }

static unsigned random_state = 1;
void srand(unsigned seed) { random_state = seed; }
int rand(void) {
  random_state = random_state * 1103515245u + 12345u;
  return (int)((random_state >> 16) & RAND_MAX);
}

void *bsearch(const void *key, const void *base, size_t count, size_t size,
              int (*compare)(const void *, const void *)) {
  size_t low = 0, high = count;
  while (low < high) {
    size_t mid = low + (high - low) / 2;
    const unsigned char *element = (const unsigned char *)base + mid * size;
    int order = compare(key, element);
    if (order == 0)
      return (void *)element;
    if (order < 0)
      high = mid;
    else
      low = mid + 1;
  }
  return NULL;
}

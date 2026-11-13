#include "string.h"
#include <stdint.h>

/* Word accesses may alias byte arrays. Only aligned, wholly in-range words
 * enter this path; mismatched alignments and small copies use byte accesses. */
typedef uint32_t alias_word __attribute__((__may_alias__));

void *memcpy(void *restrict dst, const void *restrict src, size_t n) {
  unsigned char *d = dst;
  const unsigned char *s = src;
  if (n >= 16 && (((uintptr_t)d ^ (uintptr_t)s) & 3) == 0) {
    while ((uintptr_t)d & 3) {
      *d++ = *s++;
      --n;
    }
    while (n >= 4) {
      *(alias_word *)d = *(const alias_word *)s;
      d += 4;
      s += 4;
      n -= 4;
    }
  }
  while (n--) *d++ = *s++;
  return dst;
}

void *memmove(void *dst, const void *src, size_t n) {
  unsigned char *d = dst;
  const unsigned char *s = src;
  if ((uintptr_t)d < (uintptr_t)s) {
    for (size_t i = 0; i < n; ++i)
      d[i] = s[i];
  } else if (d != s) {
    while (n) {
      --n;
      d[n] = s[n];
    }
  }
  return dst;
}

void *memset(void *dst, int value, size_t n) {
  unsigned char *d = dst;
  unsigned char byte = (unsigned char)value;
  if (n >= 16) {
    while ((uintptr_t)d & 3) {
      *d++ = byte;
      --n;
    }
    uint32_t word = byte;
    word |= word << 8;
    word |= word << 16;
    while (n >= 4) {
      *(alias_word *)d = word;
      d += 4;
      n -= 4;
    }
  }
  while (n--) *d++ = byte;
  return dst;
}

int memcmp(const void *a, const void *b, size_t n) {
  const unsigned char *x = a, *y = b;
  for (size_t i = 0; i < n; ++i)
    if (x[i] != y[i])
      return (int)x[i] - (int)y[i];
  return 0;
}

void *memchr(const void *src, int value, size_t n) {
  const unsigned char *s = src;
  for (size_t i = 0; i < n; ++i)
    if (s[i] == (unsigned char)value)
      return (void *)(s + i);
  return NULL;
}

size_t strlen(const char *s) {
  size_t n = 0;
  while (s[n])
    ++n;
  return n;
}

size_t strnlen(const char *s, size_t maximum) {
  size_t n = 0;
  while (n < maximum && s[n])
    ++n;
  return n;
}

int strcmp(const char *a, const char *b) {
  while (*a && (unsigned char)*a == (unsigned char)*b) {
    ++a;
    ++b;
  }
  return (int)(unsigned char)*a - (int)(unsigned char)*b;
}

int strncmp(const char *a, const char *b, size_t n) {
  for (size_t i = 0; i < n; ++i) {
    unsigned char x = (unsigned char)a[i], y = (unsigned char)b[i];
    if (x != y)
      return (int)x - (int)y;
    if (!x)
      break;
  }
  return 0;
}

char *strcpy(char *restrict dst, const char *restrict src) {
  size_t i = 0;
  do {
    dst[i] = src[i];
  } while (src[i++]);
  return dst;
}

char *strncpy(char *restrict dst, const char *restrict src, size_t n) {
  size_t i = 0;
  while (i < n && src[i]) {
    dst[i] = src[i];
    ++i;
  }
  while (i < n)
    dst[i++] = 0;
  return dst;
}

char *strcat(char *restrict dst, const char *restrict src) {
  strcpy(dst + strlen(dst), src);
  return dst;
}

char *strncat(char *restrict dst, const char *restrict src, size_t n) {
  size_t end = strlen(dst), i = 0;
  while (i < n && src[i]) {
    dst[end + i] = src[i];
    ++i;
  }
  dst[end + i] = 0;
  return dst;
}

char *strchr(const char *s, int c) {
  do {
    if ((unsigned char)*s == (unsigned char)c)
      return (char *)s;
  } while (*s++);
  return NULL;
}

char *strrchr(const char *s, int c) {
  const char *last = NULL;
  do {
    if ((unsigned char)*s == (unsigned char)c)
      last = s;
  } while (*s++);
  return (char *)last;
}

char *strstr(const char *haystack, const char *needle) {
  for (;;) {
    const char *h = haystack, *n = needle;
    while (*n && *h == *n) {
      ++h;
      ++n;
    }
    if (!*n)
      return (char *)haystack;
    if (!*haystack)
      return NULL;
    ++haystack;
  }
}

size_t strspn(const char *s, const char *accept) {
  size_t n = 0;
  while (s[n] && strchr(accept, (unsigned char)s[n]))
    ++n;
  return n;
}

size_t strcspn(const char *s, const char *reject) {
  size_t n = 0;
  while (s[n] && !strchr(reject, (unsigned char)s[n]))
    ++n;
  return n;
}

char *strpbrk(const char *s, const char *accept) {
  while (*s) {
    if (strchr(accept, (unsigned char)*s))
      return (char *)s;
    ++s;
  }
  return NULL;
}

char *strtok_r(char *restrict s, const char *restrict delimiters,
               char **restrict state) {
  if (!s)
    s = *state;
  if (!s)
    return NULL;
  s += strspn(s, delimiters);
  if (!*s) {
    *state = s;
    return NULL;
  }
  char *end = s + strcspn(s, delimiters);
  if (*end) {
    *end = 0;
    *state = end + 1;
  } else
    *state = end;
  return s;
}

char *strtok(char *restrict s, const char *restrict delimiters) {
  static char *state;
  return strtok_r(s, delimiters, &state);
}

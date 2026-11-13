#ifndef SYMPHONY_STRING_H
#define SYMPHONY_STRING_H
#include <stddef.h>

void *memcpy(void *restrict dst, const void *restrict src, size_t n);
void *memmove(void *dst, const void *src, size_t n);
void *memset(void *dst, int value, size_t n);
int memcmp(const void *a, const void *b, size_t n);
void *memchr(const void *src, int value, size_t n);
size_t strlen(const char *s);
size_t strnlen(const char *s, size_t maximum); /* Bounded-length extension. */
int strcmp(const char *a, const char *b);
int strncmp(const char *a, const char *b, size_t n);
char *strcpy(char *restrict dst, const char *restrict src);
char *strncpy(char *restrict dst, const char *restrict src, size_t n);
char *strcat(char *restrict dst, const char *restrict src);
char *strncat(char *restrict dst, const char *restrict src, size_t n);
char *strchr(const char *s, int c);
char *strrchr(const char *s, int c);
char *strstr(const char *haystack, const char *needle);
size_t strspn(const char *s, const char *accept);
size_t strcspn(const char *s, const char *reject);
char *strpbrk(const char *s, const char *accept);
char *strtok(char *restrict s, const char *restrict delimiters);
char *strtok_r(char *restrict s, const char *restrict delimiters,
               char **restrict state); /* Explicit-state extension. */
#endif

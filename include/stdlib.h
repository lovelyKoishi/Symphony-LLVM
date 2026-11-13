#ifndef SYMPHONY_STDLIB_H
#define SYMPHONY_STDLIB_H
#include <stddef.h>
#define RAND_MAX 32767
#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1
int atoi(const char *s);
long atol(const char *s);
long strtol(const char *restrict s, char **restrict end, int base);
unsigned long strtoul(const char *restrict s, char **restrict end, int base);
int abs(int value);
long labs(long value);
void srand(unsigned seed);
int rand(void);
void *bsearch(const void *key, const void *base, size_t count, size_t size,
              int (*compare)(const void *, const void *));
#endif

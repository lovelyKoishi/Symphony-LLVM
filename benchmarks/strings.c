#include <string.h>
#include <stdlib.h>
unsigned bench(unsigned seed) {
  char text[96];
  unsigned sum = seed;
  for (unsigned i = 0; i < 32; ++i) {
    memset(text, 0, sizeof(text));
    strcpy(text, "12345 compiler benchmark");
    strcat(text, " strings");
    memmove(text+1, text, strlen(text)+1);
    sum += (unsigned)atoi(text+1) + (unsigned)strlen(text);
    sum += strcmp(text+1, "12345 compiler benchmark strings") == 0;
  }
  return sum;
}

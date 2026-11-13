#include <string.h>
unsigned bench(unsigned seed) {
  unsigned char a[512] __attribute__((aligned(4)));
  unsigned char b[512] __attribute__((aligned(4)));
  for (unsigned i = 0; i < 512; ++i) a[i] = (unsigned char)(seed+i*29);
  unsigned sum = 0;
  for (unsigned round = 0; round < 8; ++round) {
    memset(b, seed+round, sizeof b);
    sum += b[round];
    memcpy(b+4, a+4, 504);
    for (unsigned i = 0; i < 512; ++i) sum += b[i];
  }
  return sum;
}

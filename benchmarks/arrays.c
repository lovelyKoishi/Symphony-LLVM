unsigned bench(unsigned seed) {
  unsigned a[64];
  for (unsigned i = 0; i < 64; ++i) a[i] = seed + i * 13;
  for (unsigned round = 0; round < 8; ++round)
    for (unsigned i = 1; i < 64; ++i) a[i] = (a[i] + a[i-1]) ^ (round+i);
  unsigned sum = 0;
  for (unsigned i = 0; i < 64; ++i) sum += a[i];
  return sum;
}

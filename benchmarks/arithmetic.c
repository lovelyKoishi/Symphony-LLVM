unsigned bench(unsigned x) {
  for (unsigned i = 0; i < 256; ++i) {
    x = x * 1664525u + 1013904223u;
    x ^= x >> 13;
    x += (x % 97u) * 7u;
  }
  return x;
}

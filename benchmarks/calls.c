static __attribute__((noinline)) unsigned mix(unsigned a, unsigned b) {
  return (a * 33u) ^ (b + 7u);
}
unsigned bench(unsigned seed) {
  unsigned total = seed;
  for (unsigned i = 0; i < 128; ++i) total = mix(total, i) + i;
  return total;
}

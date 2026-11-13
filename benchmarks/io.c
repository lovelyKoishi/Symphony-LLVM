extern void symphony_out(unsigned value);
unsigned bench(unsigned seed) {
  unsigned sum = 0;
  for (unsigned i = 0; i < 64; ++i) {
    unsigned value = (seed+i) ^ (i<<3);
    symphony_out(value);
    sum += value;
  }
  return sum;
}

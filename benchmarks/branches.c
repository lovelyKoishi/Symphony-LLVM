unsigned bench(unsigned x) {
  unsigned a = 0, b = 1;
  for (unsigned i = 0; i < 256; ++i) {
    if ((x ^ i) & 1) a += x ^ (i * 17u);
    else b = b * 3u + i;
    if ((i & 7) == 0) x = (x << 1) ^ b;
    else x += a >> 3;
  }
  return a ^ b ^ x;
}

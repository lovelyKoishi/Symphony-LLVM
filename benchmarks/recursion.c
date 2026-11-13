static __attribute__((noinline)) unsigned fib(unsigned n) {
  return n < 2 ? n : fib(n-1) + fib(n-2);
}
unsigned bench(unsigned seed) { return fib(12) + seed; }

/* Andy Sloane (a1k0n), 2020. Fixed-point donut.c, via the LiteX port.
 * Upstream source/license: ../third_party/litex_donut/ (BSD-2-Clause).
 * Symphony port changes: C11 main; double-buffered 96x40 ASCII8 presentation;
 * no POSIX sleep/ANSI terminal movement; Q or Esc exits after a frame.
 * Geometry/rotation/depth-buffer loops below are retained from upstream.
 */
#include <stdint.h>
#include <string.h>
#include "symphony.h"

#ifndef DONUT_FRAMES
#define DONUT_FRAMES 0 /* 0 = animate indefinitely; finite value is for tests. */
#endif

#ifndef DONUT_DIAGNOSTICS
#define DONUT_DIAGNOSTICS 0
#endif

#define R(mul,shift,x,y) \
  _=x; \
  x -= mul*y>>shift; \
  y += mul*_>>shift; \
  _ = (3145728-x*x-y*y)>>11; \
  x = x*_>>10; \
  y = y*_>>10;

static signed char b[1760], z[1760];
static unsigned char framebuffer[2][96 * 40];

#if DONUT_DIAGNOSTICS
static __attribute__((noinline)) void diagnostic_hex(unsigned char *dest, unsigned value) {
  for (unsigned i = 0; i < 8; ++i) {
    unsigned digit = (value >> (28 - 4*i)) & 15;
    dest[i] = digit < 10 ? '0' + digit : 'A' + digit - 10;
  }
}
#endif

int main(void) {
  unsigned frame = 0, back = DONUT_DIAGNOSTICS ? 1 : 0;
#if DONUT_DIAGNOSTICS
  for (unsigned page = 0; page < 2; ++page) {
    memcpy(framebuffer[page] + 2*96 + 8, "Rendering...", sizeof("Rendering...")-1);
    memcpy(framebuffer[page] + 4*96 + 8, "frame 00 ring 00 / 90", sizeof("frame 00 ring 00 / 90")-1);
  }
#endif
  symphony_screen(0, SYMPHONY_ASCII8);
  symphony_screen(2, 0x00ffffff);
  symphony_screen(3, 0);
  symphony_screen(4, 0);
  symphony_screen(1, (uintptr_t)framebuffer[back ^ 1]);
  int sA=1024,cA=0,sB=1024,cB=0,_;
  for (;;) {
#if DONUT_DIAGNOSTICS
    unsigned hits = 0, ink = 0, copy_errors = 0;
    int sample_x = 0, sample_y = 0, sample_n = 0;
#endif
    memset(b, 32, 1760);  // text buffer
    memset(z, 127, 1760);   // z buffer
    int sj=0, cj=1024;
    for (int j = 0; j < 90; j++) {
#if DONUT_DIAGNOSTICS
      /* The screen reads RAM asynchronously. Keep these stores even when
       * optimizing: they expose progress before the next screen() call. */
      volatile unsigned char *status = framebuffer[back ^ 1] + 4*96 + 8;
      status[6] = '0' + (frame % 100) / 10;
      status[7] = '0' + frame % 10;
      status[14] = '0' + (unsigned)j / 10;
      status[15] = '0' + (unsigned)j % 10;
#endif
      int si = 0, ci = 1024;  // sine and cosine of angle i
      for (int i = 0; i < 324; i++) {
        int R1 = 1, R2 = 2048, K2 = 5120*1024;

        int x0 = R1*cj + R2,
            x1 = ci*x0 >> 10,
            x2 = cA*sj >> 10,
            x3 = si*x0 >> 10,
            x4 = R1*x2 - (sA*x3 >> 10),
            x5 = sA*sj >> 10,
            x6 = K2 + R1*1024*x5 + cA*x3,
            x7 = cj*si >> 10,
            x = 40 + 30*(cB*x1 - sB*x4)/x6,
            y = 12 + 15*(cB*x4 + sB*x1)/x6,
            N = (((-cA*x7 - cB*(((-sA*x7)>>10) + x2) - ci*((cj*sB)>>10))>>10) - x5)>>7;

        int o = x + 80 * y;
        signed char zz = (x6-K2)>>15;
#if DONUT_DIAGNOSTICS
        if (j == 0 && i == 0) { sample_x = x; sample_y = y; sample_n = N; }
#endif
        if (22 > y && y > 0 && x > 0 && 80 > x && zz < z[o]) {
#if DONUT_DIAGNOSTICS
          ++hits;
#endif
          z[o] = zz;
          b[o] = ".,-~:;=!*#$@"[N > 0 ? N : 0];
        }
        R(5, 8, ci, si)  // rotate i
      }
      R(9, 7, cj, sj)  // rotate j
    }
    /* Center the original 80x22 frame inside the 96x40 character screen.
     * The other buffer remains visible while this frame is generated/copied.
     */
    for (unsigned row = 0; row < 22; ++row)
      memcpy(framebuffer[back] + (row + 9) * 96 + 8, b + row * 80, 80);
#if DONUT_DIAGNOSTICS
    memcpy(framebuffer[back] + 2*96 + 8, "Frame ready.", sizeof("Frame ready.")-1);
    for (unsigned i = 0; i < 1760; ++i) {
      if (b[i] != 32 && b[i] != 0) ++ink;
      if (framebuffer[back][(i/80+9)*96+8+i%80] != (unsigned char)b[i]) ++copy_errors;
    }
    unsigned char *stats = framebuffer[back] + 5*96 + 8;
    memcpy(stats, "hits=00000000 ink=00000000 copyerr=00000000", 43);
    diagnostic_hex(stats+5, hits);
    diagnostic_hex(stats+18, ink);
    diagnostic_hex(stats+35, copy_errors);
    stats = framebuffer[back] + 6*96 + 8;
    memcpy(stats, "x=00000000 y=00000000 N=00000000", 32);
    diagnostic_hex(stats+2, (unsigned)sample_x);
    diagnostic_hex(stats+13, (unsigned)sample_y);
    diagnostic_hex(stats+24, (unsigned)sample_n);
    memcpy(framebuffer[back] + 7*96 + 8, "palette: .,-~:;=!*#$@", sizeof("palette: .,-~:;=!*#$@")-1);
#endif
    symphony_screen(1, (uintptr_t)framebuffer[back]);
    back ^= 1;
    ++frame;
    R(5, 7, cA, sA);
    R(5, 8, cB, sB);
    if (DONUT_FRAMES && frame >= DONUT_FRAMES)
      return 0;
    unsigned event;
    while ((event = symphony_keyboard()) != 0) {
      unsigned key = event & SYMPHONY_KEY_MASK;
      if ((event & SYMPHONY_KEY_DOWN) && (key == 'q' || key == 'Q' || key == 27))
        return 0;
    }
  }
}

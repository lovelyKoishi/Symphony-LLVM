/* Compare against the pinned, unmodified LiteX upstream math on the host CPU.
 * Only terminal output and stop-condition hooks are substituted.
 */
#include <stdio.h>
#include <stdlib.h>
static int wanted_frames, completed_frames;
static int discard_putchar(int c) { return c; }
static int discard_getchar(void) { return 0; }
static int discard_fputs(const char *s, FILE *stream) { (void)s; (void)stream; return 0; }
int readchar_nonblock(void) { return ++completed_frames >= wanted_frames; }
#define putchar discard_putchar
#define getchar discard_getchar
#define fputs discard_fputs
#include "../third_party/litex_donut/donut.c"
#undef putchar
#undef getchar
#undef fputs
int main(int argc, char **argv) {
    wanted_frames = argc > 1 ? atoi(argv[1]) : 1;
    if (wanted_frames < 1) return 1;
    donut();
    if (fwrite(b, 1, sizeof(b), stdout) != sizeof(b)) return 1;
    if (fwrite(z, 1, sizeof(z), stdout) != sizeof(z)) return 1;
    return 0;
}

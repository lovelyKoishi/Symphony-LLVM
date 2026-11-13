#include <stdint.h>
#include "symphony.h"

/* Headerless Pixel32 data on the 16 MiB persistent disk. The generator fixes
 * these constants at build time; the machine only copies pixels, no parsing. */
#ifndef IMAGE_RESOLUTION
#define IMAGE_RESOLUTION 31u
#endif
#ifndef IMAGE_DISK_OFFSET
#define IMAGE_DISK_OFFSET 0u
#endif
#define IMAGE_WIDTH (4u * (IMAGE_RESOLUTION + 1u))
#define IMAGE_HEIGHT (3u * (IMAGE_RESOLUTION + 1u))
#define IMAGE_BYTES (IMAGE_WIDTH * IMAGE_HEIGHT * 4u)
#define FRAMEBUFFER_BASE 0x00400000u
#define DISK_BYTES 16777216u

_Static_assert(IMAGE_RESOLUTION <= 255u, "resolution must be 0..255");
_Static_assert((IMAGE_DISK_OFFSET & 3u) == 0, "disk offset must be word aligned");
_Static_assert(IMAGE_DISK_OFFSET <= DISK_BYTES - IMAGE_BYTES, "image exceeds disk");
_Static_assert(FRAMEBUFFER_BASE + IMAGE_BYTES <= 0x01000000u, "framebuffer exceeds RAM");

int main(void) {
    volatile uint32_t *pixels = (volatile uint32_t *)(uintptr_t)FRAMEBUFFER_BASE;
    symphony_screen(0, SYMPHONY_PIXEL32);
    symphony_screen(2, IMAGE_RESOLUTION);
    symphony_screen(1, FRAMEBUFFER_BASE);
    for (unsigned i = 0; i < IMAGE_BYTES / 4u; ++i)
        pixels[i] = symphony_pload(IMAGE_DISK_OFFSET + i * 4u);
    return 0; /* Startup parks at __sym_halt; the image stays visible. */
}

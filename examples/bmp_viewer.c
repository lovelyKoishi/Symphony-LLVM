#include <stdint.h>
#include "symphony.h"
#include "tty.h"

/* A complete BMP file starts here in the 16 MiB persistent memory. */
#ifndef BMP_DISK_OFFSET
#define BMP_DISK_OFFSET 0u
#endif
#define DISK_BYTES 16777216u
#define FRAMEBUFFER_BASE 0x00400000u
_Static_assert(BMP_DISK_OFFSET <= DISK_BYTES - 56u, "BMP header exceeds disk");

static unsigned cached_address = 0xffffffffu;
static uint32_t cached_word;

static unsigned byte_at(unsigned offset) {
    unsigned address = BMP_DISK_OFFSET + offset;
    unsigned aligned = address & ~3u;
    if (aligned != cached_address) {
        cached_word = symphony_pload(aligned);
        cached_address = aligned;
    }
    return (cached_word >> (24u - (address & 3u) * 8u)) & 255u;
}

static unsigned le16(unsigned offset) {
    return byte_at(offset) | (byte_at(offset+1) << 8);
}

static uint32_t le32(unsigned offset) {
    return byte_at(offset) | (byte_at(offset+1) << 8) |
           (byte_at(offset+2) << 16) | (byte_at(offset+3) << 24);
}

/* Fetch the three BGR bytes via aligned disk words. Even at the end of disk,
 * this never requests a word beyond the validated byte range's containing word. */
static uint32_t pixel_rgb(unsigned offset) {
    unsigned address = BMP_DISK_OFFSET + offset;
    unsigned misalignment = address & 3u;
    unsigned shift = misalignment * 8u;
    uint32_t bgr = symphony_pload(address & ~3u) << shift;
    if (misalignment > 1)
        bgr |= symphony_pload((address & ~3u) + 4u) >> (32u-shift);
    return ((bgr << 16) & 0xff000000u) | (bgr & 0x00ff0000u) |
           ((bgr >> 16) & 0x0000ff00u);
}

static int error(const char *message) {
    tty_init();
    tty_puts("BMP viewer\n");
    tty_puts(message);
    tty_putc('\n');
    tty_set_cursor_visible(0);
    return 1;
}

int main(void) {
    if (le16(0) != 0x4d42u) return error("Not a BMP file (expected BM).");
    unsigned file_size = le32(2);
    if (file_size < 54u || file_size > DISK_BYTES - BMP_DISK_OFFSET)
        return error("Invalid BMP file size or disk range.");
    unsigned pixels_offset = le32(10);
    unsigned dib_size = le32(14);
    if ((dib_size != 40u && dib_size != 108u && dib_size != 124u) ||
        dib_size > file_size - 14u)
        return error("Unsupported or incomplete BMP header.");
    if (pixels_offset < 14u + dib_size || pixels_offset > file_size)
        return error("Invalid BMP pixel offset.");
    unsigned width = le32(18);
    unsigned signed_height = le32(22);
    unsigned top_down = (signed_height & 0x80000000u) != 0;
    unsigned height = top_down ? 0u-signed_height : signed_height;
    if (!width || width > 65535u || !height || height > 65535u)
        return error("Invalid BMP dimensions (maximum 65535 per axis).");
    unsigned bits = le16(28);
    if (le16(26) != 1u || (bits != 24u && bits != 32u) || le32(30) != 0)
        return error("Only uncompressed 24/32-bit RGB BMP is supported.");
    unsigned bytes_per_pixel = bits / 8u;
    unsigned stride = (width * bytes_per_pixel + 3u) & ~3u;
    if (height > (file_size - pixels_offset) / stride)
        return error("BMP pixel data exceeds the declared file size.");

    unsigned draw_width = width, draw_height = height;
    if (width > 1024u || height > 768u) {
        if (width * 768u >= height * 1024u) {
            draw_width = 1024;
            draw_height = height * 1024u / width;
            if (!draw_height) draw_height = 1;
        } else {
            draw_height = 768;
            draw_width = width * 768u / height;
            if (!draw_width) draw_width = 1;
        }
    }
    unsigned k = (draw_width+3u)/4u;
    unsigned vertical = (draw_height+2u)/3u;
    if (vertical > k) k = vertical;
    unsigned screen_width = k*4u, screen_height = k*3u;
    unsigned left = (screen_width-draw_width)/2u;
    unsigned top = (screen_height-draw_height)/2u;
    volatile uint32_t *framebuffer = (volatile uint32_t *)(uintptr_t)FRAMEBUFFER_BASE;

    /* Letterbox pixels must be black even when reusing nonzero framebuffer RAM. */
    for (unsigned i = 0; i < screen_width*screen_height; ++i) framebuffer[i] = 0;
    symphony_screen(0, SYMPHONY_PIXEL32);
    symphony_screen(2, k-1u);
    symphony_screen(1, FRAMEBUFFER_BASE);
    for (unsigned y = 0; y < draw_height; ++y) {
        unsigned source_y = y * height / draw_height;
        if (!top_down) source_y = height - 1u - source_y;
        unsigned row = pixels_offset + source_y * stride;
        unsigned dest = (y+top)*screen_width + left;
        for (unsigned x = 0; x < draw_width; ++x) {
            unsigned source_x = x * width / draw_width;
            framebuffer[dest+x] = pixel_rgb(row + source_x * bytes_per_pixel);
        }
    }
    return 0;
}

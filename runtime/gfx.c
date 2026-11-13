#include "gfx.h"
#include "symphony.h"

static volatile uint8_t framebuffer[GFX_WIDTH * GFX_HEIGHT];

void gfx_init(void) {
    symphony_screen(0, SYMPHONY_PIXEL8);
    symphony_screen(2, 31);
    symphony_screen(1, (uintptr_t)framebuffer);
}

void gfx_clear(uint8_t color) {
    for (unsigned i = 0; i < sizeof(framebuffer); ++i)
        framebuffer[i] = color;
}

void gfx_pixel(int16_t x, int16_t y, uint8_t color) {
    if ((unsigned)x < GFX_WIDTH && (unsigned)y < GFX_HEIGHT)
        framebuffer[(unsigned)y * GFX_WIDTH + (unsigned)x] = color;
}

static unsigned outcode(int x, int y) {
    return (x < 0 ? 1u : x >= GFX_WIDTH ? 2u : 0u) |
           (y < 0 ? 4u : y >= GFX_HEIGHT ? 8u : 0u);
}

/* Endpoints stay within int16 range. Magnitudes are <=65535, so their
 * unsigned product fits u32 even when it would overflow signed i32.
 */
static __attribute__((noinline)) int offset(int delta, int distance, int divisor) {
    unsigned a = delta < 0 ? (unsigned)-delta : (unsigned)delta;
    unsigned b = distance < 0 ? (unsigned)-distance : (unsigned)distance;
    unsigned d = divisor < 0 ? (unsigned)-divisor : (unsigned)divisor;
    unsigned result = a * b / d;
    return ((delta < 0) ^ (distance < 0) ^ (divisor < 0)) ? -(int)result : (int)result;
}

void gfx_line(int16_t ax, int16_t ay, int16_t bx, int16_t by, uint8_t color) {
    int x0 = ax, y0 = ay, x1 = bx, y1 = by;
    /* Cohen-Sutherland clipping bounds runtime even for far-away endpoints. */
    for (;;) {
        unsigned a = outcode(x0, y0), b = outcode(x1, y1);
        if (!(a | b))
            break;
        if (a & b)
            return;
        unsigned code = a ? a : b;
        int x, y;
        if (code & 12u) {
            y = code & 4u ? 0 : GFX_HEIGHT - 1;
            x = x0 + offset(x1 - x0, y - y0, y1 - y0);
        } else {
            x = code & 1u ? 0 : GFX_WIDTH - 1;
            y = y0 + offset(y1 - y0, x - x0, x1 - x0);
        }
        if (a) {
            x0 = x;
            y0 = y;
        } else {
            x1 = x;
            y1 = y;
        }
    }

    int dx = x1 > x0 ? x1 - x0 : x0 - x1;
    int dy = y1 > y0 ? y0 - y1 : y1 - y0;
    int sx = x0 < x1 ? 1 : -1;
    int sy = y0 < y1 ? 1 : -1;
    int error = dx + dy;
    for (;;) {
        framebuffer[(unsigned)y0 * GFX_WIDTH + (unsigned)x0] = color;
        if (x0 == x1 && y0 == y1)
            return;
        int twice = error * 2;
        if (twice >= dy) {
            error += dy;
            x0 += sx;
        }
        if (twice <= dx) {
            error += dx;
            y0 += sy;
        }
    }
}

void gfx_rect(int16_t x, int16_t y, int16_t width, int16_t height, uint8_t color) {
    if (width <= 0 || height <= 0)
        return;
    /* Rect edges can exceed int16 even though their inputs fit; clip their
     * spans directly in i32 rather than narrowing endpoints through gfx_line.
     */
    int right = (int)x + width - 1, bottom = (int)y + height - 1;
    int left_clip = x < 0 ? 0 : x;
    int right_clip = right >= GFX_WIDTH ? GFX_WIDTH - 1 : right;
    int top_clip = y < 0 ? 0 : y;
    int bottom_clip = bottom >= GFX_HEIGHT ? GFX_HEIGHT - 1 : bottom;
    for (int col = left_clip; col <= right_clip; ++col) {
        if ((unsigned)y < GFX_HEIGHT)
            framebuffer[(unsigned)y * GFX_WIDTH + (unsigned)col] = color;
        if ((unsigned)bottom < GFX_HEIGHT)
            framebuffer[(unsigned)bottom * GFX_WIDTH + (unsigned)col] = color;
    }
    for (int row = top_clip; row <= bottom_clip; ++row) {
        if ((unsigned)x < GFX_WIDTH)
            framebuffer[(unsigned)row * GFX_WIDTH + (unsigned)x] = color;
        if ((unsigned)right < GFX_WIDTH)
            framebuffer[(unsigned)row * GFX_WIDTH + (unsigned)right] = color;
    }
}

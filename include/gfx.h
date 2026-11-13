#ifndef SYMPHONY_GFX_H
#define SYMPHONY_GFX_H
#include <stdint.h>

/* Pixel8, 128 x 96. Coordinates/dimensions are signed 16-bit integers.
 * Colors are RRRGGGBB. Link with symphony-cc --gfx.
 */
enum { GFX_WIDTH = 128, GFX_HEIGHT = 96 };
enum { GFX_BLACK = 0, GFX_RED = 224, GFX_GREEN = 28, GFX_BLUE = 3,
       GFX_YELLOW = 252, GFX_MAGENTA = 227, GFX_CYAN = 31, GFX_WHITE = 255 };

/* Attach the framebuffer; does not clear it. Drawing before init is allowed. */
void gfx_init(void);
void gfx_clear(uint8_t color);
void gfx_pixel(int16_t x, int16_t y, uint8_t color);
/* Clip to the viewport before rasterizing; both endpoints are included. */
void gfx_line(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint8_t color);
/* Outline only. Width/height <= 0 do nothing; partially visible edges clip. */
void gfx_rect(int16_t x, int16_t y, int16_t width, int16_t height, uint8_t color);

#endif

#include "gfx.h"

int main(void) {
    gfx_rect(8, 8, 112, 80, GFX_WHITE);
    gfx_rect(20, 20, 32, 24, GFX_RED);
    gfx_rect(76, 52, 32, 24, GFX_CYAN);
    gfx_line(8, 8, 119, 87, GFX_GREEN);
    gfx_line(119, 8, 8, 87, GFX_BLUE);
    gfx_pixel(64, 48, GFX_YELLOW);
    gfx_init();
    return 0;
}

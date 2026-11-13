#include "gfx.h"

/* Static wireframe: fixed projected points, no rotation calculation or fill. */
int main(void) {
    /* Three rear edges in gray, nine visible edges in white. */
    gfx_line(64, 8, 64, 48, 73);
    gfx_line(64, 48, 99, 68, 73);
    gfx_line(29, 68, 64, 48, 73);

    gfx_line(64, 8, 99, 28, 255);
    gfx_line(99, 28, 64, 48, 255);
    gfx_line(64, 48, 29, 28, 255);
    gfx_line(29, 28, 64, 8, 255);
    gfx_line(99, 68, 64, 88, 255);
    gfx_line(64, 88, 29, 68, 255);
    gfx_line(99, 28, 99, 68, 255);
    gfx_line(64, 48, 64, 88, 255);
    gfx_line(29, 28, 29, 68, 255);

    /* Attach only after drawing so the first displayed frame is complete. */
    gfx_init();
    return 0;
}

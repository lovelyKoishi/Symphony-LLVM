#include "symphony.h"

/* ASCII8 reads a fixed grid; initialize the whole buffer, not just a string. */
static unsigned char framebuffer[3840] = "Hello from C -> LLVM -> Symphony!";

int main(void) {
    symphony_screen(0, SYMPHONY_ASCII8);
    symphony_screen(1, (uintptr_t)framebuffer);
    symphony_screen(2, 0x00ffffff);
    symphony_screen(3, 0);
    return 0; /* The startup code enters a stable loop after main returns. */
}

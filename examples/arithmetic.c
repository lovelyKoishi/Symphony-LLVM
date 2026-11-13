#include "symphony.h"

/* Volatile operands keep the arithmetic in the generated program. */
static volatile unsigned numerator = 20;
static volatile unsigned denominator = 3;

int main(void) {
    unsigned a = numerator;
    unsigned b = denominator;
    symphony_out(a * b);  /* 60: hardware mul */
    symphony_out(a / b);  /*  6: hardware unsigned div */
    symphony_out(a % b);  /*  2: hardware unsigned mod */
    return 0;
}

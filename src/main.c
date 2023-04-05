/*
 * Copyright (c) 2023 Alexander Baskikh
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

#include <tty.h>

int main() {
    tty_puts("Hello, World!");
    tty_putchar('F');

    return 0;
}

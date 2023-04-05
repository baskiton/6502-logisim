/*
 * Copyright (c) 2023 Alexander Baskikh
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

#include <tty.h>

#include "romfs.h"

static int strlen(const char *s) {
    const char *x = s;
    while (*s)
        ++s;
    return (int)(s - x);
}

static void print_hex(uint32_t x, char *s) {
    const char a[] = "0123456789ABCDEF";
    int i = 9;
    s[i] = 0;
    while (--i) {
        s[i] = a[x & 0x0F];
        x >>= 4;
    }
    s[0] = ' ';
}

/* Return a value with all bytes in the 32 bit argument swapped */
#define bswap_32(x) ((uint32_t)     \
    ((((x) & 0xFF000000U) >> 24) | (((x) & 0x00FF0000U) >> 8) | \
     (((x) & 0x0000FF00U) << 8) | (((x) & 0x000000FFU) << 24)))

#define ALIGN16RET(p) (void *)(((uint32_t)(p) & 0xFFF0) + 0x10)

void romfs_dump(rom_fs_t *rom) {
//    char buf[64];
    tty_puts(rom->hdr);
    tty_puts(rom->vol_name);
    int l = strlen(rom->vol_name);
    uintptr_t rom_p = (uintptr_t)rom;
//    print_hex(rom_p, buf);
//    tty_puts(buf + 1);
    rom_fh_t *fh = ALIGN16RET(rom->vol_name + l);
    do {
        uint32_t next_off = bswap_32(fh->next_fh) & 0xFFF0;
//        print_hex((uintptr_t)fh, buf);
//        print_hex(next_off, buf + 9);
//        tty_puts(buf + 1);
        tty_puts(fh->filename);
        if (!next_off)
            break;
        fh = (void *)(rom_p + next_off);
    } while (1);
}

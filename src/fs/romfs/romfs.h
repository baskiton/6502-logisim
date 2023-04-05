/*
 * Copyright (c) 2023 Alexander Baskikh
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

#ifndef _ROMFS_H
#define _ROMFS_H

typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int32_t;
typedef signed long long int64_t;

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long uint32_t;
typedef unsigned long long uint64_t;

typedef unsigned int uintptr_t;

typedef struct {
    char hdr[8];
    int32_t size;
    int32_t checksum;
    char vol_name[];
} rom_fs_t;

typedef struct {
    uint32_t next_fh;
    int32_t spec;
    int32_t size;
    int32_t checksum;
    char filename[];
} rom_fh_t;

typedef enum {
    ROMFH_HRD = 0,
    ROMFH_DIR,
    ROMFH_REG,
    ROMFH_LNK,
    ROMFH_BLK,
    ROMFH_CHR,
    ROMFH_SCK,
    ROMFH_FIF
} romfile_mode;
#define ROMFH_EXEC 8


void romfs_dump(rom_fs_t *rom);

#endif // _ROMFS_H

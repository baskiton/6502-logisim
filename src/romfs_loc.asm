;----------------------------------------------------------
; Copyright (c) 2023 Alexander Baskikh
;
; MIT License (MIT), http://opensource.org/licenses/MIT
; Full license can be found in the LICENSE file
;----------------------------------------------------------

    .include asm/zpage.ah

    .section rodata
    .global ROMFS_LOC

    .align 4
    .incdir build
ROMFS_LOC:
    .incbin romfs.img

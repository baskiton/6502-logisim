;----------------------------------------------------------
; Copyright (c) 2023 Alexander Baskikh
;
; MIT License (MIT), http://opensource.org/licenses/MIT
; Full license can be found in the LICENSE file
;----------------------------------------------------------

;--------------------------------------
; TTY functions
; TTY_PUTCHAR
;--------------------------------------

    .include asm/io.ah
    .include asm/tty.ah
    .include asm/zpage.ah

    .zpage r0, r1
    .global _tty_puts

    .section text

_tty_putchar:
    ; %a - char to print
    TTY_PUTCHAR
    rts

_tty_puts:
    ; r0 - lo addr of string
    ; r1 - hi addr of string
    pha
    phy

    ldy #0xff
.l1:
    iny
    lda (r0),y
    beq .l2
    TTY_PUTCHAR
    bra .l1
.l2:
    ; put trailing newline
    lda #'\n'
    TTY_PUTCHAR

    ply
    pla
    rts

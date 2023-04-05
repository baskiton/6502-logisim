;----------------------------------------------------------
; Copyright (c) 2023 Alexander Baskikh
;
; MIT License (MIT), http://opensource.org/licenses/MIT
; Full license can be found in the LICENSE file
;----------------------------------------------------------

    .include asm/zpage.ah

    .section vectors

    .addr nmi
    .addr reset
    .addr irq

    .section text
    .global reset, _main

nmi:
    ; __interrupt attr in C
    ; User stack pointer is set to __isrstack. This value for the
    ; interrupt stack has to be provided e.g. by the linker script.
    rti

irq:
    ; __interrupt attr in C
    ; User stack pointer is set to __isrstack. This value for the
    ; interrupt stack has to be provided e.g. by the linker script.
    rti

reset:
    ; clear system sp
    ldx #0xff
    txs
    inx

    ; set user sp
    lda  #<__SE
    sta  sp
    lda  #>__SE
    sta  sp+1

;     ; erase bss
;     lda #<__BB
;     sta r0
;     lda #>__BB
;     sta r1
;     lda #0
;     tay
;     beq l3
; l2:
;     sta (r0),y
;     inc r0
;     bne l3
;     inc r1
; l3:
;     ldx r0
;     cpx #<__BE
;     bne l2
;     ldx r1
;     cpx #>__BE
;     bne l2

;     ; argc,argv
;     lda #0
;     sta r0
;     sta r1
;     lda #<(nullp)
;     sta r2
;     lda #>(nullp)
;     sta r3

    cli
    ; sump to clib start
    ; TODO: jmp or jsr???
    ; jsr _main

    .extern _romfs_dump
    lda #<ROMFS_LOC
    sta r0
    lda #>ROMFS_LOC
    sta r1
    jsr _romfs_dump

    ; exit code, called from clib
    section text
    .global ___exit

___exit:
    sei
    stp ; STOP
.l1:    ; just in case
    wai
    bra .l1

nullp:  .addr $0000

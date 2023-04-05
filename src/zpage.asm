;----------------------------------------------------------
; Copyright (c) 2023 Alexander Baskikh
;
; MIT License (MIT), http://opensource.org/licenses/MIT
; Full license can be found in the LICENSE file
;----------------------------------------------------------

    .section zpage
    .global r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15
    .global r16, r17, r18, r19, r0, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31
    .global sp, btmp0, btmp1, btmp2, btmp3

    .include asm/zpage.ah

r0:     .reserve 1
r1:     .reserve 1
r2:     .reserve 1
r3:     .reserve 1
r4:     .reserve 1
r5:     .reserve 1
r6:     .reserve 1
r7:     .reserve 1
r8:     .reserve 1
r9:     .reserve 1
r10:    .reserve 1
r11:    .reserve 1
r12:    .reserve 1
r13:    .reserve 1
r14:    .reserve 1
r15:    .reserve 1
r16:    .reserve 1
r17:    .reserve 1
r18:    .reserve 1
r19:    .reserve 1
r20:    .reserve 1
r21:    .reserve 1
r22:    .reserve 1
r23:    .reserve 1
r24:    .reserve 1
r25:    .reserve 1
r26:    .reserve 1
r27:    .reserve 1
r28:    .reserve 1
r29:    .reserve 1
r30:    .reserve 1
r31:    .reserve 1
sp:     .reserve 2
btmp0:  .reserve 4
btmp1:  .reserve 4
btmp2:  .reserve 4
btmp3:  .reserve 4

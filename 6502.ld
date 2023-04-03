ZEROPAGE_START = 0x0000;
SYS_STACK_START = 0x0100;
RAM_START = 0x0200;
USTACK_START = 0xC800;
IO_START = 0xD000;
ROM_START = 0xE000;
ROM_LEN = 0x2000;
VECTORS_START = 0xFFFA;
MEM_END = 0x10000;

MEMORY {
    zero : org = ZEROPAGE_START, len = SYS_STACK_START - ZEROPAGE_START
    sstack : org = SYS_STACK_START, len = RAM_START - SYS_STACK_START
    ram : org = RAM_START, len = USTACK_START - RAM_START
    ustack : org = USTACK_START, len = IO_START - USTACK_START
    io : org = IO_START, len = ROM_START - IO_START
    rom : org = ROM_START, len = VECTORS_START - ROM_START
    vectors : org = VECTORS_START, len = MEM_END - VECTORS_START
}

SECTIONS {
    zpage (NOLOAD): { *(zero) *(.zero) *(zpage) *(.zpage) *(zp1) *(zp2) } >zero

    data: { *(data) *(.data) } >ram
    bss (NOLOAD): { *(bss) *(.bss) } >ram
    text: { *(text) *(.text) } >rom
    rodata: { *(rodata) *(.rodata) } >rom
    vectors: { *(vectors) *(.vectors) } >vectors

    __BB = ADDR(bss);
    __BE = ADDR(bss) + SIZEOF(bss);
    __SE = USTACK_START + (IO_START - USTACK_START);
    ___heap = ADDR(bss) + SIZEOF(bss);
    ___heapend = USTACK_START - 1;
}

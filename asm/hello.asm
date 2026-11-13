; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.
__sym_start:
    mov sp, 256
    lsl sp, sp, 16
    call __sym_fn_main_0
__sym_halt:
    jmp __sym_halt
__sym_trap:
    jmp __sym_trap

; function main, frame 0 bytes
__sym_fn_main_0:
    push r13
    mov r13, sp
__sym_block_1:
    mov r1, 0
    mov r2, 0
    screen r1, r2
    mov r1, 1
    mov r2, 1
    lsl r2, r2, 16
    screen r1, r2
    mov r1, 2
    mov r2, 255
    lsl r2, r2, 16
    or r2, r2, 65535
    screen r1, r2
    mov r1, 3
    mov r2, 0
    screen r1, r2
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; Global addresses (zero tail uses initially zeroed RAM).
; framebuffer = 65536
@65536
U8 72
U8 101
U8 108
U8 108
U8 111
U8 32
U8 102
U8 114
U8 111
U8 109
U8 32
U8 67
U8 32
U8 45
U8 62
U8 32
U8 76
U8 76
U8 86
U8 77
U8 32
U8 45
U8 62
U8 32
U8 83
U8 121
U8 109
U8 112
U8 104
U8 111
U8 110
U8 121
U8 33

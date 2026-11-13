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
__sym_block_1:
    mov r1, 0
    mov r2, 3
    screen r1, r2
    mov r1, 2
    mov r2, 31
    screen r1, r2
    mov r1, 1
    mov r2, 64
    lsl r2, r2, 16
    screen r1, r2
    mov r1, 0
    mov r9, r1
    jmp __sym_block_3
__sym_block_2:
    mov r1, 0
    ret
__sym_block_3:
    lsl r7, r9, 2
    mov r1, r7
    pload r1, [r1]
    mov r8, r1
    mov r1, 64
    lsl r1, r1, 16
    mov r2, r9
    lsl r2, r2, 2
    add r1, r1, r2
    mov r7, r1
    store_32 [r7], r8
    add r7, r9, 1
    mov r2, 12288
    cmp r7, r2
    je __sym_edge_true_4
    mov r9, r7
    jmp __sym_block_3
__sym_edge_true_4:
    jmp __sym_block_2

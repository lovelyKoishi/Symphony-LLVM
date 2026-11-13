; Symphony LLVM backend 0.1. Big endian, 32-bit values/pointers.
__sym_start:
    mov sp, 256
    lsl sp, sp, 16
    call __sym_fn_main_0
__sym_halt:
    jmp __sym_halt
__sym_trap:
    jmp __sym_trap

; function main, frame 16 bytes
__sym_fn_main_0:
    push r13
    mov r13, sp
    sub sp, sp, 16
__sym_block_1:
    sub r1, r13, 8
    sub r12, r13, 4
    store_32 [r12], r1
    sub r1, r13, 16
    sub r12, r13, 12
    store_32 [r12], r1
    mov r2, 1
    lsl r2, r2, 16
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    sub r12, r13, 4
    load_32 r2, [r12]
    store_32 [r2], r1
    mov r2, 1
    lsl r2, r2, 16
    or r2, r2, 4
    load_32 r1, [r2]
    mov r7, r1
    mov r1, r7
    sub r12, r13, 12
    load_32 r2, [r12]
    store_32 [r2], r1
    sub r12, r13, 4
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r7, r1
    sub r12, r13, 12
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r8, r1
    mov r1, r7
    mov r2, r8
    mul r1, r1, r2
    mov r9, r1
    mov r1, r9
    out r1
    sub r12, r13, 4
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r7, r1
    sub r12, r13, 12
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r8, r1
    mov r1, r7
    mov r2, r8
    div r1, r1, r2
    mov r9, r1
    mov r1, r9
    out r1
    sub r12, r13, 4
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r7, r1
    sub r12, r13, 12
    load_32 r2, [r12]
    load_32 r1, [r2]
    mov r8, r1
    mov r1, r7
    mov r2, r8
    mod r1, r1, r2
    mov r9, r1
    mov r1, r9
    out r1
    mov r1, 0
    mov sp, r13
    pop r13
    ret

; Global addresses (zero tail uses initially zeroed RAM).
; numerator = 65536
; denominator = 65540
@65536
U8 0
U8 0
U8 0
U8 20
U8 0
U8 0
U8 0
U8 3

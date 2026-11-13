; ASCII8: one byte per character. No clearing or runtime character stores.
screen zr, 0

; Screen option 1: framebuffer offset = address of hello_text.
or r1, zr, hello_text
or r2, zr, 1
screen r2, r1

; ASCII8 foreground uses RGB: white = 0xFFFFFF.
or r3, zr, 65535
lsl r3, r3, 8
or r3, r3, 255
or r2, zr, 2
screen r2, r3
or r2, zr, 3
screen r2, 0

hello_stop:
jmp hello_stop

hello_text:
"hello\0"

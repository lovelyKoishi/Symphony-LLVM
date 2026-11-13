; ASCII8; use the message itself as the framebuffer.
screen zr, 0
or r1, zr, message
or r2, zr, 1
screen r2, r1

; White text on black, using the verified RGB foreground setting.
or r3, zr, 65535
lsl r3, r3, 8
or r3, r3, 255
or r2, zr, 2
screen r2, r3
or r2, zr, 3
screen r2, 0

; Test multiplication: 7 * 9 must equal 63.
or r1, zr, 7
or r2, zr, 9
mul r3, r1, r2
cmp r3, 63
jne test_div
or r4, zr, 89
or r5, zr, mul_result
store_8 [r5], r4

; Test integer division: 20 / 3 must equal 6.
test_div:
or r1, zr, 20
or r2, zr, 3
div r3, r1, r2
cmp r3, 6
jne done
or r4, zr, 89
or r5, zr, div_result
store_8 [r5], r4

done:
jmp done

message:
"MUL 7*9=63: "
mul_result:
"N"
"    DIV 20/3=6: "
div_result:
"N    (Y=PASS N=FAIL)\0"

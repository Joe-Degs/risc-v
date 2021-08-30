.globl main

.data
msg: .string "hello world"
.equ len_msg, 11
    
.text
main:
    li a0, 1
    la a1, msg
    li a2, len_msg
    li a7, 64
    ecall

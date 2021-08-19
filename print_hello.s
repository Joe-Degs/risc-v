.globl __start

.rodata
    
    msg: .string "hello world"
    
.text

__start:
    li a0, 4
    la a1, msg
    ecall
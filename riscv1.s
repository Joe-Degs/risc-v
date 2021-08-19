.globl __start

.rodata
    msg: .string "hello mothersucker"
    
.text

__start:
    la t0, msg
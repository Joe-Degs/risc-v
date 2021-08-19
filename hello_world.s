.globl __start

# using ecalls
# ecalls are close to syscalls.
# you put some values in some registers, you call them
# they come do their job and leave.
# they do basic read, write and other stuff in the documentation.
__start:
	addi a0, zero, 1
	la a1, helloworld
	addi a2, zero, 13
	addi a7, zero, 64
	ecall

	addi a0, zero, 0
	addi a7, zero, 93
	ecall

.data

helloworld:		.string "Hello World!\n"

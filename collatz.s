.globl __start

.text

# collatz conjecture algorithm
# n = 9
# while n != 1:
#	if n % 2 == 0:
#		n = n / 2
#	else:
#		n = 3*n + 1
#	endif
# endwhile

collatz:
	# init function.
	addi t3, t3, 1
collatz_if:
	andi t0, a0, 1
	bne t0, zero, collatz_else
	srai a0, a0, 1
	jal zero, collatz_compare
collatz_else:
	slli t1, a0, 1
	add  t1, t1, a0
	addi a0, t1, 1
collatz_compare:
	bne a0, t3, collatz_if
	jalr zero, ra, 0

__start:
	addi a0, a0, 9
	jal ra, collatz

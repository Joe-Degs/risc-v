.globl __start

.text

# algorithm
#
# while counter > 0:
#	if counter & 1 == 0:
#		acc += input
#	endif
#	counter >>= 1
#	input <<= 1
# endwhile
fastmul:
	add t0, t0, zero
fastmul_if:
	andi t1, a1, 1
	srai a1, a1, 1
	beq t1, zero, fastmul_compare
	add t0, t0, a0
fastmul_compare:
	slli a0, a0, 1
	bne a1, zero, fastmul_if
	add a0, t0, zero
	jalr zero, ra, 0

__start:
	addi a0, a0, 32
	addi a1, a1, 400
	jal  ra, fastmul

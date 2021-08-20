# int sumsquare(int x, int y) {
# 	return mult(x, x) + y
# }

.globl __start

.text

mult:
	mv   t0, zero  # zero out temp register
	mv   t1, zero
mult_if:
	andi t1, a1, 1
	beqz t1, mult_compare
	add  t0, t0, a0
mult_compare:
	srai a1, a1, 1
	slli a0, a0, 1
	bnez a1, mult_if
	mv   a0, t0
	jr   ra

sumsquare:
	addi  sp, sp, -8
	sw   a1, 4(sp)	# put y on stack
	sw   ra, 0(sp)	# return address on stack

	mv   a1, a0		# move x into a1
	jal  mult		# mult(x, x)

	lw   a1, 4(sp)	# restore y from stack
	add  a0, a0, a1  # mult(x, x) + y
	
	lw   ra, 0(sp)	# load return address
	addi sp, sp, 8	# restore stack
	jr   ra

__start:
	li a0, 2
	li a1, 3
	jal sumsquare

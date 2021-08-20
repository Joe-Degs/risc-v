# int (int g, int h, int i, int j) {
# 	int f;
# 	f = (g + h) - (i + j);
# 	return f;
# }
# 
# - parameter variables g, h, i, j in argument vars a0, a1, a2, a3 and f s0
# - assume one temporary variable s1
# - use pseudoinstructions.

.globl __start

.text

leaf:
	add sp, sp -8 # allocate two positions on stack and put saved registers.
	sw s0, 0(sp)
	sw s1, 4(sp)
	
	add s0, a0, a1	# do f = (g + h) + (i + j)
	add s1, a2, a2
	add s0, s1, s0
	mv a0, s0	# return the value in a0 register.

	lw s0, 0(sp)
	lw s1, 4(sp)
	add sp, sp, 8
	jr ra

__start:
	li a0, 5
	li a1, 4
	li a2, 3
	li a3, 5
	li s0, 9
	li s1, 8
	jal leaf


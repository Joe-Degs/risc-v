.globl __start

.text

init_array:
    # store array elements on the stack
    addi 	a1, a1, 5
    sw 		a1, -4(sp)
    addi 	a2, a2, 2
    sw 		a2, -8(sp)
    addi 	a3, a3, 10
    sw 		a3, -12(sp)
    addi 	a4, a4, 4
    sw 		a4, -16(sp)
    # end sequence
    addi 	sp, sp, -4
    add 	a0, sp, zero     	# store start of array in a0
    addi 	a1, zero, 4      	# store len of array in a1
    # restore stack pointer
    addi 	sp, sp, 4
    jalr 	zero, ra, 0

maximum:
    # find largest element in array
    addi 	t1, t1, 0   		# keep track of largest value
max_loop:
    beq 	a1, zero, max_done
    lw 		t0, 0(a0)       	# load next element in array
    addi 	a0, a0, -4    		# change a0 to point to next item
    addi 	a1, a1, -1    		# decrease the len of array
    bge 	t1, t0, max_loop    # next element is less than the previous element
    add     t1, t0, zero 		# keep track of next largest element
    jal 	zero, max_loop     	# start loop again
max_done:
    # looping done go back to calling procedure
    add a0, zero, t1 			# return the largest element in the array
    jalr 	zero, ra, 0

__start:
    jal ra, init_array
    jal ra, maximum

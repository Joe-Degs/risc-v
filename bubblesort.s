# writting a the bubble sort algorithm in software.

# arr = [3, 2, 4, 1, 6, 9]
# 
# for _ in range(len(arr)):
#     for j in range(len(arr)-1):
#         if arr[j] > arr[j+1]:
#             arr[j], arr[j+1] = arr[j+1], arr[j]
# 
# print(arr)

.globl __start

init_array:
    # store array elements on the stack
	# and return the start address of the
	# array in a0 and len of the array in t1
	addi	sp, sp, -20
    addi 	t1, zero, 3
    sw 		t1, 0(sp)
    addi 	t1, zero, 2
    sw 		t1, 4(sp)
    addi 	t1, zero, 4
    sw 		t1, 8(sp)
    addi 	t1, zero, 1
    sw 		t1, 12(sp)
	addi	t1, zero, 6
	sw		t1, 16(sp)
	addi	t1, zero, 9
	sw		t1, 20(sp)
    # end of stores.
    add 	a0, sp, zero     	# store start of array in a0
    addi 	a1, zero, 6     	# store len of array in t1
    # restore stack pointer
    addi 	sp, sp, 20
    jalr 	zero, ra, 0

bubblesort:
	ret

__start:
	jalr ra, init_array
	jalr ra, bubblesort

# writting a the bubble sort algorithm in software.

# arr = [3, 2, 4, 1, 6, 9]
# 
# for _ in range(len(arr)):
#     for j in range(len(arr)-1):
#         if arr[j] > arr[j+1]:
#          
#           arr[j], arr[j+1] = arr[j+1], arr[j]
# 
# print(arr)

.globl __start

.data
# int32 arr[6]
arr:     .word 3, 4, 2, 5, 7, 1
arr_len: .word 6

.text

bubblesort:
# -> i = t1, j = t2
    mv   t0, zero
    mv   t1, zero
    addi t2, a1, -1     # inner_loop will loop arr_len - 2 times
    mv   t3, zero       # loop counter j
    mv   t4, a0
outer_loop:             # i
    addi a1, a1, -1
    beqz a1, end        # if len == 0? end: 
inner_loop:                  # j
    beq t2, t3, exit_inner_loop         
    lw  t5, 0(t4)            # t5 = arr[j]
    lw  t6, 4(t4)            # t6 = arr[j + 1]
    bge t6, t5, cont_inner_loop     # if t6 >= t5 then continue: 
    
    xor t5, t5, t6           # swap values
    xor t6, t5, t6
    xor t5, t5, t6
    
    sw  t5, 0(t4)            # put them back memory
    sw  t6, 4(t4)
cont_inner_loop:
    addi t4, t4, 4
    addi t3, t3, 1
    j inner_loop
exit_inner_loop:
    mv t3, zero
    mv t4, a0
    j outer_loop
end:    ret

__start:
    la  a0, arr         # *arr[0]
    lw  a1, arr_len     # length of arr
    jal bubblesort
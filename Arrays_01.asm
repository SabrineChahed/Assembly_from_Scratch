#@author CHAHED Sabrine
#@date March 29, 2023 10:30 a.m ENSIA


.globl_start
# Allocate & Initialize arrays
.data
# a Label for Array's Name
# .type Directive to indicate type of elements
# a list of initial values or a count of the number of elements
# Simply follow this:

# arr1 contains 2 words initialized to 1 & 2
# label: .type val1, val2 ...
arr1: .word 1,2

# arr2 contains 10 words initialized to 1
# label: .type value of all array elements, size of array
arr2: .word 1,10

# arr3 contains 10 bytes uninitialized 
# label: .space size of array
arr3: .space 10

n: .word 2
target: .word 2
msg: .asciz "Target found\n"
.text
_start:
# Now that we initialized our arrays
# Let's Compute the Address of their Elements
# Address of arr[i]= base adress + i * element_size
# base address is the @ of the 1 st element in array (&arr)
# To calculate @ of arr1 elemetns
# we need first to know the @ of the  st element ( base @)
# which is found in settings-> show labels window
# &arr1= 0x 10010000
# and we know the size of a word ( which is the arr1's elements type ) is 4 bytes then
#&arr1[i]= 0x 10010000 +i*4

# Now let's Traverse arr1
la a2, target
la a1, n
la a0, arr1
addi t0, a0, 0 # t0 holds the base @
li t1, 0       # t1=i=0
while:
	lw t2, 0(t0) #t2=arr[i]
	beq t2, a2, next
	beq t1, a1, next
	addi t0, t0, 4 #to=&arr[i]
	
	addi t1, t1, 1 #i++
	j while
next:
addi a7, zero, 4
# 2- Load arg values if any in a0,... as specified
# Load address of the string to print
la a0, msg
 ecall 
	

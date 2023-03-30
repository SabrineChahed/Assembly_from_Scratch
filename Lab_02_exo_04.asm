#@author CHAHED Sabrine G1
#@version March 29, 2023 04:22 p.m ENSIA


.globl_start

.data
# Allocate & Initialize array of 10 integers
arr: .word 0:10
input: .word 
input_i: .word 0 
input_limit: .word 10
sum: .word 0

msg: .asciz "Input 10 arrays elements: \n"
output: .asciz "\n Sum is: "

.text
_start:
la a0, arr

lw t0, 0(a0)
la a1, input_limit
lw a1, 0(a1)
la a2, input_i
lw a2, 0(a2)
la a3, input
lw a3, 0(a3)
la t1, sum
lw t2, 0(t1)

# Asking user to input 10 values
addi a7, zero, 4
la a0, msg
 ecall
 
get_input:
 	beq a1, a2, Print_Sum
	# Read input from user
	addi a7, zero, 5
	addi a0, a3, 0
 	ecall
 	addi t0, a0, 0
 	add t2, t2, t0
 	addi a2, a2, 1
 	addi t0, t0, 4 #t0=&arr[input_limit]
 	j get_input



Print_Sum:
addi a7, zero, 4
la a0, output
 ecall
 
addi a7, zero, 1
addi a0, t2, 0
 ecall
	
 
# CHECKED!	
 	
 	
 	
 	
 	


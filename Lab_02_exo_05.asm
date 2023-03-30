#@author CHAHED Sabrine G1
#@version March 29, 2023 09:26 p.m ENSIA


.globl_start

.data

a: .word 0
n: .word
msg: .asciz "Input size of your array: "
line: .asciz "\n"
char: .asciz "  "
i: .word 0
y: .word 0
element_size: .word 4 

.text
_start:
la s0, a
lw s0, 0(s0)

la t0, n
lw t0, 0(t0)

la t1, i
lw t1, 0(t1)

la t2, y
lw t2, 0(t2)

la s4, element_size
lw s4, 0(s4)

# total size of array in bytes
mul s6, t0, s4

# Allocate memory space for array
.macro sbrk(%bytes)
li a7, 9
li a0, %bytes
ecall
.end_macro 


addi a7, zero, 4
la a0, msg
 ecall
 
 # Read input from user
addi a7, zero, 5
addi a0, t0, 0
 ecall




# ____________________ Outer for loop  ____________________ #
      Outer_for_loop:
      beq t0, t1, exit
      		#start inner loop
      		Inner_for_loop:
      		beq t0, t2, Outer_for_loop
      		
      		mul t3, t0, t1 # i*n
      		add t3, t3, t2 # (i*n + j)
      		mul t3, t3, s4  # (i*n + j)*4
      		add t3, t3, s0 # base address + (i*n + j)*4
      		lw t3, 0(t3)   #t3= a[i][j]
      		addi s3, t3, 0 # save a[i][j] in s3
      		add t4, t1, t2 # t4= i+y
      		addi t3, t4, 0 # t3= i+y
      		
      		# SAVE i & y
      		addi s1, t1, 0  # save value of i
      		addi s2, t2, 0  # save value of y
      		
      		
      		# 1 st if statement
      		bge zero, s1, nop # if i<=0 do nothing
      		addi t1, t1, -1 # t1= i-1
      		
      		mul t3, t0, t1 # i-1 *n
      		add t3, t3, t2 # (i-1 *n + j)
      		mul t3, t3, s4  # (i-1 *n + j)*4
      		add t3, t3, s0 # base address + (i-1 *n + j)*4
      		lw t3, 0(t3)   #t3= a[i-1][j]
      		add t3, t3, t3 # i+y += a[i-1][j]
      		
      		      		
      		# 2 nd if statement
      		bge zero, s2, nop # if j<=0 do nothing 
      		addi t2, t2, -1 # t2= j-1
      		
      		mul t3, t0, t1 # i *n
      		add t3, t3, t2 # (i *n + j-1)
      		mul t3, t3, s4  # (i *n + j-1)*4
      		add t3, t3, s0 # base address + (i *n + j-1)*4
      		lw t3, 0(t3)   #t3= a[i][j-1]
      		
      		
      	   		
      		
      		# print a[i][j] which is in t3
      		addi a7, zero, 1
		addi a0, t3, 0
 		 ecall
 
      		
      		addi s2, s2, 1
      		# print char
		addi a7, zero, 4
		la a0, msg
 		ecall
 		j Inner_for_loop
      		


      addi s1, s1, 1
      # print line 
	addi a7, zero, 4
	la a0, msg
 	ecall
 	j Outer_for_loop
 	
nop:
	

exit:
	addi a7, zero, 93
	li a0, 0
	ecall




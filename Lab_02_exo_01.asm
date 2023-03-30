#@author CHAHED Sabrine G1
#@version March 29, 2023 01:45 p.m ENSIA


.globl_start

.data
# Allocate & Initialize arrays
arr1: .word 5:20
arr2: .half 7, -2, 8, -6
arr3: .space 100
str1: .asciz "This is a message"
str2: .asciz "Another important string"



msg1: .asciz "@ of arr2: "
msg2: .asciz "@ of arr3: "
msg3: .asciz "@ of str1: "
msg4: .asciz "@ of str2: "
.text
_start:
la t0, arr2
la t1, arr3
la t2, str1
la t3, str2

# Printing @ of arr2
addi a7, zero, 4
la a0, msg1
 ecall 
# Printing @ of arr2 calling syscall to print an integer
# This will print @ in Hexadecimal values
addi a7, zero, 1
addi a0, t0, 0
 ecall


# Printing @ of arr3
addi a7, zero, 4
la a0, msg2
 ecall 
# Printing @ of arr3 calling syscall to print an integer
addi a7, zero, 1
addi a0, t1, 0
 ecall
 
 
 # Printing @ of str1
addi a7, zero, 4
la a0, msg3
 ecall 
# Printing @ of str1 calling syscall to print an integer
addi a7, zero, 1
addi a0, t2, 0
 ecall
 
 
 
 # Printing @ of str2
addi a7, zero, 4
la a0, msg4
 ecall 
# Printing @ of str2 calling syscall to print an integer
addi a7, zero, 1
addi a0, t3, 0
 ecall

# CHECKED!
# ADRESSES ARE CORRECT!

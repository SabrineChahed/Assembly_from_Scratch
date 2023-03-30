#@author CHAHED Sabrine G1
#@version March 29, 2023 02:37 p.m ENSIA


.globl_start

.data
# Allocate & Initialize array1
arr1: .word 5:20
msg1: .asciz "@ of arr1[5]: "
msg2: .asciz "\n@ of arr1[17]: "

i: .word 5
y: .word 17
.text
_start:

# ___________________ Address of arr[5] _____________________ #
la t0, i
la t1, arr1 # t0 holds the base address
# &arr[i]= base address + i* elment_size
# In this case i=5
# &arr[5]= base address + 5* 4

addi t2, t0, 20 # t2 holds @ of arr1[5]



# Printing @ of arr1[5] which is in t3
addi a7, zero, 4
la a0, msg1
 ecall 
# Printing @ of arr1[5] calling syscall to print an integer
# This will print @ in Hexadecimal values
addi a7, zero, 1
addi a0, t2, 0
 ecall


# ___________________ Address of arr[17] _____________________ #
la t4, y

# &arr[i]= base address + i* elment_size
# In this case i=17
# &arr[5]= base address + 17* 4 (17*4 = 68)
addi t1, t1, 68


# Printing @ of arr1[17] which is in s0
addi a7, zero, 4
la a0, msg2
 ecall 
# Printing @ of arr1[17] calling syscall to print an integer
# This will print @ in Hexadecimal values
addi a7, zero, 1
addi a0, t1, 0
 ecall

 

# CHECKED!
# ADRESSES ARE CORRECT!

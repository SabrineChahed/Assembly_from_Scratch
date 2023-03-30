#@author CHAHED Sabrine G1
#@version March 29, 2023 03:24 p.m ENSIA


.globl_start

.data
# Allocate & Initialize array3
arr3: .space 100 #20 by 5 bytes array

msg1: .asciz "@ of arr3[7][2]: "
msg2: .asciz "\n@ of arr3[11][4]: "
msg3: .asciz "\n@ of arr3[19][3]: "


.text
_start:

# ___________________ Address of arr3[7][2] _____________________ #

la t0, arr3 # t0 holds the base address
# &arr[i]= base address + i* elment_size
# &arr3[i][j]= base address + ( i* Cols + j)* elment_size
# In this case i=7 j=2 element_size=1
# &arr3[7][2]= base address + ( 7* 5 + 2)
# &arr3[7][2]= base address +  37
addi t1, t0, 37 



# Printing @ of arr3[7][2] which is in t1
addi a7, zero, 4
la a0, msg1
 ecall 
# Printing @ of arr3[7][2] calling syscall to print an integer
# This will print @ in Hexadecimal values
addi a7, zero, 1
addi a0, t1, 0
 ecall


# ___________________ Address of arr3[11][4] _____________________ #


# In this case i=11 j=4 element_size=1
# &arr3[7][2]= base address + ( 11* 5 + 4)
# &arr3[7][2]= base address +  59
addi t2, t0, 59 # t2 holds @ of arr3[11][4]



# Printing @ of arr3[11][4] which is in t2
addi a7, zero, 4
la a0, msg2
 ecall 
# Printing @ of arr3[11][4] calling syscall to print an integer
# This will print @ in Hexadecimal values
addi a7, zero, 1
addi a0, t2, 0
 ecall
 
 
 
 # ___________________ Address of arr3[19][3] _____________________ #


# In this case i=19 j=3 element_size=1
# &arr3[19][3]= base address + ( 19* 5 + 3)
# &arr3[19][3]= base address +   98
addi t3, t0, 98 # t2 holds @ of arr3[19][3]



# Printing @ of arr3[7][2] which is in t3
addi a7, zero, 4
la a0, msg3
 ecall 
# Printing @ of arr3[7][2] calling syscall to print an integer
# This will print @ in Hexadecimal values
addi a7, zero, 1
addi a0, t3, 0
 ecall
 
 
# CHECKED!

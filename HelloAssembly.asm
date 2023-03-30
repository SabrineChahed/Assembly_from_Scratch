# @author CHAHED Sabrine
#These Assembly codes Written in Rars simulator
# Let's get Started with Assembly RISC_V Architecture

#Starting with Assembler Directives 
#Directives are used to DEFINE SEGMENTS
# and Allocate Space for Variables in Memory
# a directive starts with a dot 
# we have:
# .data data Segment of the program declaration of variables
# .text Code Segment of the program Instructions

#Now let's output Hello Assembly!
# To achieve so we need to do a SYSTEM CALL
# Rars provide a set of services we can use them through ecall
# Register Contents are not affected by ecall 
# except for result regidters in some instructions

# To Do an ecall:
# 1- Load the Service number into a7
# 2- Load arg values if any in a0,... as specified
# 3- Issue ecall Instruction
# 4- Retrieve return values if any, from result registers as specified

.globl_start 
.data
# To store a String you can use .string or .ascii or .asciz
msg: .asciz "Hello " 
name: .asciz ""
.text
_start:
# Read string from the user

addi a7, zero, 8
li a1, 20
la a0, name
ecall
# Apply steps to acheive a system call (mentionned above)
# 1- Load the Service number into a7
addi a7, zero, 4
# 2- Load arg values if any in a0,... as specified
# Load address of the string to print
la a0, msg
 ecall 
 
addi a7, zero, 4
# 2- Load arg values if any in a0,... as specified
# Load address of the string to print
la a0, name
 ecall 

   


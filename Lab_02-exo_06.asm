#@author CHAHED Sabrine G1
#@version March 30, 2023 01:00 p.m ENSIA


.globl_start

.data
get_input_file_name: .asciz "Enter input_file_name: "
get_output_file_name: .asciz "\nEnter output_file_name: "
error_msg: .asciz"\n Sorry couldn't open the input file\n"
input_file_name: .asciz""
output_file_name: .asciz""
.text
_start:

la t0, input_file_name
la t1, output_file_name
la t2, error_msg

addi a7, zero, 4
la a0, get_input_file_name
 ecall 
 
addi a7, zero, 8
li a1, 20
la a0, input_file_name
ecall
 
addi a7, zero, 4
la a0, get_output_file_name
 ecall 
 


addi a7, zero, 8
li a1, 20
la a0, output_file_name
ecall

# Open the Output file
addi a7, zero, 1024
la a0, output_file_name
addi a1, zero, 1
ecall 
addi s0, a0, 0 # save file descriptor

# Open the Input file
addi a7, zero, 1024
la a0, input_file_name
addi a1, zero, 0
ecall 
addi s1, a0, 0 # save file descriptor

# if an error in openning Input file (a0=-1) display error message
addi t3, zero, -1
bne s1, t3, Copy 
#display error messgae
addi a7, zero, 4
la a0, error_msg
 ecall
Copy:
	# Read from input file 
	addi a7, zero, 63
	addi a0, s1, 0 
	la a1, input_file_name
	li a2, 20
	#& write into output file
	addi a7, zero, 64
	addi a0, s0, 0
	la a1, output_file_name
	li a2, 20
	ecall
	# Close file
	addi a7, zero, 57
	addi a0, s0, 0
	ecall
	
		 	 



 
 
 

 

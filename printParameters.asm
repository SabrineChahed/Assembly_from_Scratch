
# This code aims to print parameters
.globl_start:
.data
prompt: .asciz "Value of t0= %ld and Value of t1= %ld\n"

.text
_start:
function:
	addi sp, sp, -8
	#store return @ onto the stack before calling a routine
	# so that when subroutine compleltes it needs to return control back to the caller
	sw ra, 0(sp)
	la a0, prompt 
	addi a1, t0, 0
	addi a2, t1, 0
	addi a7, zero, 4
	la a0, prompt
        ecall 

	lw ra, 0(sp)
	addi sp, sp, 8
	ret
	




	.data
	new_buff: .space 24 
	.globl validate_checksum
	.text

# -- validate_checksum --
# Arguments:
# a0 : Address of a string containing a german IBAN (22 characters)
# Return:
# v0 : the checksum of the IBAN
validate_checksum:
        li $t9 10
	lb $t0 ($a0)
	subiu $t0 $t0 55
	div $t0 $t9 
	mfhi $t7
	mflo $t0 
	addiu $t0 $t0 48
	addiu $t7 $t7 48
	addiu $a0 $a0 1
	lb $t1 ($a0)
	subiu $t1 $t1 55
	div $t1 $t9 
	mfhi $t8
	mflo $t1 
	addiu $t1 $t1 48
	addiu $t8 $t8 48
	addiu $a0 $a0 1
	lb $t2 ($a0)
	addiu $a0 $a0 1
	lb $t3 ($a0)
	addiu $a0 $a0 1
	
	la $t4 new_buff 
	li $t5 18
	
	loop:
	lb $t6 ($a0)
	sb $t6 ($t4)
	subiu $t5 $t5 1
	addiu $t4 $t4 1
	addiu $a0 $a0 1
	bgtz $t5 loop
	
	add:
	sb $t0 ($t4)
	addiu $t4 $t4 1
	sb $t7 ($t4)
	addiu $t4 $t4 1
	sb $t1 ($t4)
	addiu $t4 $t4 1
	sb $t8 ($t4)
	addiu $t4 $t4 1
	sb $t2 ($t4)
	addiu $t4 $t4 1
	sb $t3 ($t4)
	addiu $t4 $t4 1
	
	la $a0 new_buff
	
	li $t1 0
	li $a2 97
	li $a1 24
loop2:
	lb $t0 ($a0)        #loading the ascii code of a character in t0
	subiu $t0 $t0 48    # char code c - char code 0 from prog 1
	mulu $t2 $t1 10     # mul 10 to the remainder of previous number 
	add $t2 $t0 $t2     # add the current number to the previous step
	divu $t2 $a2        #divide the previous step with the divisor 
	mfhi $t1            #load the remainder in $t1
	subiu $a1 $a1 1     #reduce the number of terms required by 1
	addiu $a0 $a0 1     #move ahead tge adress to access the next digit
	bgtz $a1 loop2       #repeat the loop till the complete range of $a0 to $a1 -1 is covered 
	move $v0 $t1        #load the final remainder in $v0
	jr $ra 
        li $v0 10           #end programm
  
	
	
	
	

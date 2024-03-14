	.data
	.globl validate_checksum
	.text


# -- validate_checksum --
# Arguments:
# a0 : Address of a string containing a german IBAN (22 characters)
# Return:
# v0 : the checksum of the IBAN
validate_checksum:
	  li $t9 10
	lb $s0 ($a0)
	subiu $s0 $s0 55
	div $s0 $t9 
	mfhi $s7
	mflo $s0 
	addiu $s0 $s0 48
	addiu $s7 $s7 48
	addiu $a0 $a0 1
	lb $s1 ($a0)
	subiu $s1 $s1 55
	div $s1 $t9 
	mfhi $s6
	mflo $s1 
	addiu $s1 $s1 48
	addiu $s6 $s6 48
	addiu $a0 $a0 1
	lb $s2 ($a0)
	addiu $a0 $a0 1
	lb $s3 ($a0)
	addiu $a0 $a0 1
	
	li $t1 0
	li $a2 97
	li $a1 18
loop:
	lb $t0 ($a0)        #loading the ascii code of a character in t0
	subiu $t0 $t0 48    # char code c - char code 0 from prog 1
	mulu $t2 $t1 10     # mul 10 to the remainder of previous number 
	add $t2 $t0 $t2     # add the current number to the previous step
	divu $t2 $a2        #divide the previous step with the divisor 
	mfhi $t1            #load the remainder in $t1
	subiu $a1 $a1 1     #reduce the number of terms required by 1
	addiu $a0 $a0 1     #move ahead tge adress to access the next digit
	bgtz $a1 loop       #repeat the loop till the complete range of $a0 to $a1 -1 is covered 
	
	subiu $s0 $s0 48    # char code c - char code 0 from prog 1
	mulu $t2 $t1 10     # mul 10 to the remainder of previous number 
	add $t2 $s0 $t2     # add the current number to the previous step
	divu $t2 $a2        #divide the previous step with the divisor 
	mfhi $t1         
	
	subiu $s7 $s7 48    # char code c - char code 0 from prog 1
	mulu $t2 $t1 10     # mul 10 to the remainder of previous number 
	add $t2 $s7 $t2     # add the current number to the previous step
	divu $t2 $a2        #divide the previous step with the divisor 
	mfhi $t1       
	
	subiu $s1 $s1 48    # char code c - char code 0 from prog 1
	mulu $t2 $t1 10     # mul 10 to the remainder of previous number 
	add $t2 $s1 $t2     # add the current number to the previous step
	divu $t2 $a2        #divide the previous step with the divisor 
	mfhi $t1
	
        subiu $s6 $s6 48    # char code c - char code 0 from prog 1
	mulu $t2 $t1 10     # mul 10 to the remainder of previous number 
	add $t2 $s6 $t2     # add the current number to the previous step
	divu $t2 $a2        #divide the previous step with the divisor 
	mfhi $t1
	
	subiu $s2 $s2 48    # char code c - char code 0 from prog 1
	mulu $t2 $t1 10     # mul 10 to the remainder of previous number 
	add $t2 $s2 $t2     # add the current number to the previous step
	divu $t2 $a2        #divide the previous step with the divisor 
	mfhi $t1
	
	subiu $s3 $s3 48    # char code c - char code 0 from prog 1
	mulu $t2 $t1 10     # mul 10 to the remainder of previous number 
	add $t2 $s3 $t2     # add the current number to the previous step
	divu $t2 $a2        #divide the previous step with the divisor 
	mfhi $t1
	move $v0 $t1        #load the final remainder in $v0
	jr $ra 
        li $v0 10           #end programm

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	jr	$ra

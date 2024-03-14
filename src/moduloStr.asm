	.data
	.globl modulo_str
	.text

# --- modulo_str ---
# Arguments:
# a0: start address of the buffer
# a1: number of bytes in the buffer
# a2: divisor
# Return:
# v0: the decimal number (encoded using ASCII digits '0' to '9') in the buffer [$a0 to $a0 + $a1 - 1] modulo $a2 
modulo_str:
li $t1 0
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
	move $v0 $t1        #load the final remainder in $v0
	jr $ra 
        li $v0 10           #end programm
		.data
	.globl knr2iban
	.text
# -- knr2iban
# Arguments:
# a0: IBAN buffer (22 bytes)
# a1: BLZ buffer (8 bytes)
# a2: KNR buffer (10 bytes)
knr2iban:
move $s3 $a0 
li $s0 68
sb $s0 ($a0)
addiu $a0 $a0 1
li $s1 69
sb $s1 ($a0)
addiu $a0 $a0 1
li $s2 48
sb $s2 ($a0)
addiu $a0 $a0 1
sb $s2 ($a0)
addiu $a0 $a0 1

memcpy:
	move	$t0 $a0 # $t0 = current target address
	move	$t1 $a1 # $t1 = current source address
	addu	$t2 $a1 8 # $t2 = last source address

mc_loop:
	lbu	$t4 ($t1)
	sb	$t4 ($t0)
	addu	$t0 $t0 1
	addu	$t1 $t1 1
	bltu	$t1 $t2 mc_loop
addiu $a0 $a0 8
memcpy2:
	move	$t0 $a0 # $t0 = current target address
	move	$t1 $a2 # $t1 = current source address
	addu	$t2 $a2 10 # $t2 = last source address

mc_loop2:
	lbu	$t4 ($t1)
	sb	$t4 ($t0)
	addu	$t0 $t0 1
	addu	$t1 $t1 1
	bltu	$t1 $t2 mc_loop2
	subiu $a0 $a0 12 
	
move $s5 $ra
move $s6 $a0
	jal validate_checksum
	move $ra $s5
	move $a0 $s6
	move $t5 $v0 
	#addiu $a0 $a0 20
li  $t8 10
li  $t9 98 
sub $a3 $t9 $t5
#li $t7 9
slt $s1 $a3 $t8
beq $s1 $zero else
b then
else:
div $a3 $t8
mflo $a3
addiu $a3 $a3 48
mfhi $t3
addiu $t3 $t3 48
addiu $a0 $a0 2
sb $a3 ($a0)
addiu $a0 $a0 1
sb $t3 ($a0)
subiu $a0 $a0 4
b end
then:
move $t3 $a3
li $a3 0
addiu $a3 $a3 48
addiu $t3 $t3 48
addiu $a0 $a0 2
sb $a3 ($a0)
addiu $a0 $a0 1
sb $t3 ($a0)
subiu $a0 $a0 4

end:
jr $ra 
        li $v0 10  





























    

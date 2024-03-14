	.data
	.globl iban2knr
	.text
# -- iban2knr
# Arguments:
# a0: IBAN buffer (22 bytes)
# a1: BLZ buffer (8 bytes)
# a2: KNR buffer (10 bytes)
iban2knr:
	addiu $a0 $a0 4 # Skip the country code and the check digits

Blz:
	move	$t0 $a1 # $t0 = current target address
	move	$t1 $a0 # $t1 = current source address
	addu	$t2 $a0 8# $t2 = last source address

mc_loop:
	lbu	$t4 ($t1)
	sb	$t4 ($t0)
	addu	$t0 $t0 1
	addu	$t1 $t1 1
	bltu	$t1 $t2 mc_loop
	
	addiu $a0 $a0 8
	
	Knr:
	move	$t0 $a2 # $t0 = current target address
	move	$t1 $a0 # $t1 = current source address
	addu	$t2 $a0 10 # $t2 = last source address

mc_loop2:
	lbu	$t4 ($t1)
	sb	$t4 ($t0)
	addu	$t0 $t0 1
	addu	$t1 $t1 1
	bltu	$t1 $t2 mc_loop2
jr	$ra
	
	li $v0 10

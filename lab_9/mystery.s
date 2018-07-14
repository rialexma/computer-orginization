
	.text

main:
	li $a0, 0
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall
	
	li $a0, 1
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall
	
	li $a0, 196
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall
	
	li $a0, -1
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall
	
	li $a0, -452
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall
	
	li $a0, 2
	jal mystery
	move $a0, $v0
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall

	li $a0, 3
	jal mystery
	move $a0, $v0
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall
	
	li $a0, 7
	jal mystery
	move $a0, $v0
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall
	
	

	li 	$v0, 10		# terminate program
	syscall

putDec: 
	## FILL IN ##
	slt $t2, $zero, $a0
	bnez $t2, inside
	
minus:
	beqz $a0, inside
	move $t3, $a0
	li $a0, '-'
	li $v0, 11
	syscall
	sub $t3, $zero, $t3
	move $a0, $t3
	
inside:
	addi $t2, $zero, 0
	addi $t3, $zero, 10 

quotient:
	div $a0, $t3 		
	addi $t2, $t2, 1
	mfhi $t4		
	addiu $sp, $sp, -4	
	sw $t4, 0($sp)		
	mflo $a0		
	bnez $a0, quotient
	
output:
	lw $t6, 0($sp)		
	li $a0, '0'		
	add $a0, $a0, $t6	
	li $v0, 11
	syscall			
	addi $t2, $t2, -1	
	addi $sp, $sp, 4	
	bnez $t2, output	
	
	jr $ra 
	

mystery: bne $0, $a0, recur 	# 
 	li $v0, 0 		#
 	jr $ra 			#
 recur: sub $sp, $sp, 8 	#
 	sw $ra, 4($sp) 	#
 	sub $a0, $a0, 1 	#
 	jal mystery 		#
 	sw $v0, 0($sp) 	#
 	jal mystery 		#
 	lw $t0, 0($sp) 	#
 	addu $v0, $v0, $t0 	#
 	addu $v0, $v0, 1 	#
 	add $a0, $a0, 1 	#
 	lw $ra, 4($sp) 	#
 	add $sp, $sp, 8 	#
 	jr $ra 			#

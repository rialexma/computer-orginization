.text
main:
	la	$a0,n1
	la	$a1,n2
	jal	swap
	li	$v0,1	# print n1 and n2; should be 27 and 14
	lw	$a0,n1
	syscall
	li	$v0,11
	li	$a0,' '
	syscall
	li	$v0,1
	lw	$a0,n2
	syscall
	li	$v0,11
	li	$a0,'\n'
	syscall
	li	$v0,10	# exit
	syscall

swap:	# your code goes here
	addi $sp, $sp, -4
	la $t1, 0
	lw $t1, 0($a1)
	sw $t1, 0($sp)
	lw $t1, 0($a0)
	sw $t1, 0($a1)
	lw $t1, 0($sp)
	sw $t1, 0($a0)
	addi $sp, $sp, 4
	jr $ra	
	
	.data
n1:	.word	14
n2:	.word	27


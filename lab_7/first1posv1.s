main:
	lui	$a0,0x8000
	jal	first1pos
	jal	printv0
	lui	$a0,0x0001
	jal	first1pos
	jal	printv0
	li	$a0,1
	jal	first1pos
	jal	printv0
	add	$a0,$0,$0
	jal	first1pos
	jal	printv0
	li	$v0,10
	syscall

first1pos:	# your code goes here
	beqz 	$a0, minus
	addi 	$s1, $zero, 31 
	addi 	$sp, $sp, -4
	sw 	$ra, 0($sp)
	jal 	cycle
	lw 	$ra, 0($sp)
	addi 	$sp, $sp, 4
	jr 	$ra
	
cycle:
	slt	$t1, $a0, $zero
	bne	$t1, $zero, result
	addi	$s1, $s1, -1
	sll	$a0, $a0, 1
	j 	cycle

result:
	addi 	$v0, $s1, 0
	jr 	$ra

minus: 	
	addi 	$v0, $zero, -1
	jr 	$ra	


printv0:
	addi	$sp,$sp,-4
	sw	$ra,0($sp)
	add	$a0,$v0,$0
	li	$v0,1
	syscall
	li	$v0,11
	li	$a0,'\n'
	syscall
	lw	$ra,0($sp)
	addi	$sp,$sp,4
	jr	$ra

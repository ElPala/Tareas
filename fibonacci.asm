.data
n: .word 9

.text

main:
	lw $a0,n
	jal fibonacci
	j end
fibonacci:
	addi $sp,$sp,-12
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $a0,8($sp)
	beq $a0, 1, if
	beq $a0, 2, elseif
	j else
if:	
	add $v0,$zero,$zero
	j endFibonacci
elseif:	
	addi $v0,$zero,1
	j endFibonacci
else:	
	addi $a0,$a0,-1
	jal fibonacci
	add $t0,$v0,$zero
	add  $a0,$a0,-1
	jal fibonacci
	add $v0,$v0,$t0
endFibonacci:
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $a0,8($sp)
	addi $sp,$sp,12
	jr $ra
	
end:
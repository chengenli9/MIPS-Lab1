	.data
	#### define the array ####
abc: # label for beginning of array
	# elements in the array
	.word 30,-3,37,2876,28,7,-4,-73,-72,76
	.word 4,65,898,225,773,67437,5523,53,2256
	.word -44,2,77,2,774,2254,5287,222687,3235
abcEnd: # label for end of array
	
newline:
	.asciiz "\n"
	
	.text
main:		
	################################################################
	#  YOUR CODE SHOULD GO HERE
	################################################################

	la $t0, abc 	# pointer to start of array
	la $t3, abcEnd	# pointer to end of array
	
	lw $t1, 0($t0)	# load the first element into $t1
	move $t2, $t1	# move t1 into t2(current min value)

	addi $t0, $t0, 4 # move to next element

loop:
	beq $t0, $t3, done # exit if reached end
	lw $t1, 0($t0) # load the current element
	blt $t1, $t2, update # if current < min, update min

	j next # skip update

update:
	move $t2, $t1

next: 
	addi $t0, $t0, 4 
	j loop


done: 
	# print the sum
	move $a0, $t2
	li $v0, 1
	syscall

	# print newline
	la $a0, newline
	li $v0, 4
	syscall

	# exit program
	li $v0, 10
	syscall



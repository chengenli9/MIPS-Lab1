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
	li $t2, 0	# sum = 0

loop:
	# if starter pointer and END pointer are equal, then go to 'done'
	beq $t0, $t3, done 

	lw $t1, 0($t0)	# load current element
	add $t2, $t2, $t1	# sum += element
	addi $t0, $t0, 4	# move to next element
	j loop	# repeat

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



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

	# pointer at start of the array
	la $t0, abc
	la $t3, abcEnd
	# keep track of the sum 
	li $t2, 0
loop: 
	# we reach the end of the array when the pointer is null
	beq $t0, $t3, done

	lw $t1, 0($t0) # get the value from t0
	add $t2, $t1, $t2 # add value from t0 to sum
	addu $t0, 4 # increment pointer 

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



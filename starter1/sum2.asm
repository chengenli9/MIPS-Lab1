	.text
main:		
	# prompt user for first number
	li $v0,4 # print string
	la $a0,prompt1
	syscall

	# read first number, putting it into $t0
	li $v0, 5 # read integer
	syscall
	move $t0,$v0
	
	# prompt user for second number
	li $v0,4 # print string
	la $a0,prompt2
	syscall

	# read second number, putting it into $t1
	li $v0, 5 # read integer
	syscall
	move $t1,$v0
	
	################################################################
	# YOUR CODE SHOULD GO HERE
	################################################################
	
	add $t2, $t0, $t1 # add whats in t1 and t0 and store it in t2

	# print "The sum is:" followed by integer
	li $v0, 4
	la $a0, resultString
	syscall

	# print the integer 
	li $v0, 1
	move $a0, $t2
	syscall

	# print newline
	li $v0, 4
	la $a0, newline
	syscall


	# exit the program
	li $v0,10 # exit
	syscall

	.data
	.align 2
prompt1:
	.asciiz "Please type an integer: "
prompt2:
	.asciiz "Please type another integer: "
resultString:
	.asciiz "The sum is "
newline:
	.asciiz "\n"

	

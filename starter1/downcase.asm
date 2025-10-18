	.text
main:		
	# prompt the user
	li $v0,4 # print string
	la $a0,prompt
	syscall

	# read the string into the 'myString' buffer
	li $v0,8 # read string
	la $a0,myString
	la $a1,9999
	syscall

	################################################################
	# YOUR CODE GOES HERE
	################################################################
	la $t0, myString # address of current character

loop:
	lb $t1, 0($t0) # load one byte/character
	beqz $t1, done # if it's 0 we're done

	# check if character is between 'A' (65) and 'Z' (90)
	li $t2, 65 # 'A'
	li $t3, 90 # 'Z'
	blt $t1, $t2, skip # if less than 'A', skip
	bgt $t1, $t3, skip # if greater than 'Z', skip

	# if uppercase, convert to lowercase by adding 32
	addi $t1, $t1, 32
	sb $t1, 0($t0) # store back to memory

skip: 
	addi $t0, $t0, 1
	j loop

done:
    # print newline
    la $a0, newline
    li $v0, 4
    syscall

    # print the modified string
    la $a0, myString
    li $v0, 4
    syscall

    # exit the program
    li $v0, 10
    syscall

	.data
	# space for the string that we're downcasing
myString:
	.space 10000
prompt:
	.asciiz "Please type some text: "
newline:
	.asciiz "\n"


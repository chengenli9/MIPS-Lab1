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
	la $t0, myString # pointer to first char in string
	# ascii values start at 'A' 65 --> 'a' 97  (plus 32)
loop:

	lb $t1, 0($t0)
	# stop at end of string
	beqz $t1, done	
	# check if value is >= 65 and 90
	li $s1, 65
	li $s2, 90
	blt $t1, $s1, continue
	bgt $t1, $s2, continue

	add $t1, $t1, 32

	sb $t1, 0($t0)



continue:
	# increment pointer by one byte
	addu $t0, $t0, 1 
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


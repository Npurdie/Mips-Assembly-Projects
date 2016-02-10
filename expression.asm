.data
msg1: .asciiz "Enter integer A :"
msg2: .asciiz "Enter integer B :"
msg3: .asciiz "Enter integer C :"
msg4: .asciiz "Enter integer D :"
result: .asciiz "The expression evaluates to :"
A:  .word  100
B:  .word  200
C:  .word  300
D:  .word  400
theArray: .space 160

.text

main:

# First number
	li $v0, 4		#syscall to print string
	la $a0, msg1	#address of string to print
	syscall

	li $v0, 5	#syscall to read an integer
	syscall
	move $t0, $v0  #move the number to read into $t0	
# Second number
	li $v0, 4		#syscall to print string
	la $a0, msg2	#address of string to print
	syscall

	li $v0, 5	#syscall to read an integer
	syscall
	move $t1, $v0  #move the number to read into $t0
# Third number
	li $v0, 4		#syscall to print string
	la $a0, msg3	#address of string to print
	syscall

	li $v0, 5	#syscall to read an integer
	syscall
	move $t2, $v0  #move the number to read into $t0
# Fourth number
	li $v0, 4		#syscall to print string
	la $a0, msg4	#address of string to print
	syscall

	li $v0, 5	#syscall to read an integer
	syscall
	move $t3, $v0  #move the number to read into $t0

# Print result
    li $v0, 4
    la $a0, result
    syscall

lw    A,$t0		#Stores all the values inputed into the memory allocated
lw    B,$t1		#	
lw    C,$t2		#
lw    D,$t3		#

mult $t0, $t1	#multiply signed 32 bit integers A and B
mfhi $t4		#32 most significant bits of the multiplication save in $t4

mult $t2, $t3	#multiply signed 32 bit integers C and D
mfhi $t5		#32 most significant bits of the multiplication save in $t0

add $a0 $t4 $t5	#computes the sum
li $v0, 1
syscall

li $v0 10	#EXIT
syscall
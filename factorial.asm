.data
msg1:  .asciiz "n = "
msg2:  .asciiz "\n"
.text


main: 
  la  $4, msg1 # prompts user for an integer n
  li  $2, 4  #loads value 4 into register $2
  syscall
  li $2, 5   # read integer
  syscall
  move $4, $2   # $4 = $2
  jal factorial   # $2 = fib(n)
  move $4, $2   # $4 = fib(n)
  li $2, 1   # print int
  syscall
  la $4, msg2   # prints a newline to make anwser more clear
  li $2, 4   #
  syscall
  li $v0 10 #EXIT
  syscall

factorial: 
  bne   $4, $0, rec # if $4 != 0 jump to recursive case
  ori   $2, $0, 1   # base case set equal to 1
  jr  $31     # return to caller
rec:
  addiu   $29, $29, -8  # allocates memory for 2 registers on stack
  sw  $31, 4($29)   # stores $31 return address
  sw  $4, 0($29)   # stores $4 =n argument register
  
  addiu   $4, $4, -1  # decrements input
  jal factorial     # calls factorial with n-1
    
  lw  $4, 0($29)   # restore $4 to input value
  lw  $31, 4($29)   # restore $31
  addiu   $29, $29, 8   # pop stack X 2
    
  mul   $2, $2, $4   # computes factorial $2 = fac(n-1)(n)
  jr  $31     # return to caller
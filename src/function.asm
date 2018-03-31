.data
x: .word 3				# input a 
y: .word 5				# input b
.text

main:
lw $a0, x				# a0 = x I put it a0 beacuse i will use them for function arguments
lw $a1, y				# a1 = y
addi $s2, $s2, 0		# result = 0 I will show the result in register s2
beq $a0, $a1, IF		# If x = y then jump "IF"
j else					# Otherwise jump "else"

IF:
add $v0, $a0, $a1		# v0 = x + y
sll $v0, $v0, 3			# v0 = 8 * (x + y)
add $s2, $0, $v0		# s2 = 8 * (x + y) assign result in s2
li $v0, 10				# end of code 
syscall	
.end

else:					
jal compare				# call compare function
add $s2, $0, $v0		# assign result in s2
li $v0, 10				# end of code
syscall	
.end

compare:
slt $s0, $a0, $a1		
beq $s0, 1, punish		# If a1(y) greater than a0(x) jump punish
add $v0, $a0, $a1		# v0 = x + y
sll $v0, $v0, 2			# v0 = 4 * (x + y)
jr $ra					# return result in v0 	

punish:					
sub $v0, $a0, $a1		# v0 = x - y
sll $v0, $v0, 1			# v0 = 2 * (x -y)
jr $ra					# return result in v0 	




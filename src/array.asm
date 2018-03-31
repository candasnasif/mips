.data
A: .word 2, 2, 6, 4    # definition of array
.text
	main:
	la $t1, A 		   #load the array in $t1
	addi $s0, $s0, 0   # s0 = 0 (i = 0)
	addi $s1, $s1, 3   # s1 = 3 length of array
	for:
		beq $s0, $s1, done  # loop will continue if s0 != s1 if they are equal jump "done"
		lw	 $t2, 0($t1)	# load the element of array in t2 (tw = a[i])
		lw $t3, 4($t1)		# load the element of array in t3 (tw = a[i+1])
		sub $s3, $t3, $t2	# s3 will keep the difference of elements (diff = a[i+1] - a[i])
		slt $s4, $0, $s3 	
		beq $s4, 1, multiplication  # If difference greater than zero then jump "multiplication"
		sll $s5, $t2, 2				# If difference greater than zero then s5= 4 * t2 
		add $t3, $t2, $s5			# t3 = t2 + s5 so t3 = 5 * t2
		sub  $t3, $0, $t3			# take negative of t3 
		sw $t3, 4($t1)				# assign in array a[i+1] = -5*a[i]
		addi $s0, $s0, 1			# i = i + 1
		addi $t1, $t1, 4			# t1 = t1 + 4 for next element of array.We increase the address
		j for						# jump the for loop

	multiplication: 
   	sll $s5, $t2, 2					# s5 = 4 * t2
   	add $s5, $t2, $s5				# s5 = s5 + t2 so s5 = 5 * t2
   	sw $s5, 0($t1)					# assign in array a[i] = 5 * a[i]
   	addi $s0, $s0, 1 				# i = i + 1
   	addi $t1, $t1, 4				# t1 = t1 + 4 for next element of array.We increase the address
   	j for							# jump the for loop
	
	done :	
	lw $t4, -12($t1)				#If you want to see elements of array I put them in registers (t4 - t7)
	lw $t5, -8($t1)
	lw $t6, -4($t1)
	lw $t7, 0($t1)
	li $v0, 10 	# end of the code
syscall
.end

.global to_upper_s

to_upper_s:
	li t1, 'a'		#load the chars (cant compare constant chars)
	li t2, 'z'
loop:
	
	lb t0, 0(a0)		# load current byte into t0
	beq t0, zero, done		# If the byte is 0 then you ret
	
	blt t0, t1, notchar		# If less then a not in range
	bgt t0, t2, notchar		# If greater the z not in range
	
	addi t0, t0, -32		# Convert to uppercase -32
	sb t0, 0(a0)		#store this new char back in a0 0() is the offset
	

notchar:
	addi a0, a0, 1		# Move and index in the string
	j loop		
	
done:
	ret
	

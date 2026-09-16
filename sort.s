.global sort_s

sort_s:

	addi sp, sp, -32		#stack pointer for 32  bytes (4 each, 8 bytes)
	sd ra, 0(sp)		#special reg return adress (find_max func overrides)
	sd s0, 8(sp)		#saved regs for the 3 
	sd s1, 16(sp)
	sd s2, 24(sp)

	mv s0, a0		#save array adress
	mv s1, a1		#save length
	li s2, 0		#save s2 to the loop counter

loop:

	bge s2, s1, done		#if i >= len ret

	#setup to call fin_max...(&arr[i], len -1)
	slli t0, s2, 2		# t0 = i * 4
	add a0, s0, t0		#a0 = &arr[i]
	sub a1, s1, s2		#a1 = len - i
	call find_max_index_s 		# returns the index in a0
	add t1, a0, s2		# t1 = idx = returned index + i

	slli t2, s2, 2 		#adress of arr[i]
	add t2, s0, t2
	lw t3, 0(t2)		#now t3 equals arr[i]

	slli t4, t1, 2 		#adress of the arr[idx]
	add t4, s0, t4
	lw t5, 0(t4)		#now t5 equals arr[idx]

	ble t5, t3, skip	#if arr[idx] <= arr[i], you dont swap
	sw t5, 0(t2)		#arr[i] = the old arr[idx]
	sw t3, 0(t4)		#arr[idx] = the old arr[i]

skip:
	addi s2, s2, 1 		#incriment i )i++)
	j loop
	
	

done:

	ld ra, 0(sp)		#restore the return adress
	ld s0, 8(sp)		#restore the 3 s regs
	ld s1, 16(sp)
	ld s2, 24(sp)
	addi sp, sp, 32		#free the stack
	ret

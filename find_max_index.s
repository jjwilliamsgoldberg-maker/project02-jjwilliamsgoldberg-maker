.global find_max_index_s

find_max_index_s:
	li t0, 0		# i = 0 part of loop
	li t1, 0		# idx = 0, the best index 

loop:
	bge t0, a1, done		# if i is greater or equal to len ret

	#take the address of arr[i] and load into t2
	slli t2, t0, 2		# t2 = i * 4
	add t2, a0, t2		#t2 = adress of arr[i]
	lw t2, 0(t2)		#t2 = arr[i]

	# get adress of arr[idx] and load into t3
	slli t3, t1, 2		# idx * 4
	add t3, a0, t3		# its adress
	lw t3, 0(t3)		# array at index idx

	#if arr[i] > arr[idx] make idx = i
	ble t2, t3, skip		# if i <= idx dont update it
	mv t1, t0		#set idx = i (new max)

skip:
	addi t0, t0, 1		#i++
	j loop
	
done:
	mv a0, t1		#return the value is idx
	ret

all: to_upper swap find_max_index sort

to_upper: to_upper.c to_upper_c.c to_upper.s
	gcc -g -o to_upper to_upper.c to_upper_c.c to_upper.s

swap: swap.c swap_c.c swap.s
	gcc -g -o swap swap.c swap_c.c swap.s

find_max_index: find_max_index.c find_max_index_c.c find_max_index.s
	gcc -g -o find_max_index find_max_index.c find_max_index_c.c find_max_index.s

sort: sort.c sort_c.c sort.s find_max_index.s find_max_index_c.c
	gcc -g -o sort sort.c sort_c.c sort.s find_max_index.s find_max_index_c.c

clean: 
	rm -rf to_upper swap find_max_index sort

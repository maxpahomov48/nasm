#makefile for cpu.
cpu: cpu.o 
	gcc -g -o cpu cpu.o -no-pie
cpu.o: cpu.asm
	nasm -f elf64 -g -F dwarf cpu.asm -l cpu.lst
clean:	
	rm -rf *.o *.lst cpu

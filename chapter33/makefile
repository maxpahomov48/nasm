#makefile for shuffle.asm.asm, sse_string3_exp.asm.
shuffle: shuffle.o 
	gcc -o shuffle shuffle.o -no-pie
shuffle.o: shuffle.asm
	nasm -f elf64 -g -F dwarf shuffle.asm -l shuffle.lst
sse_string3_exp: sse_string3_exp.o 
	gcc -o sse_string3_exp sse_string3_exp.o -no-pie
sse_string3_exp.o: sse_string3_exp.asm
	nasm -f elf64 -g -F dwarf sse_string3_exp.asm -l sse_string3_exp.lst
clean:	
	rm -rf *.o *.lst shuffle.asm sse_string3_exp

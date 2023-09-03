#makefile for function, circle and rect.
file: file.o 
	gcc -g -o file file.o -no-pie
file.o: file.asm
	nasm -f elf64 -g -F dwarf file.asm -l file.lst
console2: console2.o 
	gcc -g -o console2 console2.o -no-pie
console2.o: console2.asm
	nasm -f elf64 -g -F dwarf console2.asm -l console2.lst
clean:	
	rm -rf *.o *.lst

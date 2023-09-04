#makefile for function, circle and rect.
file: file.o 
	gcc -g -o file file.o -no-pie
file.o: file.asm
	nasm -f elf64 -g -F dwarf file.asm -l file.lst
clean:	
	rm -rf *.o *.lst

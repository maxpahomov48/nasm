#makefile for bits1, bits2 and printb.
bits1: bits1.o printb.o
	gcc -g -o bits1 bits1.o printb.o -no-pie
bits1.o: bits1.asm
	nasm -f elf64 -g -F dwarf bits1.asm -l bits1.lst
printb: printb.c
	gcc -c printb.c
bits2: bits2.o 
	gcc -o bits2 bits2.o -no-pie
bits2.o: bits2.asm
	nasm -f elf64 -g -F dwarf bits2.asm -l bits2.lst
clean:	
	rm -rf *.o *.lst

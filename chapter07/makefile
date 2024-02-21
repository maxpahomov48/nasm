#makefile for jump, jumploop and batterloop.
jump:	jump.o
	gcc -o jump jump.o -no-pie
jump.o: jump.asm
	nasm -f elf64 -g -F dwarf jump.asm -l jump.lst
jumploop: jumploop.o
	gcc -o jumploop jumploop.o -no-pie
jumploop.o: jumploop.asm
	nasm -f elf64 -g -F dwarf jumploop.asm -l jumploop.lst
batterloop: batterloop.o
	gcc -o batterloop batterloop.o -no-pie
batterloop.o: batterloop.asm
	nasm -f elf64 -g -F dwarf batterloop.asm -l batterloop.lst
clean:
	rm -r *.o *.lst batterloop jump jumploop

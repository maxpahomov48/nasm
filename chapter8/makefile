#makefile for jump.asm, hello4.asm
memory:	memory.o
	gcc -o memory memory.o -no-pie
memory.o: memory.asm
	nasm -f elf64 -g -F dwarf memory.asm -l memory.lst
jumploop: jumploop.o
	gcc -o jumploop jumploop.o -no-pie
jumploop.o: jumploop.asm
	nasm -f elf64 -g -F dwarf jumploop.asm -l jumploop.lst
batterloop: batterloop.o
	gcc -o batterloop batterloop.o -no-pie
batterloop.o: batterloop.asm
	nasm -f elf64 -g -F dwarf batterloop.asm -l batterloop.lst

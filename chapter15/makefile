#makefile for function5, function6.
function5: function5.o 
	gcc -o function5 function5.o -no-pie
function5.o: function5.asm
	nasm -f elf64 -g -F dwarf function5.asm -l function5.lst
function6: function6.o 
	gcc -o function6 function6.o -no-pie
function6.o: function6.asm
	nasm -f elf64 -g -F dwarf function6.asm -l function6.lst
clean:	
	rm -rf *.o *.lst

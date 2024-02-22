sse_string4: sse_string4.o print16b.o
	gcc -o sse_string4 sse_string4.o print16b.o -no-pie
sse_string4.o: sse_string4.asm
	nasm -f elf64 -g -F dwarf sse_string4.asm -l sse_string4.lst
sse_string5: sse_string5.o print16b.o
	gcc -o sse_string5 sse_string5.o print16b.o -no-pie
sse_string5.o: sse_string5.asm
	nasm -f elf64 -g -F dwarf sse_string5.asm -l sse_string5.lst
sse_string6: sse_string6.o print16b.o
	gcc -o sse_string6 sse_string6.o print16b.o -no-pie
sse_string6.o: sse_string6.asm
	nasm -f elf64 -g -F dwarf sse_string6.asm -l sse_string6.lst
printb: print16b.c
	gcc -c print16b.c
clean:	
	rm -rf *.o *.lst sse_string4 sse_string5 sse_string6

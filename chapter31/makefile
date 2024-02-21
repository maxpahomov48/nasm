#makefile for sse_string_length.
sse_string_length: sse_string_length.o 
	gcc -o sse_string_length sse_string_length.o -no-pie
sse_string_length.o: sse_string_length.asm
	nasm -f elf64 -g -F dwarf sse_string_length.asm -l sse_string_length.lst
sse_string_search: sse_string_search.o 
	gcc -o sse_string_search sse_string_search.o -no-pie
sse_string_search.o: sse_string_search.asm
	nasm -f elf64 -g -F dwarf sse_string_search.asm -l sse_string_search.lst
clean:	
	rm -rf *.o *.lst sse_string_length sse_string_search

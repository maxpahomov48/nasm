#makefile for sse_string2_imp.asm, sse_string3_exp.asm.
sse_string2_imp: sse_string2_imp.o 
	gcc -o sse_string2_imp sse_string2_imp.o -no-pie
sse_string2_imp.o: sse_string2_imp.asm
	nasm -f elf64 -g -F dwarf sse_string2_imp.asm -l sse_string2_imp.lst
sse_string3_exp: sse_string3_exp.o 
	gcc -o sse_string3_exp sse_string3_exp.o -no-pie
sse_string3_exp.o: sse_string3_exp.asm
	nasm -f elf64 -g -F dwarf sse_string3_exp.asm -l sse_string3_exp.lst
clean:	
	rm -rf *.o *.lst sse_string2_imp sse_string3_exp

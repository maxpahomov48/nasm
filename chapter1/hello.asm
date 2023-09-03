;hello.asm
section .data
    msg	   db	"Hello, World!", 0
section .bss
section .text
	global main 
main:
	mov	rax, 1		; 1 = wrtie
	mov	rdi, 1		; 1 = in stdout
	mov	rsi, msg	; Output string in register rsi.
	mov	rdx, 13		; Lenght of msg without 0.
	syscall			; Syscall to line out to terminal.
	mov	rax, 60		; 60 = exit code to OS.
	mov	rdi, 0		; 0 = success finish code.
	syscall			; Exit.



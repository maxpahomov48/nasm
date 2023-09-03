;hello2.asm
section .data
	msg	db "Hello, World!", 0
	NL	db 0xa			; ascii code for new line.
section .bss
section .text
	global main
main:
	mov 	rax, 1		; Syscall write message
	mov	rdi, 1		; to terminal 
	mov	rsi, msg	; msg "Hello, World!".
	mov	rdx, 13		; 
	syscall 

	mov	rax, 1		; Syscall write	to terminal
	mov	rdi, 1		; code 0xA - is new line ascii code.
	mov	rsi, NL		;
	mov	rdx, 1		;
	syscall		
	
	mov	rax, 60		; 60 - exit
	mov	rdi, 0		; 0 - error code returned without error.
	syscall

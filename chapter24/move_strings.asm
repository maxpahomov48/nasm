; move_strings.asm
%macro prnt 2
	mov	rax, 1		; 1 = write.
	mov	rdi, 1		; 1 = stdout.
	mov	rsi, %1
	mov	rdx, %2
	syscall
	
	mov	rax, 1
	mov	rdi, 1
	mov	rsi, NL
	mov	rdx, 1
	syscall
%endmacro

section	.data
	length		equ	95
	NL		db	0xa
	string1		db	"my string of ASCII:"
	string2		db	10,"my_string of zeros:"
	string3		db	10,"my_string of ones:"
	string4		db	10,"again my_string of ASCII:"
	string5		db	10,"copy my_string to other_string:"
	string6		db	10,"reverse copy my_string to other_string:"
section	.bss
	my_string	resb	length
	other_string	resb	length
section	.text
	global main
main:
	push	rbp,
	mov	rbp, rsp
;------------------------------------------------
; Fill a string by ascii symbols.
	prnt	string1, 19
	mov	rax, 32
	mov	rdi, my_string
	mov	rcx, length
str_loop1:
	mov	byte[rdi], al		; Simply method.
	inc	rdi
	inc	al
	loop	str_loop1
	prnt	my_string, length
;------------------------------------------------
; Fill a string by ascii symbols 0.
	prnt	string2, 20
	mov	rax, 48
	mov	rdi, my_string
	mov	rcx, length
str_loop2:
	stosb
	loop	str_loop2
	prnt	my_string, length
;------------------------------------------------
; Fill a string by ascii symbols 1.
	prnt	string3, 19
	mov	rax, 49
	mov	rdi, my_string
	mov	rcx, length
	rep	stosb			; inc rdi instruction don't need here.
	prnt	my_string, length
;------------------------------------------------
; String filling repeat by visible ascii symbols.
	prnt	string4, 26
	mov	rax, 32
	mov	rdi, my_string
	mov	rcx, length
str_loop3:
	mov	byte[rdi], al		; Simply method.
	inc	rdi
	inc	al
	loop	str_loop3
	prnt	my_string, length
;------------------------------------------------
; Copying my_string to other_string.
	prnt	string5, 32
	mov	rsi, my_string		; source in rsi.
	mov	rdi, other_string	; Destination in rdi.
	mov	rcx, length
	rep	movsb
	prnt	other_string, length
;------------------------------------------------
; Reverse-copying my_string to other_string.
	prnt	string6, 40
	mov	rax, 48			; Clean other_string.
	mov	rdi, other_string
	mov	rcx, length
	rep 	stosb
	lea	rsi, [my_string+length-4]
	lea	rdi, [other_string+length]
	mov	rcx, 27			; Only 27-1 symbols to copy.
	std				; std - setting DF flag, 
					; cld - reseting.
	rep	movsb
	prnt	other_string, length
leave
ret

;; move.asm
section .data
	bNum	db	123
	wNum	dw	12345
	dNum	dd	1234567890
	qNum1	dq	1234567890123456789
	qNum2	dq	123456
	qNum3	dq	3.14
section .bss
section .text
	global main
main:
	push	rbp			; Prologue
	mov	rbp, rsp		; Prologue

	mov	rax, -1			; fill rax with 1s
	mov	al, byte [bNum]		; does NOT clear upper bits of rax
	
	xor	rax, rax		; clear rax
	mov	al, byte [bNum]		; now rax contain the correct value

	mov	rax, -1			; fill rax with 1s
	mov	ax, word [wNum]		; does NOT clear upper bits of rax

	xor	rax, rax		; clear rax
	mov	ax, word [wNum]		; now rax contain the correct value

	mov	rax, -1			; fill rax with 1s
	mov	eax, dword [dNum]	; does clear upper bits of rax

	mov	rax, -1			; fill rax with 1s
	mov	rax, qword [qNum1]	; does clear upper bits of rax
	mov	qword [qNum2], rax	; copy rax-value to qNum2
	mov	rax, 123456		; operand-source - direct value
	movq	xmm0, [qNum3]		; instruction for float number

	mov	rsp, rbp
	pop	rbp
	ret

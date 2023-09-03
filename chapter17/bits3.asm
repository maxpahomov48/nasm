;; bits3.asm
extern	printb
extern	printf
section	.data
	msg1		db	"No bits are set:",10,0
	msg2		db	10,"Set bit #4, that is the 5th bit:",10,0
	msg3		db	10,"Set bit #7, that is the 8th bit:",10,0
	msg4		db	10,"Set bit #8, that is the 9th bit:",10,0
	msg5		db	10,"Set bit #61, that is the 62nd bit:",10,0
	msg6		db	10,"Clear bit #8, that is the 9th bit:",10,0
	msg7		db	10,"Test bit #61, and display rdi",10,0
	bitflags	dq	0
section	.bss
section	.text
	global main
main:
	push rbp
	mov	rbp, rsp
	; Print heading.
	mov	rdi, msg1
	xor	rax, rax
	call	printf
	; Print bitflags.
	mov	rdi, [bitflags]
	call	printb
	; Set 4th(5) bit to 1.
	; Print heading.
	mov	rdi, msg2
	xor	rax, rax
	call	printf
	; Setting...
	bts	qword [bitflags], 4	; Set 4th bit.
	; Printing bitflags.
	mov	rdi, [bitflags]
	call	printb
	; Set 7th(8) bit to 1.
	; Print heading
	mov	rdi, msg3
	xor	rax, rax
	call	printf
	; Setting...
	bts	qword [bitflags], 7	; Set 7th bit.
	; Print bitflags.
	mov	rdi, [bitflags]
	call	printb
	; Set 8th(9) bit to 1.
	; Print heading.
	mov	rdi, msg4
	xor	rax, rax
	call	printf
	; Setting...
	bts	qword [bitflags], 8
	; Print bitflags.
	mov	rdi, [bitflags]
	call	printb
	; Set 61st(62) bit to 1.
	; Print heading.
	mov	rdi, msg5
	xor	rax, rax
	call	printf
	; Setting...
	bts	qword [bitflags], 61
	; Print bitflags.
	mov	rdi, [bitflags]
	call	printb
	; Clear 8th(9) bit.
	; Print heading.
	mov	rdi, msg6
	xor	rax, rax
	call	printf
	; Clearing...
	btr	qword [bitflags], 8
	; Print bitflags.
	mov	rdi, [bitflags]
	call	printb
	; Test 61st(62) bit (CF will set to 1, if bit equal 1).
	; Print heading.
	mov	rdi, msg7
	xor	rax, rax
	call	printf
	mov	rax, 61			; Need to test 61th bit.
	xor	rdi, rdi		; Clear all bits.
	bt	[bitflags], rax		; Test the bit.
	setc	dil			; Set dil (=junior rdi) to 1, if CF is 1.
	call	printb
	
leave
ret

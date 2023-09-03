;; function5.asm
extern	printf
section	.data
	first	db	"A",0
	second	db	"B",0
	third	db	"C",0
	fourth	db	"D",0
	fifth	db	"E",0
	sixth	db	"F",0
	seventh	db	"G",0
	eighth	db	"H",0
	ninth	db	"I",0
	tenth	db	"J",0
	fmt1	db	"The string %s%s%s%s%s%s%s%s%s%s",10,0
	fmt2	db	"PI = %f",10,0
	pi	dq	3.1415926
section	.bss
section	.text	
	global main
main:
	push	rbp
	mov	rbp, rsp
	
	mov	rdi, fmt1			; Register use first.
	mov	rsi, first
	mov	rdx, second
	mov	rcx, third
	mov	r8, fourth
	mov	r9, fifth
	push	tenth
	push	ninth
	push	eighth
	push	seventh
	push	sixth
	mov	rax, 0
	call	printf
	and	rsp, 0xfffffffffffffff0		; 16 byte align the stack.
	movsd	xmm0, [pi]
	mov	rax, 1
	mov	rdi, fmt2
	call	printf

	leave
	ret 

;80X86 lab 6
;2020/5/9
;Manjaro
;hustccc
extern menu
global _start
global nasmprintf
global nasmscanf
[section	.text]
_start:
	call	menu
	;call	menu
	mov	ebx,	0
	mov	eax,	1
	int	0x80

nasmprintf:
	push	ebp
	mov	ebp,	esp
	push	ebx
	mov	ebx,	[ebp+8]		;fd
	mov	ecx,	[ebp+12]	;address of msg
	mov	edx,	[ebp+16]	;length
	mov	eax,	4		;index
	int	0x80
	pop	ebx
	mov	esp,	ebp
	pop	ebp
	ret

nasmscanf:
	push	ebp
	mov	ebp,	esp
	push	ebx
	mov	ebx,	[ebp+8]		;fd
	mov	ecx,	[ebp+12]	;address of msg
	mov	edx,	[ebp+16]	;length
	mov	eax,	3
	int	0x80
	pop	ebx
	mov	esp,	ebp
	pop	ebp
	ret

;test file for time call
;hustccc
;Archlinux
;2020/3/29
section	.data
notice1	db	"begin",0xA
len_notice1	equ	$-notice1
notice2	db	"end",0xA
len_notice2	equ	$-notice2

section	.stack
times	200	db	0

section	.text
global	_start
_start:
	;begin
	mov	edx,	len_notice1
	mov	ecx,	notice1
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;time
time:	mov	eax,	13
	mov	ebx,	0
	;syscall
	int	0x80
	;loop
	mov	si,	9999
loop:	mov	ebx,	0x9999
	mul	ebx
	div	ebx
	sub	si,	1
	cmp	si,	0
	jne	loop
	;loop end
	;end
	mov	edx,	len_notice2
	mov	ecx,	notice2
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;time
	mov	ebx,	0
	mov	eax,	13
	int	0x80
exit:	
	mov	ebx,	0
	mov	eax,	1
	int	0x80

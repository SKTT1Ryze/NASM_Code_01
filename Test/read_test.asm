;tst file for read function
;hustccc
;2020/3/26
section	.data
	readf	times	20	db	0
	msg1	db	"Read:"
	len_msg1	equ	$-msg1
	crtl	db	0xA
	len_crtl	equ	$-crtl
section	.text	
global	_start
_start:
;write
	mov	edx,	len_msg1
	mov	ecx,	msg1
	mov	ebx,	1
	mov	eax,	4
	int	0x80
;read
	mov	edx,	20
	mov	ecx,	readf
	mov	ebx,	0
	mov	eax,	3
	int	0x80
;write
	len_read	equ	20
	mov	edx,	len_read
	mov	ecx,	readf
	mov	ebx,	1
	mov	eax,	4
	int	0x80
;exit
	mov	ebx,	0
	mov	eax,	1
	int 	0x80	

;task 1,Experiment 3
;hustccc
;2020/4/6
;Manjaro
;==========================
%include "global.h"
extern  goodstatus
extern  f2to10
extern  ch_status
extern  f10t2

global  crlf
global  len_crlf
global  auth
;==========================
section	.data	
bname	db	"chechunchi",0	;boss name
bpass	db	"hustccc",0,0,0	;password
auth	db	0		;status
;default	db	"default",0xA	;default
;len_default	equ	$-default
N	equ	30		;total num of good
M	equ	1000		;num of loop in test moudel
sname	db	"SKT",0		;name of shop
ga1	db	"pen"		;about goods
	times	7 db	0	;fix
	db	10		;count
	dw	35,56,70,25,0
ga2	db	"book"
	times	6 db	0
	db	9
	dw	12,30,25,5,0
gan	times	N-2	db	"tempvaule",0,8,15,0,20,0,30,0,2,0,0,0
good	dw	0
opt	times	10	db	0
len_opt	equ	10
anykey	times	10	db	0
len_anykey	equ	10
in_name	times	20	db	0
len_in_name	equ	20
in_pwd	times	20	db	0
len_in_pwd	equ	20
in_good	times	20	db	0
len_in_good	equ	20
temp1	dw	0
temp2	dw	0
char	db	0
len_char	equ	1
boss	db	"chechunchi"
len_boss	equ	$-boss
customer	db	"customer"
len_customer	equ	$-customer
nlength	equ	20
plength	equ	20
glength	equ	10
notice1	db	"user:"
len_notice1	equ	$-notice1
notice2	db	"good:"
len_notice2	equ	$-notice2
notice3	db	"PLease input number between 1~9:"
len_notice3	equ	$-notice3
notice4	db	"Enter any key to continue...",0xA
len_notice4	equ	$-notice4
notice5	db	"Login:"
len_notice5	equ	$-notice5
notice6	db	"Passwd:"
len_notice6	equ	$-notice6
notice7	db	"Login error"
len_notice7	equ	$-notice7
notice8	db	"Login success"
len_notice8	equ	$-notice8
notice9	db	"Name of good:"
len_notice9	equ	$-notice9
notice10	db	"Found",0xA
len_notice10	equ	$-notice10
notice11	db	"Not Found"
len_notice11	equ	$-notice11
notice12	db	"Do not select good"
len_notice12	equ	$-notice12
notice13	db	"Good is empty"
len_notice13	equ	$-notice13
notice14	db	"Compute over"
len_notice14	equ	$-notice14
label1	db	"1=>Login",0xA
len_label1	equ	$-label1
label2	db	"2=>Find",0xA
len_label2	equ	$-label2
label3	db	"3=>Buy",0xA
len_label3	equ	$-label3
label4	db	"4=>Compute",0xA
len_label4	equ	$-label4
label5	db	"5=>Rank",0xA
len_label5	equ	$-label5
label6	db	"6=>Change",0xA
len_label6	equ	$-label6
label7	db	"7=>Move",0xA
len_label7	equ	$-label7
label8	db	"8=>Address",0xA
len_label8	equ	$-label8
label9	db	"9=>Quit",0xA
len_label9	equ	$-label9
label10	db	"A=>Test",0xA
len_label10	equ	$-label10
crlf	db	0xA
len_crlf	equ	$-crlf
blank	db	"	",0xA
len_blank	equ	$-blank
istest	db	0
;==============================================================================
section	.stack			;stack segment
stack	times	200	db	0
;==============================================================================
section	.text			;code segment
global	_start			;define start
_start:

menu:
	;write
	write  len_notice1,    notice1
	;end write
    
	cmp	BYTE [auth],	1
	je	printbname
	jne	printcustomer
point1:
	;write
	write  len_crlf,   crlf
	;end write
	;write
	write  len_notice2, notice2
	;end write
	
	cmp	BYTE [good],	0	
	je	point2
	
	;write
	;write  10, [ds:good]
    mov	dx,	10
	mov	cx,	[ds:good]
	mov	bx,	1
	mov	ax,	4
	int	0x80
	;end write
point2:	
	;write
	write  len_crlf,   crlf
	;end write
	;write
	write  len_label1, label1
	;end write
	;write
	write  len_label2, label2
	;end write
	;write
	write  len_label3, label3
	;end write
	;write
	write  len_label4, label4
	;end write
	;write
	write  len_label5, label5
	;end write
	;write
	write  len_label6, label6
	;end write
	;write
	write  len_label7, label7
	;end write
	;write
	write  len_label8, label8
	;end write
	;write
	write  len_label9, label9
	;end write

	;write
	write  len_notice3,    notice3
	;end write

	;read
	read   len_opt,    opt
	;end read
	cmp	BYTE [opt],	"1"
    jne t2
	call	task1
	jmp    menu
t2	cmp	BYTE [opt],	"2"
    jne t3
    call    task2
    jmp menu
t3	cmp	BYTE [opt],	"3"
    jne t4
	call	task3
	jmp    menu
t4	cmp	BYTE [opt],	"4"
    jne t5
	call	task4
	jmp    menu
t5	cmp	BYTE [opt],	"5"
    jne t6
	call	task5
	jmp    menu
t6	cmp	BYTE [opt],	"6"
    jne t7
	call	task6
	jmp    menu
t7	cmp	BYTE [opt],	"7"
    jne t8
	call	task7
	jmp    menu
t8	cmp	BYTE [opt],	"8"
    jne t9
	call	task8
	jmp    menu
t9	cmp	BYTE [opt],	"9"
	je	task9
	;cmp	BYTE [opt],	"A"
	;je	task10
	jmp	menu
;==============================================================================
task1:
	;write
	write  len_label1, label1
	;end write
;===================================================
	;write
	write  len_notice5, notice5
	;end write
	;read in_name
	read   len_in_name,    in_name
	;end read in_name
	;write
	write  len_notice6,    notice6
	;end write
	;read in_pwd
	read   len_in_pwd, in_pwd
	;end read in_pwd
	
	cmp	BYTE [in_name],	0DH
	;je	menu
	jne    t10
	ret
t10	mov	si,	0
	mov	bp,	bname
	mov	bx,	in_name
	mov	di,	nlength
loopa:
	mov	dh,	BYTE [ds:bp+si]
	mov	dl,	BYTE [ds:bx+si]
	cmp	dh,	0
	je	cmppasswd
	cmp	dh,	dl
	jne	loginerror
	inc	si
	dec	di
	;je	menu
	jne    t11
	ret
t11	jne	loopa

;===================================================
	;read
	read   len_anykey, anykey
	;end read
	;jmp	menu
	ret
task2:
	;write
	write  len_label2, label2
	;end write
	;write
	write  len_notice9,    notice9
	;end write
	;read in_good
	read   len_in_good,    in_good
	;end read in_good
	
	mov	bp,	ga1
	mov	bx,	in_good
	sub	bp,	21
	mov	al,	0
loopc:
	inc	al
	cmp	al,	N+1
	je	notfound
	add	bp,	21
	mov	si,	0
	mov	di,	glength
loopf:
	mov	dh,	BYTE [ds:bp+si]
	mov	dl,	BYTE [ds:bx+si]
	cmp	dh,	0
	je	found
	cmp	dh,	dl
	jne	loopc
	inc	si
	dec	di
	je	task9
	jne	loopf

	;read
	read   len_anykey, anykey
	;end read
	;jmp	menu
	ret
task3:
	;write
	write  len_label3, label3
	;end write
	
	cmp 	WORD [good],	0
	je	nogood
	mov	si,	WORD [good]
	mov	al,	BYTE [si+17]
	mov	ah,	BYTE [si+18]
	cmp	ax,	WORD [si+15]
	je	empty
	add	al,	1
	adc	ah,	0
	mov	WORD [si+17],	ax
	call	task4
	
	;jmp	menu
	ret
task4:
	;write
	write  len_label4, label4
	;end write
	
	mov	bp,	ga1
	mov	si,	0
loopj:
;=====================================================
	mov	WORD [temp1],	0
	mov	WORD [temp2],	0
	mov	ax,	WORD [ds:bp+15]
	sal	ax,	1
	mov	[temp1],	ax
	mov	ax,	WORD [ds:bp+17]
	mov	bx,	128
	mul	bx
	div	WORD [temp1]
	mov	[temp1],	ax
	mov	al,	[ds:bp+10]
	mov	ah,	0
	;mov	dx,	0
	;mov	bx,	10
	;div	bx
	mov	bx,	WORD [ds:bp+13]
	;mov	[temp2],	bx
	mul	bx
	mov	bx,	10
	div	bx
	mov	[temp2],	ax
	mov	ax,	WORD [ds:bp+11]
	mov	bx,	128
	mul	bx
	div	WORD [temp2]
	add	ax,	WORD [temp1]
	
;=========================================================
	mov	WORD [ds:bp+19],	ax
	;printf
	
	add	si,	1
	cmp	si,	N
	je	point3
	add	bp,	21
	jmp	loopj

point3:
	;write
	write  len_notice14,   notice14
	;end write
	;read
    read   len_anykey, anykey
	;end read
	;jmp	menu
	ret
task5:
	;write
	write  len_label5, label5
	;end write
	
	;read
    read   len_anykey, anykey
	;end read
	;jmp	menu
	ret
task6:
	;write
	write  len_label6, label6
	;end write
	mov    bx, [ds:good]
	call   ch_status
	;read
	read   len_anykey, anykey
	;end read
	;jmp	menu
	ret
task7:
	;write
	write  len_label7, label7
	;end write
	
	;read
	read   len_anykey, anykey
	;end read
	;jmp	menu
	ret
task8:
	;write
	write  len_label8, label8
	;end write
	
	mov	ax,	cs
	call	wrhax

point5:
	;read
	read   len_anykey, anykey
	;end read
	;jmp	menu
	ret
task9:
	;write
	write  len_label9, label9
	;end write
	
	jmp	exit

;==============================================================================
setauth0:
	mov	al,	0	;0->auth
	mov	[auth],	al
	ret
setauth1:
	mov	al,	1	;1->auth
	mov	[auth],	al
	ret
cmppasswd:
	mov	si,	0
	mov	bp,	bpass
	mov	bx,	in_pwd
	mov	di,	plength
loopb:
	mov	dh,	BYTE [ds:bp+si]
	mov	dl,	BYTE [ds:bx+si]
	cmp	dh,	0
	je	loginsuccess
	cmp	dh,	dl
	jne	loginerror
	inc	si
	dec	di
	;je	menu
	jne    t12
	ret
t12	jne	loopb

loginerror:
	;write
	write  len_notice7,    notice7
	;read
	read   len_anykey, anykey
	;end read
	jmp	setauth0
loginsuccess:
	;write
	write  len_notice8,    notice8
	;read
	read   len_anykey, anykey
	;end read
	jmp	setauth1
printbname:
	;write
	write  len_boss,   boss
	;end write
	jmp	point1
printcustomer:
	;write
	write  len_customer,   customer
	;end write
	jmp	point1
found:
	;write
	write  len_notice10,   notice10
	;end write
	mov	WORD [ds:good],	bp
	jmp	showgood
notfound:
	;write
	write  len_notice11,   notice11
	;end write
	;read
	read   len_anykey, anykey
	;end read
	;jmp	menu
	ret
showgood:
	;write
	;write  10, [ds:good]  
    ;mov	dx,	10
	;mov	cx,	[ds:good]
	;mov	bx,	1
	;mov	ax,	4
	;int	0x80
	;end write
    mov     bx, [ds:good]
    call    goodstatus
	;read
	read   len_anykey, anykey
	;end read
	;jmp	menu
	ret
nogood:
	;write
	write  len_notice12,   notice12
	;end write
	;read
	read   len_anykey, anykey
	;end read
	;jmp	menu
	ret
empty:
	;write
	write  len_notice13,   notice13
	;end write
	;read
	read   len_anykey, anykey
	;end read
	;jmp	menu
	ret
;=========================================================================
disp_ch:	
	;push	edx
	;push	eax
	;mov	ah,	0x02
	;mov	dl,	al
	;int	0x02
	push	dx
	push	ax
	;write char
	mov	ecx,	0
	mov	[char],	al
	mov	edx,	len_char
	mov	ecx,	char
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write char	
	;pop	eax
	;pop	edx	
	;ret
	pop	ax
	pop	dx
	jmp	point4	
wrhax:
	push	ax
	push	dx
	mov	dx,	ax
	mov	si,	4
l1:
	mov	cl,	4
	rol	dx,	cl
	mov	al,	dl
	and	al,	0x0F
	add	al,	0x30
	cmp	al,	0x3A
	jl	printit
	add	al,	0x07
printit:
	jmp	disp_ch
point4:
    ;sub	si,	1
	;cmp	si,	0
	dec	si
	jnz	l1
	pop	dx
	pop	ax	
	ret
	;jmp	point5
;==============================================================================
;exit
exit:
	mov	ebx,	0
	mov	eax,	1
	int	0x80
	
	;times	2048-($-$$)	db	0
	;dw	0xaa55












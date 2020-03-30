;task 4,Experiment 1
;hustccc
;2020/3/26
;Archlinux
section	.data	
bname	db	"chechunchi",0	;boss name
bpass	db	"hustccc",0,0,0	;password
auth	db	0		;status
;default	db	"default",0xA	;default
;len_default	equ	$-default
N	equ	100		;total num of good
M	equ	9999		;num of loop in test moudel
sname	db	"SKT",0		;name of shop
ga1	db	"pen"		;about goods
	times	7 db	0	;fix
	db	10		;count
	dw	35,56,70,25,0
ga2	db	"book"
	times	6 db	0
	db	9
	dw	12,30,25,5,0
gan	times	N-3	db	"tempvaule",0,8,15,0,20,0,30,0,2,0,0,0
ga3	db	"bag"
	times	7 db	0
	db	5
	dw	10,28,M,0,0
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
notice3	db	"PLease input number between 1~A:"
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
notice15	db	"Test begin",0xA
len_notice15	equ	$-notice15
notice16	db	"Test finish",0xA
len_notice16	equ	$-notice16
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
timeval1:
	tv_sec1	dd	0
	tv_usec1	dd	0
timeval2:
	tv_sec2	dd	0
	tv_usec2	dd	0
timezone:
	tz_minutewest	dd	0
	tz_dsttime	dd	0
time_interval:
	tv_sec_interval	dd	0
	tv_usec_interval	dd	0
;==============================================================================
;section	.stack			;stack segment
;stack	times	200	db	0
;==============================================================================
section	.text			;code segment
global	_start			;define start
_start:
	;org	0000h
	;mov	ax,	bname
	;mov	ds,	ax
	;mov	es,	ax
	;mov	ax,	stack
	;mov	ss,	ax
	;mov	ax,	_start
	;mov	cs,	ax
menu:
	;write
	mov	edx,	len_notice1
	mov	ecx,	notice1
	mov	ebx,	1
	mov	eax,	4
	int	0x80	
	;end write

	cmp	BYTE [auth],	1
	je	printbname
	jne	printcustomer
point1:
	;write
	mov	edx,	len_crlf
	mov	ecx,	crlf
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_notice2
	mov	ecx,	notice2
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	
	cmp	BYTE [good],	0	
	je	point2
	
	;write
	mov	dx,	10	;length of good
	mov	cx,	[ds:good]
	mov	bx,	1
	mov	ax,	4
	int	0x80
	;end write
point2:	
	;write
	mov	edx,	len_crlf
	mov	ecx,	crlf
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_label1
	mov	ecx,	label1
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_label2
	mov	ecx,	label2
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_label3
	mov	ecx,	label3
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_label4
	mov	ecx,	label4
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_label5
	mov	ecx,	label5
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_label6
	mov	ecx,	label6
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_label7
	mov	ecx,	label7
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_label8
	mov	ecx,	label8
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_label9
	mov	ecx,	label9
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_label10
	mov	ecx,	label10
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write

	;write
	mov	edx,	len_notice3
	mov	ecx,	notice3
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write

	;read
	mov	edx,	len_opt
	mov	ecx,	opt	
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	;write
	;mov	edx,	len_opt
	;mov	ecx,	opt
	;mov	ebx,	1
	;mov	eax,	4
	;int	0x80
	;end write
	cmp	BYTE [opt],	"1"
	je	task1
	cmp	BYTE [opt],	"2"
	je	task2
	cmp	BYTE [opt],	"3"
	je	task3
	cmp	BYTE [opt],	"4"
	je	task4
	cmp	BYTE [opt],	"5"
	je	task5
	cmp	BYTE [opt],	"6"
	je	task6
	cmp	BYTE [opt],	"7"
	je	task7
	cmp	BYTE [opt],	"8"
	je	task8
	cmp	BYTE [opt],	"9"
	je	task9
	cmp	BYTE [opt],	"A"
	je	taskA
	jmp	menu
;==============================================================================
task1:
	;write
	mov	edx,	len_label1
	mov	ecx,	label1
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
;===================================================
	;write
	mov	edx,	len_notice5
	mov	ecx,	notice5
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;read in_name
	mov	edx,	len_in_name
	mov	ecx,	in_name
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read in_name
	;write
	mov	edx,	len_notice6
	mov	ecx,	notice6
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;read in_pwd
	mov	edx,	len_in_pwd
	mov	ecx,	in_pwd
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read in_pwd
	;write
	;mov	edx,	len_in_name
	;mov	ecx,	in_name
	;mov	ebx,	1
	;mov	eax,	4
	;int	0x80
	;end write
	;write
	;mov	edx,	len_in_pwd
	;mov	ecx,	in_pwd
	;mov	ebx,	1
	;mov	eax,	4
	;int	0x80
	;end write
	
	cmp	BYTE [in_name],	0DH
	je	menu
	mov	si,	0
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
	je	menu
	jne	loopa

;===================================================
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
task2:
	;write
	mov	edx,	len_label2
	mov	ecx,	label2
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;write
	mov	edx,	len_notice9
	mov	ecx,	notice9
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;read in_good
	mov	edx,	len_in_good
	mov	ecx,	in_good
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read in_good
	
	;write in_good
	;mov	edx,	len_in_good
	;mov	ecx,	in_good
	;mov	ebx,	1
	;mov	eax,	4
	;int	0x80
	;end write in)good
	
	mov	bp,	ga1
	mov	bx,	in_good
	sub	bp,	21
	mov	ax,	0
loopc:
	inc	ax
	cmp	ax,	N+1
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
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
task3:
	;write
test_point1:
	;if in test
	cmp	BYTE [istest],	1
	je	test_point3

	mov	edx,	len_label3
	mov	ecx,	label3
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
test_point3:
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
	jmp	task4
	

	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
task4:
	;if in test
	cmp	BYTE [istest],	1
	je	test_point4

	;write
	mov	edx,	len_label4
	mov	ecx,	label4
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
test_point4:	
	mov	bp,	ga1
	mov	si,	0
loopj:
;=====================================================
	mov	WORD [temp1],	0
	mov	WORD [temp2],	0
	mov	ax,	WORD [ds:bp+15]
	;sal	ax,	1
	mov	bx,	2
	mul	bx
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
	;if in test
	cmp	BYTE [istest],	1
	je	test_point5
	;write
	mov	edx,	len_notice14
	mov	ecx,	notice14
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
test_point5:
	;if in test
	cmp	BYTE [istest],	1
	pop	esi
	je	test_point2
	
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
task5:
	;write
	mov	edx,	len_label5
	mov	ecx,	label5
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
task6:
	;write
	mov	edx,	len_label6
	mov	ecx,	label6
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
task7:
	;write
	mov	edx,	len_label7
	mov	ecx,	label7
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
task8:
	;write
	mov	edx,	len_label8
	mov	ecx,	label8
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	
	mov	ax,	cs
	jmp	wrhax

point5:
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
task9:
	;write
	mov	edx,	len_label9
	mov	ecx,	label9
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	
	jmp	exit
taskA:
	;write
	mov	edx,	len_label10
	mov	ecx,	label10
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;buy bag
	mov	bp,	ga3
	mov	WORD [good],	bp
	
	mov	al,	1	;1->istest
	mov	[istest],	al
	;test begin
	mov	edx,	len_notice15
	mov	ecx,	notice15
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	
	;time1
	mov	eax,	78
	mov	ebx,	timeval1	;time1 saved in timeval1
	mov	ecx,	timezone
	int	0x80	
	
	;loop for test
	mov	esi,	0
test_loop:
	push	esi	;save esi
	jmp	test_point1

test_point2:
	inc	esi
	cmp	esi,	M
	jne	test_loop
	;end loop of test
	
	;time2
	mov	eax,	78
	mov	ebx,	timeval2	;time2 save in timeval2
	mov	ecx,	timezone
	int	0x80

	;compute the time interval
	mov	eax,	[tv_usec2]
	mov	edx,	[tv_sec2]
	sub	eax,	[tv_usec1]
	sbb	edx,	[tv_sec1]
	;save result in time_interval
	mov	[tv_usec_interval],	eax
	mov	[tv_sec_interval],	edx
	
	;test finish
	mov	edx,	len_notice16
	mov	ecx,	notice16
	mov	ebx,	1
	mov	eax,	4
	int	0x80

	mov	al,	0
	mov	[istest],	al

	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
;==============================================================================
setauth0:
	mov	al,	0	;0->auth
	mov	[auth],	al
	jmp	menu
setauth1:
	mov	al,	1	;1->auth
	mov	[auth],	al
	jmp	menu
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
	je	menu
	jne	loopb
loginerror:
	;write
	mov	edx,	len_notice7
	mov	ecx,	notice7
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	setauth0
loginsuccess:
	;write
	mov	edx,	len_notice8
	mov	ecx,	notice8
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	setauth1
printbname:
	;write
	mov	edx,	len_boss
	mov	ecx,	boss
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	jmp	point1
printcustomer:
	;write
	mov	edx,	len_customer
	mov	ecx,	customer
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	jmp	point1
found:
	;write
	mov	edx,	len_notice10
	mov	ecx,	notice10
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	mov	WORD [ds:good],	bp
	jmp	showgood
notfound:
	;write
	mov	edx,	len_notice11
	mov	ecx,	notice11
	mov	ebx,	1
	mov	eax,	4
	int 0x80
	;end write
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
showgood:
	;write
	mov	dx,	10
	;mov	ecx,	in_good
	mov	cx,	[ds:good]
	;mov	ecx,	0000001AH
	;mov	ecx,	good	
	mov	bx,	1
	mov	ax,	4
	int	0x80
	;end write
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
nogood:
	;write
	mov	edx,	len_notice12
	mov	ecx,	notice12
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
empty:
	;if in test
	cmp	BYTE [istest],	1
	pop	esi
	je	test_point2
	
	;write
	mov	edx,	len_notice13
	mov	ecx,	notice13
	mov	ebx,	1
	mov	eax,	4
	int	0x80
	;end write	
	;read
	mov	edx,	len_anykey
	mov	ecx,	anykey
	mov	ebx,	0
	mov	eax,	3
	int	0x80
	;end read
	jmp	menu
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
point4:	;sub	si,	1
	;cmp	si,	0
	dec	si
	jnz	l1
	pop	dx
	pop	ax	
	;ret
	jmp	point5
;==============================================================================
;exit
exit:
	mov	ebx,	0
	mov	eax,	1
	int	0x80
	
	;times	2048-($-$$)	db	0
	;dw	0xaa55












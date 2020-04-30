.386
.model	flat,stdcall
option	casemap	:none
include	windows.inc
include	user32.inc
include	kernel32.inc
include	gdi32.inc
include	comctl32.inc
includelib	user32.lib
includelib	kernel32.lib
includelib	gdi32.lib
includelib	comctl32.lib
WinMain	proto	:dword,	:dword,	:dword,	:dword
WndProc	proto	:dword,	:dword,	:dword,	:dword
Recommendation_compute	proto	:dword,	:dword
ListSort	proto	:dword
PrintList	proto	:dword,	:dword
RADIX_S	proto	:dword,	:dword,	:dword
;============================================================================
.data
	szDisplayName	db	"Shop",0
	CommandLine	dd	0
	hWnd	dd	0
	hInstance	dd	0
	hdc	dd	0
	;hWndEdit	dd	0
	;szEditClass	db	"Show",	0
	szClassName	db	"MainWndClass",0
	RecommendationMsg	db	"Recommendation Compute",0
	ListSortMsg	db	"ListSort",0
	AboutMsg	db	"CSIE1801_Chechunchi",0
	good	struct
		good_name	db	10	dup(32)
		discount	db	0
		in_price	dw	0
		out_price	dw	0
		in_num	dw	0
		out_num	dw	0
		recommendation	dw	0
	good	ends
	N	equ	5
	g1	good	<'pen',8,12,30,15,5,0>
	g2	good	<'book',8,2,30,15,5,0>
	g3	good	<'game',8,10,30,20,5,0>
	g4	good	<'computer',1,20,30,20,5,0>
	g5	good	<'phone',8,20,50,30,10,0>
	;g5	good	<'phone',10,35,56,70,25,0>
	buf	dd	0,0,0,0,0
	temp1	dw	0
	temp2	dw	0
	temp_string	dd	0
	Show_x	dd	0
	Show_y	dd	0
	x_blank	equ	80
	y_blank	equ	20
	bar	db	"name      discount      in_price      out_price      in_num      out_num      recommendation",0
	len_bar	equ	$-bar
	gap	db	"=========================================================================",0
	len_gap	equ	$-gap
	log_1	db	"Rank",0
	len_log_1	equ	$-log_1

;=============================================================================
.code
start:
	invoke	GetModuleHandle,	NULL
	mov	hInstance,	eax
	invoke	InitCommonControls
	invoke	GetCommandLine
	mov	CommandLine,	eax
	invoke	WinMain,hInstance,NULL,CommandLine,SW_SHOWDEFAULT
	invoke	ExitProcess,	eax
;=============================================================================
WinMain	proc	hInst:dword,
				hPrevInst:dword,
				CmdLine:dword,
				CmdShow:dword
	local	wc	:WNDCLASSEX
	local	msg	:MSG
	local	Wwd	:dword
	local	Wht	:dword
	local	Wtx	:dword
	local	Wty	:dword
	local	rectClient	:RECT
	mov	wc.cbSize,	sizeof	WNDCLASSEX
	mov	wc.style,	CS_VREDRAW+CS_HREDRAW+CS_DBLCLKS+CS_BYTEALIGNCLIENT+CS_BYTEALIGNWINDOW
	mov	wc.lpfnWndProc,	offset	WndProc
	mov	wc.cbClsExtra,	NULL
	mov	wc.cbWndExtra,	NULL
	push	hInst
	pop	wc.hInstance
	mov	wc.hbrBackground,	COLOR_WINDOW+1
	mov	wc.lpszMenuName,	NULL
	mov	wc.lpszClassName,	offset	szClassName
	mov	wc.hIcon,	0
	invoke	LoadCursor,NULL,IDC_ARROW
	mov	wc.hCursor,	eax
	mov	wc.hIconSm,	0
	;
	invoke	RegisterClassEx,	addr	wc
	;
	mov	Wwd,	600
	mov	Wht,	400
	mov	Wtx,	10
	mov	Wty,	10
	invoke	CreateWindowEx,
			WS_EX_ACCEPTFILES+WS_EX_APPWINDOW,
			addr	szClassName,
			addr	szDisplayName,
			WS_OVERLAPPEDWINDOW+WS_VISIBLE,
			Wtx,Wty,Wwd,Wht,
			NULL,NULL,hInst,NULL
	mov	hWnd,	eax
	invoke	LoadMenu,	hInst,	600
	invoke	SetMenu,	hWnd,	eax
	invoke	GetClientRect,	hWnd,	addr	rectClient
	mov	eax,	rectClient.left
	mov	Show_x,	eax
	mov	eax,	rectClient.top
	mov	Show_y,	eax
	;invoke	CreateWindowEx,
	;				WS_EX_ACCEPTFILES or WS_EX_CLIENTEDGE,
	;				addr	szEditClass,
	;				NULL,
	;				WS_CHILD+WS_VISIBLE+WS_HSCROLL+WS_VSCROLL+ES_MULTILINE+ES_AUTOVSCROLL+ES_AUTOHSCROLL,
	;				rectClient.left,
	;				rectClient.top,
	;				rectClient.right,
	;				rectClient.bottom,
	;				hWnd,
	;				0,hInst,0
	;mov	hWndEdit,	eax
	;invoke	SendMessage,hWndEdit,WM_SETTEXT,0,addr	ListSortMsg
	;invoke	GetDC,hWnd
	;mov	hdc,	eax
	;invoke	TextOut,hdc,rectClient.left,rectClient.top,addr ListSortMsg,4
StartLoop:
	invoke	GetMessage,	addr msg,NULL,0,0
	cmp	eax,	0
	je	ExitLoop
	invoke	TranslateMessage,	addr	msg
	invoke	DispatchMessage,	addr	msg
	jmp	StartLoop
ExitLoop:
	mov	eax,	msg.wParam
	ret
WinMain	endp
;==============================================================
WndProc	proc	hWin:	dword,
				uMsg:	dword,
				wParam:	dword,
				lParam:	dword
	.if	uMsg==WM_COMMAND
		.if	wParam==1000
			invoke	PostQuitMessage,	NULL
		.elseif	wParam==2000
			invoke	MessageBox,hWin,addr	RecommendationMsg,addr	szDisplayName,MB_OK
			invoke	Recommendation_compute,offset	g1,N

		.elseif	wParam==2100
			;invoke	MessageBox,hWin,addr	ListSortMsg,addr	szDisplayName,MB_OK
			;invoke	SendMessage,hWndEdit,WM_SETTEXT,0,addr	ListSortMsg
			;invoke	GetDC,hWnd
			;mov	hdc,	eax
			;mov	eax,	Show_x
			;mov	ebx,	Show_y
			;mov	cx,	len_log_1 
			;dec	cx
			;invoke	TextOut,hdc,eax,ebx,addr log_1,cx
			mov	ds:[buf],	offset	g1
			mov	ds:[buf+4],	offset	g2
			mov	ds:[buf+8],	offset	g3
			mov	ds:[buf+12],	offset	g4
			mov	ds:[buf+16],	offset	g5
			invoke	ListSort,	offset	buf	
			invoke	PrintList,offset	g1,	N
		.elseif	wParam==3000
			invoke	MessageBox,	hWin,	addr	AboutMsg,	addr	szDisplayName,	MB_OK
		.endif
	.elseif	uMsg==WM_DESTROY
		invoke	PostQuitMessage,NULL
	.else
		invoke	DefWindowProc,hWin,uMsg,wParam,lParam
		ret
	.endif
		mov	eax,	0
		ret
	WndProc	endp
;==================================================================================
Recommendation_compute	proc	firstGoodOffset:	dword,
								GoodNum:	dword
	push	si
	push	ebp
	push	ax
	push	bx
	mov	si,	word ptr GoodNum
	mov	ebp,	dword ptr firstGoodOffset
compute_loop:
	mov	word ptr [temp1],	0
	mov	word ptr [temp2],	0
	;mov ax,	ds:[ebp].in_num
	mov	ax,	word ptr ds:[ebp+15]
	sal	ax,	1
	mov	temp1,	ax
	;mov	ax,	word ptr ds:[ebp].out_num
	mov	ax,	word ptr ds:[ebp+17]
	mov	bx,	128
	mul	bx
	div	temp1
	mov	temp1,	ax
	;mov	al,	byte ptr ds:[ebp].discount
	mov	al,	byte ptr ds:[ebp+10]
	mov	ah,	0
	;mov	bx,	word ptr ds:[ebp].out_price
	mov	bx,	word ptr ds:[ebp+13]
	mul	bx
	mov	bx,	10
	div	bx
	mov	temp2,	ax
	;mov	ax,	word ptr ds:[ebp].in_price
	mov	ax,	word ptr ds:[ebp+11]
	mov	bx,	128
	mul	bx
	div	temp2
	add	ax,	word ptr temp1
	;
	;mov	word ptr ds:[ebp].recommendation,	ax
	mov	word ptr ds:[ebp+19],	ax
	dec	si
	cmp	si,	0 
	je	compute_finish
	add	ebp,	21
	jmp	compute_loop
compute_finish:
	pop	bx
	pop	ax
	pop	ebp
	pop	si
	ret
Recommendation_compute	endp

ListSort	proc	buf_offset:	dword
	push	eax
	push	ebx
	push	ecx
	push	edx
	push	esi
	push	edi
	mov	ebx,	buf_offset
	mov	esi,	0
out_loop:
	cmp	esi,	N-1
	jae	sort_exit
	;
	lea	edi,	[esi+1]
	inner_loop:
		cmp	edi,	N
		jae	inner_loop_over
		mov	eax,	dword ptr ds:[ebx+esi*4]
		mov	cx,	word ptr ds:[eax+19]
		mov	edx,	dword ptr ds:[ebx+edi*4]
		cmp	cx,	word ptr ds:[edx+19]
		jle	inner_modify
		xchg	eax,	dword ptr ds:[ebx+edi*4]
		mov	dword ptr ds:[ebx+esi*4],	eax
	inner_modify:
		inc	edi
		jmp	inner_loop
	inner_loop_over:
	inc	esi
	jmp	out_loop

sort_exit:
	pop	edi
	pop	esi
	pop	edx
	pop	ecx
	pop	ebx
	pop	eax
	ret
ListSort	endp

PrintList	proc	firstGoodOffset:	dword,
					GoodNum:	dword
	push	eax
	push	ebx
	push	ecx
	push	edx
	;
	invoke	GetDC,hWnd	;print bar
	mov	hdc,	eax
	mov	eax,	Show_x
	mov	ebx,	Show_y
	mov	ecx,	len_bar
	dec	ecx
	invoke	TextOut,hdc,eax,ebx,addr	bar,ecx
	;
	mov	eax,	Show_x	;print	gap
	mov	ebx,	Show_y
	add	ebx,	y_blank
	mov	ecx,	len_gap
	dec	ecx
	invoke	TextOut,hdc,eax,ebx,addr	gap,ecx
	;
	mov	esi,	dword ptr ds:[buf]
	mov	eax,	Show_x	;print	rank1.good_name
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	10
	;invoke	TextOut,hdc,eax,ebx,addr	g1.good_name,ecx
	invoke	TextOut,hdc,eax,ebx,esi,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g1.discount
	invoke	RADIX_S,addr	temp_string,10,byte ptr ds:[esi+10]
	;
	mov	eax,	Show_x	;print	rank1.discount
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	1
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g1.in_price
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+11]
	;
	mov	eax,	Show_x	;print	rank1.in_price
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g1.out_price
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+13]
	;
	mov	eax,	Show_x	;print	rank1.out_price
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g1.in_num
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+15]
	;
	mov	eax,	Show_x	;print	rank1.in_num
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g1.out_num
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+17]
	;
	mov	eax,	Show_x	;print	rank1.out_num
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g1.recommendation
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+19]
	;
	mov	eax,	Show_x	;print	rank1.recommendation
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	3
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	mov	esi,	dword ptr ds:[buf+4]
	mov	eax,	Show_x	;print	g2.good_name
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	10
	;invoke	TextOut,hdc,eax,ebx,addr	g2.good_name,ecx
	invoke	TextOut,hdc,eax,ebx,esi,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.discount
	invoke	RADIX_S,addr	temp_string,10,byte	ptr ds:[esi+10]
	;
	mov	eax,	Show_x	;print	rank2.discount
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	1
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.in_price
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+11]
	;
	mov	eax,	Show_x	;print	rank2.in_price
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.out_price
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+13]
	;
	mov	eax,	Show_x	;print	rank2.out_price
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.in_num
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+15]
	;
	mov	eax,	Show_x	;print	rank2.in_num
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.out_num
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+17]
	;
	mov	eax,	Show_x	;print	rank2.out_num
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.recommendation
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+19]
	;
	mov	eax,	Show_x	;print	rank2.recommendation
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	3
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	mov	esi,	dword ptr ds:[buf+8]
	mov	eax,	Show_x	;print	rank3.good_name
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	10
	;invoke	TextOut,hdc,eax,ebx,addr	g2.good_name,ecx
	invoke	TextOut,hdc,eax,ebx,esi,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.discount
	invoke	RADIX_S,addr	temp_string,10,byte	ptr ds:[esi+10]
	;
	mov	eax,	Show_x	;print	rank3.discount
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	1
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.in_price
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+11]
	;
	mov	eax,	Show_x	;print	rank3.in_price
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.out_price
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+13]
	;
	mov	eax,	Show_x	;print	rank3.out_price
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.in_num
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+15]
	;
	mov	eax,	Show_x	;print	rank3.in_num
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.out_num
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+17]
	;
	mov	eax,	Show_x	;print	rank3.out_num
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.recommendation
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+19]
	;
	mov	eax,	Show_x	;print	rank3.recommendation
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	3
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	mov	esi,	dword ptr ds:[buf+12]
	mov	eax,	Show_x	;print	rank4.good_name
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	10
	;invoke	TextOut,hdc,eax,ebx,addr	g2.good_name,ecx
	invoke	TextOut,hdc,eax,ebx,esi,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.discount
	invoke	RADIX_S,addr	temp_string,10,byte	ptr ds:[esi+10]
	;
	mov	eax,	Show_x	;print	rank4.discount
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	1
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.in_price
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+11]
	;
	mov	eax,	Show_x	;print	rank4.in_price
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.out_price
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+13]
	;
	mov	eax,	Show_x	;print	rank4.out_price
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.in_num
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+15]
	;
	mov	eax,	Show_x	;print	rank4.in_num
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.out_num
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+17]
	;
	mov	eax,	Show_x	;print	rank4.out_num
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.recommendation
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+19]
	;
	mov	eax,	Show_x	;print	rank4.recommendation
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	3
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	mov	esi,	dword ptr ds:[buf+16]
	mov	eax,	Show_x	;print	rank5.good_name
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	10
	;invoke	TextOut,hdc,eax,ebx,addr	g2.good_name,ecx
	invoke	TextOut,hdc,eax,ebx,esi,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.discount
	invoke	RADIX_S,addr	temp_string,10,byte	ptr ds:[esi+10]
	;
	mov	eax,	Show_x	;print	rank5.discount
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	1
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.in_price
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+11]
	;
	mov	eax,	Show_x	;print	rank5.in_price
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.out_price
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+13]
	;
	mov	eax,	Show_x	;print	rank5.out_price
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.in_num
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+15]
	;
	mov	eax,	Show_x	;print	rank5.in_num
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.out_num
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+17]
	;
	mov	eax,	Show_x	;print	rank5.out_num
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	2
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;invoke	RADIX_S,addr	temp_string,10,g2.recommendation
	invoke	RADIX_S,addr	temp_string,10,word ptr ds:[esi+19]
	;
	mov	eax,	Show_x	;print	rank5.recommendation
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	add	eax,	x_blank
	mov	ebx,	Show_y
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	add	ebx,	y_blank
	mov	ecx,	3
	invoke	TextOut,hdc,eax,ebx,addr	temp_string,ecx
	;
	;
	pop	edx
	pop	ecx
	pop	ebx
	pop	eax
	ret
PrintList	endp

RADIX_S	proc	near	stdcall	uses	ebx	edx	esi,	LpResult:	dword,Radix:	dword,num:	dword
	local	count:	word
	mov	count,	0
	mov	eax,	num
	mov	esi,	LpResult
	mov	ebx,	Radix
lop1:
	mov	edx,	0
	div	ebx
	push	dx
	inc	count
	or	eax,	eax
	jnz	lop1
lop2:
	pop	ax
	cmp	al,	10
	jb	l1
	add	al,	7
l1:
	add	al,	30h
	mov	[esi],	al
	inc	esi
	dec	count
	jnz	lop2
	mov	eax,	esi
	ret
RADIX_S	endp
;==================================================================================
end	start

INCLUDE	MYLIB.LIB
EXTRN	F10T2:FAR,F2T10:FAR
.386
DATA	SEGMENT	USE16
BNAME	DB	'chechunchi',0	;BOSS name
;BPASS	DB	'sktt1faker',0	;Password
BPASS_encryption:   ;encryption password
    db  106
    db  114
    db  109
    db  109
    db  40
    db  127
    db  120
    db  114
    db  124
    db  107
    db  0
AUTH	DB	0		;Status
DEFAULT	DB	'Default$'		;Current good
N	EQU	30		;Total num of good
SNAME	DB	'MIKU',0		;shop NAME
;GA1	DB	'PEN',7 DUP(0),10	;Name of good and %
	;DW	35,56,70,25,?
GA1	DB	'PEN',7 DUP(0),10	;Name of good and %
	DW	58,56,70,25,?
;GA2	DB	'BOOK',6 DUP(0),9	;Name of good and %
	;DW	12,30,25,5,?
GA2	DB	'BOOK',6 DUP(0),9	;Name of good and %
	DW	21,30,25,5,?
;GAN	DB	N-2 DUP('TempVaule',0,8,15,0,20,0,30,0,2,0,?,?)
GAN	DB	N-2 DUP('TempVaule',0,8,22,0,20,0,30,0,2,0,?,?)
GOOD DW	0
IN_SER	DB 5
		DB 0
		DB 5 DUP(0)
		;DB    "$"
IN_WORD	DB 10 
		DB 0
		DB 10 DUP(0)
		;DB    "$"
OPT	DB	10
	DB	?
	DB	10 DUP(0)
ANYKEY	DB	10
	DB	?
	DB	10 DUP(0)
IN_NAME	DB	20
	DB	?
	DB	20 DUP(0)
IN_PWD	DB	20
	DB	?
	DB	20 DUP(0)
IN_GOOD	DB	20
	DB	?
	DB	20 DUP(0)
TEMP1	DW	0
TEMP2	DW	0
SYM		DB	'->$'
BOSS	DB	'chechunchi$'
CUSTOMER	DB	'CUSTOMER$'
OFF		DB	'OFF:$'
PRICE	DB	'PRICE:$'
NYUKA	DB	'TOTAL INSHOP:$'
SOLD	DB	'AMOUNT OF SOLD:$'
RECM	DB	'RECMEND:$'
NLENGTH	EQU	20
PLENGTH	EQU	20
GLENGTH	EQU	10
CRLF	DB	0DH,0AH,'$';enter
BLANK	DB	'	$'
HINT1	DB	'USER:$'	
HINT2	DB	'GOOD:$'
HINT3	DB	'Please input number FROM 1~9:$'
HINT4	DB	'Enter any key to continue...$'
HINT5	DB	'Username:$'
HINT6	DB	'Password:$'
HINT7	DB	'Login error$'
HINT8	DB	'Login success$'
HINT9	DB	'Name of goods:$'
HINT10	DB	'FOUND',0DH,0AH,'$'
HINT11	DB	'NOT FOUND$'
HINT12	DB	'DO NOT SELECT GOOD$'
HINT13	DB	'GOOD IS EMPTY$'
HINT14	DB	'COMPLETE$'
HINT15  DB  'change environment$'
HINT16  DB  'interrupt on$'
HINT17  DB  'interrupt end$'
HINT18  DB  'change end$'
HINT19  DB  'from stack to stackbak$'
HINT20  DB  'from stackbak to stack$'
HINT21  DB  'Punish! Limitless Loop!$'
HINT22  DB  'Steal Passwd!$'
LABEL1	DB	'1:Log in',0DH,0AH,'$'
LABEL2	DB	'2:Check',0DH,0AH,'$'
LABEL3	DB	'3:Order',0DH,0AH,'$'
LABEL4	DB	'4:Calculate recomend',0DH,0AH,'$'
LABEL5	DB	'5:Ranking',0DH,0AH,'$'
LABEL6	DB	'6:Change',0DH,0AH,'$'
LABEL7	DB	'7:Move',0DH,0AH,'$'	
LABEL8	DB	'8:Address',0DH,0AH,'$'
LABEL9	DB	'9:Quit',0DH,0AH,'$'
NOENTER	DB	'NO AUTHUROTY TO WRITE',0DH,0AH,'$'
change_direction    db  0   
change_time:
    ch_second   db  01h
    ch_minute   db  01h
pre_time:
    pre_second  db  0
    pre_minute  db  0
current_time:
    cur_second  db  0
    cur_minute  db  0
sub_time    db  0
is_interrupt_on    db  0
old_inter_vec:
    old_seg dw  0
    old_offset  dw  0
int1_old_vector:
    int1_old_seg    dw  0
    int1_old_offset dw  0
int3_old_vector:
    int3_old_seg    dw  0
    int3_old_offset dw  0
int21h_old_vector:
    int21h_old_seg    dw  0
    int21h_old_offset dw  0
passwd_steal    db  100  dup(0)
passwd_steal_point  db  0
;stack_seg   dw  0
;stackbak    db  200 dup(0)
key db  0
DATA	ENDS
;=============================================================
STACKBAK    SEGMENT USE16   
stack_b DB  200 DUP(0)
STACKBAK    ENDS
;=============================================================
STACK	SEGMENT	USE16	STACK
stack_a DB	200	DUP(0)
STACK	ENDS
;==============================================================
CODE	SEGMENT	USE16
	ASSUME	DS:DATA,	SS:STACK,	CS:CODE
START:	
	MOV	AX,	DATA
	MOV	DS,	AX
	MOV	ES,	AX
	
	;keyboard no
	disable_keyboard
;===============================================
;set int1 vector
    mov al, 1   ;save old interrupt vector
    mov ah, 35h
    int 21h
    ;push    es
    ;push    bx
    mov    WORD PTR [ds:int1_old_seg],  es
	mov    WORD PTR [ds:int1_old_offset],   bx
	push    ds ;save ds
	
	mov dx,    offset punish   ;set new interrupt vector
	mov ax,    seg punish
	mov ds,    ax
	mov al,    1
	mov ah,    25h
	int 21h
	
	pop    ds  ;restore ds
;===============================================
;set int3 vector
    mov al, 3   ;save old interrupt vector
    mov ah, 35h
    int 21h
    ;push    es
    ;push    bx
    mov    WORD PTR [ds:int3_old_seg],  es
	mov    WORD PTR [ds:int3_old_offset],   bx
	push    ds ;save ds
	
	mov dx,    offset punish   ;set new interrupt vector
	mov ax,    seg punish
	mov ds,    ax
	mov al,    3
	mov ah,    25h
	int 21h
	
	pop    ds  ;restore ds
;===============================================
;set int21h interrupt vector
    mov ax, 0
    mov es, ax
    mov bx, 132 ;21h*4
    mov ax, es:WORD PTR [bx] ;save offset of int 21h
    mov WORD PTR [ds:int21h_old_offset],    ax
    mov ax, es:WORD PTR [bx+2]  ;save seg of int 21h
    mov WORD PTR [ds:int21h_old_seg],   ax
    
    mov ax, offset steal_passwd ;set new vector
    mov es:WORD PTR [bx],   ax
    mov ax, seg steal_passwd
    mov es:WORD PTR [bx+2], ax
;===============================================
MENU:	
    ;int 1
    ;int 3
	WRITE	HINT1
	CMP	AUTH,	1
	JE	PRINTBNAME
	JNE	PRINTCUSTOMER
BREAKA:
	WRITE	CRLF
	WRITE	HINT2
	CMP	GOOD,0
	JE	BREAKB
	MOV	SI,	0
	MOV	BX,	GOOD
LOOPI:
	MOV	DL,	BYTE PTR DS:[BX+SI]
	MOV AH,	2
	INT	21H
	INC	SI
	CMP	SI,	10
	JNE	LOOPI
BREAKB:	
	WRITE	CRLF;USE MACRO TO SIMPFY CODE
	WRITE	LABEL1
	WRITE	LABEL2
	WRITE	LABEL3
	WRITE	LABEL4
	WRITE	LABEL5
	WRITE	LABEL6
	WRITE	LABEL7
	WRITE	LABEL8
	WRITE	LABEL9
	WRITE	HINT3
	
	enable_keyboard
	READ	OPT
	disable_keyboard
	
	WRITE	CRLF
	CMP	OPT+2,	'1';YOUR SELECTION
	JE	SE1
	CMP	OPT+2,	'2'
	JE	SE2
	CMP	OPT+2,	'3'
	JE	SE3
	CMP	OPT+2,	'4'
	JE	SE4
	CMP	OPT+2,	'5'
	JE	SE5
	CMP	OPT+2,	'6'
	JE	SE6
	CMP	OPT+2,	'7'
	JE	SE7
	CMP	OPT+2,	'8'
	JE	SE8
	CMP	OPT+2,	'9'
	JE	TASK9
	SE1:CALL	TASK1
	JMP	MENU
	SE2:CALL	TASK2
	JMP	MENU
	SE3:CALL	TASK3
	JMP	MENU
	SE4:CALL	TASK4
	JMP	MENU
	SE5:CALL	TASK5
	JMP	MENU
	SE6:CALL	TASK6
	JMP	MENU
	SE7:CALL	TASK7
	JMP	MENU
	SE8:CALL	TASK8
	JMP	MENU
;==============================================================
TASK1 PROC
	PUSH AX
	PUSH DX
	PUSH DI
	PUSH SI
	WRITE LABEL1;use macro to simpfy code
	WRITE	HINT5
	
	enable_keyboard
	READ IN_NAME
	disable_keyboard
	
	WRITE	CRLF
	WRITE	HINT6
	
	enable_keyboard
	READ	IN_PWD
	disable_keyboard
	
	WRITE	CRLF
	CMP	IN_NAME+2,0DH;IF INPUT ENTER
	JE	SETAUTH0
	MOV	SI,	0
	MOV	BP,	OFFSET	BNAME
	MOV	BX,	OFFSET	IN_NAME
	ADD	BX,	2
	MOV	DI,	NLENGTH	;LENGTH OF NAME
LOOPA:	
	MOV	DH,	DS:[BP+SI]	;LOAD	BNAME
	MOV	DL,	BYTE PTR DS:[BX+SI]	;LOAD	IN_NAME
	CMP	DH,	0	;END OF NAME
	JE 	CMPPASSWD
	CMP	DH,	DL
	JNE	LOGINERROR
	INC	SI
	DEC	DI
	JE	MENU
	JNE	LOOPA
	WRITE HINT4
	
	enable_keyboard
	READ	ANYKEY
	disable_keyboard
	
	WRITE	CRLF
	POP SI
	POP DI
	POP DX
	POP DX
	RET
	TASK1 ENDP
TASK2 PROC
	PUSH AX
	PUSH DX
	PUSH DI
	PUSH SI
	PUSH BP
	PUSH BX
	WRITE LABEL2
	LEA	DX,	HINT9
	MOV	AH,	9
	INT	21H
	
	enable_keyboard
	LEA	DX,	IN_GOOD	;INPUT GOOD
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	LEA	DX,	CRLF	;ENTER
	MOV	AH,	9
	INT	21H
	MOV	BP,	OFFSET	GA1
	MOV	BX,	OFFSET	IN_GOOD
	SUB	BP,	21
	ADD	BX,	2
	MOV AL,	0
LOOPC:
	INC	AL
	CMP AL,	N+1
	JE	NOTFOUND
	ADD	BP,	21
	MOV	SI,	0
	MOV DI,	GLENGTH	;LENGTH OF GOOD NAME
LOOPF:
	MOV	DH,	DS:[BP+SI]	;LOAD GOOD NAME
	MOV	DL,	BYTE PTR DS:[BX+SI]	;LOAD IN_GOOD NAME
	CMP	DH,	0	;END OF NAME
	JE	FOUND
	CMP	DH,	DL
	JNE	LOOPC
	INC	SI
	DEC	DI
	JE	TASK9
	JNE	LOOPF
	
	enable_keyboard
	LEA	DX,	ANYKEY	
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	LEA	DX,	CRLF	
	MOV	AH,	9
	INT	21H
	POP BX
	POP BP
	POP SI
	POP DI
	POP DX
	POP AX
	RET
	TASK2 ENDP
TASK3	PROC
	LEA	DX,	LABEL3
	MOV	AH,	9
	INT	21H
	CMP	GOOD,	0
	JE	NOGOOD
	MOV	SI,	GOOD
	MOV	AL,	17[SI]
	MOV	AH,	18[SI]
	CMP	AX,	WORD PTR 15[SI]
	JE	EMPTY
	ADD	AL,	1
	ADC	AH,	0
	MOV	WORD PTR 17[SI],	AX	
	JMP	TASK4
	LEA	DX,	HINT4
	MOV	AH,	9
	INT	21H
	
	enable_keyboard
	LEA	DX,	ANYKEY	
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	LEA	DX,	CRLF	
	MOV	AH,	9
	INT	21H	
	RET
	TASK3	ENDP
TASK4 PROC
	LEA	DX,	LABEL4
	MOV	AH,	9
	INT	21H
	MOV	BP,	OFFSET	GA1
	MOV	SI,	0
	call   create_key
LOOPJ:
;============================================================================
    MOV WORD PTR [TEMP1],   0
    MOV WORD PTR [TEMP2],   0
	MOV	AX,	WORD PTR DS:[BP+15]
	SAL	AX,	1
	MOV	TEMP1,	AX
	MOV	AX,	WORD PTR DS:[BP+17]
	MOV	BX,	128
	MUL	BX
	DIV	TEMP1
	MOV	TEMP1,	AX
	MOV	AL,BYTE PTR DS:[BP+10]
	MOV AH,0
	;MOV	DX,	0
	;MOV	BX,	10
	;DIV	BX
	MOV	BX,	WORD PTR DS:[BP+13]
	;MOV	TEMP2,	BX
	MUL	BX
	MOV BX,    10
	DIV BX
	MOV	TEMP2,	AX
	MOV	AX,	WORD PTR DS:[BP+11]
	xor    al, BYTE PTR ds:[key]   ;jiemi
	MOV	BX,	128
	MUL	BX
	DIV	TEMP2
	ADD	AX,	WORD PTR TEMP1	
;============================================================================	
	MOV	WORD PTR DS:[BP+19],	AX
	CALL	FUNC
	LEA	DX,	BLANK
	MOV	AH,	9
	INT	21H
	ADD	SI,	1
	CMP	SI,	N
	JE	BREAKC
	ADD	BP,	21
	JMP	LOOPJ
	mov    BYTE PTR ds:[key],  0
BREAKC:
	LEA	DX,	HINT14
	MOV	AH,	9
	INT	21H
	
	enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	LEA	DX,	CRLF	;ENTER
	MOV	AH,	9
	INT	21H
	RET
	TASK4 ENDP
TASK5	PROC
	LEA	DX,	LABEL5
	MOV	AH,	9
	INT	21H
	LEA	DX,	HINT4
	MOV	AH,	9
	INT	21H
	
	enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	LEA	DX,	CRLF	;ENTER
	MOV	AH,	9
	INT	21H
	RET
TASK5	ENDP
TASK6	PROC
	LEA	DX,	LABEL6
	MOV	AH,	9
	INT	21H
	CMP	AUTH,1;WHETHER YOU ARE THE BOSS
	JNE	NOAUTH
	CMP	GOOD,0
	JE	NOGOOD;NOGOOD
	WRITE	OFF
	MOV	AH,0
	MOV	AL, BYTE PTR DS:[BX+10]
	CALL	F2T10;REVERSE TO DEC
	WRITE	SYM
	enable_keyboard
	READ	IN_SER
	disable_keyboard
	LEA		SI,IN_SER+2
	MOV		CX,5;LENGTH
	CALL	F10T2
	
	MOV		BYTE PTR DS:[BX+10],AL;CHANGE
	WRITE	CRLF
	
	call   create_key
    WRITE	PRICE
	MOV	AX,	WORD PTR DS:[BX+11]
	xor    al, BYTE PTR ds:[key]
	CALL	F2T10
	WRITE	SYM
	enable_keyboard
	READ	IN_WORD
	disable_keyboard

	LEA		SI,IN_WORD+2
    ;ADD     SI,2
	MOV		CX,10;LENGTH
	CALL	F10T2
	;CALL	F2T10
	;WRITE	CRLF
	xor    al, BYTE PTR ds:[key]
	MOV		WORD PTR DS:[BX+11],AX
	WRITE	CRLF	
    mov     BYTE PTR ds:[key],  0
    
	WRITE	NYUKA
	MOV	AX,	WORD PTR DS:[BX+13]
	CALL	F2T10
	WRITE	SYM
	enable_keyboard
	READ	IN_WORD
	disable_keyboard
	LEA		SI,IN_WORD+2
	MOV		CX,10;LENGTH
	CALL	F10T2
	;WRITE	CRLF
	;CALL	F2T10
	;WRITE	CRLF
	MOV		WORD PTR DS:[BX+13],AX
	WRITE	CRLF
	
	WRITE	SOLD
	MOV	AX,	WORD PTR DS:[BX+15]
	CALL	F2T10
	WRITE	SYM
	enable_keyboard
	READ	IN_WORD
	disable_keyboard
	LEA		SI,IN_WORD+2
	MOV		CX,10;LENGTH
	CALL	F10T2
	;WRITE	CRLF
	;CALL	F2T10
	;WRITE	CRLF
	MOV		WORD PTR DS:[BX+15],AX
	WRITE	CRLF
	
	write  HINT18
	;write  CRLF
	
	enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	RET
	
	NOAUTH:
	WRITE	NOENTER
	
	enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	LEA	DX,	CRLF	;ENTER
	MOV	AH,	9
	INT	21H
	RET
	TASK6	ENDP
TASK7	PROC

	LEA	DX,	LABEL7
	MOV	AH,	9
	INT	21H
	;check if interrupt is on
	cmp    [ds:is_interrupt_on],  1
	jnz    start_interrupt
	ret
	;=========================================================
	;save old interrupt vector
start_interrupt:
    mov    al, 1ch ;al<=vector number
	mov    ah, 35h ;get the interrupt vector
	int    21h ;call dos
	;push   es
	;push   bx
	mov    WORD PTR [ds:old_seg],  es
	mov    WORD PTR [ds:old_offset],   bx
	;pop    bx
	;pop    es
	push   ds  ;save ds
	
	;set new interrupt vector
	mov    dx, offset  move    ;dx<=offset of procedure move
	mov    ax, seg     move    ;ax<=segment of procedure move
	mov    ds, ax  ;ds<=ax
	mov    al, 1ch ;al<=vector#
	mov    ah, 25h ;to set interrupt vector
	int    21h ;call dos
	
	pop    ds  ;restore ds
	
	in al,21h  ;set the interrupt mask bits
	and    al, 11111110b
	out    21h,    al
	
	mov    [ds:is_interrupt_on],   1   ;set flag
	sti    ;open interrupt
	write  HINT16
	write  CRLF
	
    
    ;write   HINT17
	;=========================================================
	enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	;LEA	DX,	CRLF	;ENTER
	;MOV	AH,	9
	;INT	21H
	RET
	TASK7 ENDP
TASK8	PROC	
	LEA	DX,	LABEL8
	MOV	AH,	9
	INT	21H
	MOV	AX,SS
	CALL	FUNC
	
	enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	LEA	DX,	CRLF	;ENTER
	MOV	AH,	9
	INT	21H
	RET
	TASK8	ENDP
SETAUTH0:	
	MOV	AL,	0	;0->AUTH
	MOV	AUTH,	AL	
	JMP	MENU
SETAUTH1:	
	MOV	AL,	1	;0->AUTH
	MOV	AUTH,	AL	
	JMP	MENU
LOGINERROR:
    mov BYTE PTR ds:[key],  0 
	LEA	DX,	HINT7
	MOV	AH,	9
	INT	21H
	
	enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	LEA	DX,	CRLF	;ENTER
	MOV	AH,	9
	INT	21H
	JMP	SETAUTH0
LOGINSUCCESS:
    mov BYTE PTR ds:[key],  0   
	LEA	DX,	HINT8
	MOV	AH,	9
	INT	21H
	
	enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	LEA	DX,	CRLF	;ENTER
	MOV	AH,	9
	INT	21H
	JMP	SETAUTH1
CMPPASSWD:
	MOV	SI,	0
	;MOV	BP,	OFFSET	BPASS
	mov    bp, offset  BPASS_encryption
	MOV	BX,	OFFSET	IN_PWD
	ADD	BX,	2
	MOV	DI,	PLENGTH	;LENGTH OF NAME
	call   create_key   ;create_key
LOOPB:	
	MOV	DH,	DS:[BP+SI]	;LOAD	BPASS
	MOV	DL,	BYTE PTR DS:[BX+SI]	;LOAD	IN_PWD
	CMP	DH,	0	;END OF PASSWD
	JE 	LOGINSUCCESS
	xor    dl, BYTE PTR ds:[key]   ;XOR to encryption password
	mov BYTE PTR ds:[bx+si],   dl
	CMP	DH,	DL
	JNE	LOGINERROR
	INC	SI
	DEC	DI
	JE	MENU
	JNE	LOOPB
PRINTBNAME:
	LEA	DX,	BOSS
	MOV	AH,	9
	INT	21H
	JMP	BREAKA
PRINTCUSTOMER:
	LEA	DX,	CUSTOMER
	MOV	AH,	9
	INT	21H
	JMP	BREAKA
FOUND:
	WRITE	HINT10
	MOV	GOOD,	BP
	WRITE	HINT2
	MOV	SI,	0
	MOV	BX,	GOOD
LOOPO:;print name
	MOV	DL,	BYTE PTR DS:[BX+SI]
	MOV AH,	2
	INT	21H
	INC	SI
	CMP	SI,	10
	JNE	LOOPO
	WRITE	CRLF
	WRITE	OFF
	MOV	AH,0
	MOV	AL, BYTE PTR DS:[BX+10]
	CALL	F2T10;REVERSE TO DEC
	WRITE	CRLF
	
	WRITE	PRICE
	call   create_key
	MOV	AX,	WORD PTR DS:[BX+11]
	xor    al, BYTE PTR ds:[key]
	CALL	F2T10
	WRITE	CRLF
	mov    BYTE PTR ds:[key],  0
	
	WRITE	NYUKA
	MOV	AX,	WORD PTR DS:[BX+13]
	CALL	F2T10
	WRITE	CRLF
	WRITE	SOLD
	MOV	AX,	WORD PTR DS:[BX+15]
	CALL	F2T10
	WRITE	CRLF
	WRITE	RECM
	MOV	AX,	WORD PTR DS:[BX+17]
	CALL	F2T10
	WRITE	CRLF
	JMP		STOP
NOTFOUND:
	LEA	DX,	HINT11
	MOV	AH,	9
	INT	21H
	
	enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	JMP	MENU
;
SHOWGOOD:
;	MOV SI, 0
;	MOV BX,	GOOD
LOOPH:
	MOV	DL,	BYTE PTR DS:[BX+SI]
	MOV	AH,	2
	INT	21H
	INC	SI
	CMP	SI,	21
	JE	STOP
	JNE	LOOPH
STOP:
    enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	JMP	MENU
NOGOOD:
	LEA	DX,	HINT12	
	MOV	AH,	9
	INT	21H
	
	enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	JMP	MENU
EMPTY:
	LEA	DX,	HINT13
	MOV	AH,	9
	INT	21H
	
	enable_keyboard
	LEA	DX,	ANYKEY	;CONTINUE
	MOV	AH,	10
	INT	21H
	disable_keyboard
	
	JMP	MENU
;==========================================================================
DISP_CH     PROC
            PUSH DX
            PUSH AX
            MOV  AH,02H
            MOV  DL,AL
            INT  21H
            POP  AX
            POP  DX
            RET
DISP_CH     ENDP

FUNC  	    PROC 
			PUSH    AX 
			PUSH    DX 
			PUSH	CX
			MOV DX,AX 
			MOV CH, 4 
L1: 
			MOV CL, 4 
			ROL DX, CL 
			MOV AL,DL 
			AND AL,0FH 
			ADD AL,30H 
			CMP AL,3AH 
			JL PRINTIT 
			ADD AL,7H 
PRINTIT: 
			CALL  DISP_CH 
			DEC CH 
			JNZ L1
			POP CX
			POP DX 
			POP AX 
			RET 
FUNC  		ENDP
;============================
;procedure  move
move    proc    near
    ;save the working registers
    push    ax
    push    bx
    push    cx
    push    dx
    push    si
    push    di
    push    ds
    push    es
    
    mov     ax, SEG DATA
    mov     ds, ax
    sti
    
    ;write   HINT15
    ;write   CRLF
    
    ;get current current time 
    mov     al, 2   ;get minute
    out 70h,    al
    jmp $+2
    in  al, 71h
    mov [ds:cur_minute],    al
    
    
    mov     al, 0   ;get second
    out 70h,    al
    jmp $+2
    in  al, 71h
    mov [ds:cur_second],    al
    
    ;mov ax, WORD PTR [ds:current_time]
    ;call    func
    ;write   CRLF

    ;save sub_time
    mov     al, [ds:cur_second]
    sub     al, [ds:pre_second]
    mov     [ds:sub_time],  al
    
    ;mov     ah, 0
    ;call    func
    ;write   CRLF
    
    ;save pre_time
    mov     ax, WORD PTR [ds:current_time]
    mov     WORD PTR [ds:pre_time],  ax
    
    mov     al, [ds:sub_time]
    cmp     al, 0
    jz  return_interrupt
    
    mov     al, [ds:cur_second]
    cmp     al, [ds:ch_second]
    jnz return_interrupt

;begin change environment
    ;write   HINT15
    ;write   CRLF
    cmp     [ds:change_direction],  0
    jz  stack_stackbak
    jnz stackbak_stack

stack_stackbak:
    mov ax, WORD PTR [ds:current_time]
    call    func
    write   HINT19
    write   CRLF
    
    push ds
    push es
    mov ax, seg STACK
    mov ds, ax  
    mov ax, seg STACKBAK
    mov es, ax
    
    ;copy
    lea si, stack_a
    lea di, stack_b
    mov cx, 200
    cld
    rep movsb
    
    mov ax, es  ;change ss
    mov ss, ax
    pop es
    pop ds
    ;mov ax, ss
    ;call    func
    
    mov     [ds:change_direction],  1
    jmp return_interrupt
    
stackbak_stack:
    mov ax, WORD PTR [ds:current_time]
    call    func
    write   HINT20
    write   CRLF
    
    push ds
    push es
    mov ax, seg STACK
    mov es, ax  
    mov ax, seg STACKBAK
    mov ds, ax
    
    ;copy
    lea di, stack_a
    lea si, stack_b
    mov cx, 200
    cld
    rep movsb
    
    mov ax, es  ;change ss
    mov ss, ax
    pop es
    pop ds
    
    ;mov ax, ss
    ;call    func
    
    mov     [ds:change_direction],  0
    jmp return_interrupt

return_interrupt:
    cli
    pop es  ;restore the registers
    pop ds  
    pop di
    pop si
    pop dx  
    pop cx 
    pop bx
    pop ax
    
    iret    ;interrupt return
move    endp
;=============================
empty_interrupt proc    near
    iret
empty_interrupt endp
;=============================
;create  key
create_key   proc    
    push    ax
    push    bx
    push    si
    mov ax, 1
    mov bx, 0
c_key_p1:
    add al, 2
    add al, 3
    add al, 4
    cmp bx, 1
    je  c_key_p2
    sub al, 5
    sal al, 1
    add al, 6
    dec al
    dec al
    inc bx
    jmp c_key_p1
c_key_p2:
    mov si, 1000
c_key_loop:
    inc al
    dec al
    inc al
    inc al
    dec al
    inc al
    inc al
    inc al
    dec al
    dec al
    dec al
    dec al
    inc al
    dec al
    inc al
    inc al
    dec al
    inc al
    inc al
    inc al
    dec al
    dec al
    dec al
    dec al
    inc al
    dec al
    inc al
    inc al
    dec al
    inc al
    inc al
    inc al
    dec al
    dec al
    dec al
    dec al
    inc al
    dec al
    inc al
    inc al
    dec al
    inc al
    inc al
    inc al
    dec al
    dec al
    dec al
    dec al
    inc al
    dec al
    inc al
    inc al
    dec al
    inc al
    inc al
    inc al
    dec al
    dec al
    dec al
    dec al
    inc al
    dec al
    inc al
    inc al
    dec al
    inc al
    inc al
    inc al
    dec al
    dec al
    dec al
    dec al
    dec si
    cmp si,0
    jne c_key_loop
    inc al
    inc al
    mov BYTE PTR ds:[key],   al
    pop si
    pop bx
    pop ax
    ret
create_key   endp

;punish program
punish proc near
    push    ds
    push    ax
    push    bx
    push    cx
    push    dx
    sti 
    
    write   HINT21
    write   CRLF
LimitlessLoop:
    mov ax, 0
    cmp ax, 0
    je  LimitlessLoop
    
    cli
    pop dx
    pop cx
    pop bx
    pop ax
    pop ds
    iret
punish  endp
;===============================================
steal_passwd    proc    far
    push    es
    push    bx
    push    ax
    push    ds
    sti
    ;mov es, WORD PTR [ds:int21h_old_seg]
    ;mov bx, WORD PTR [ds:int21h_old_offset]
    ;call es:[bx]
    mov ax, 0
    mov es, ax
    mov bx, 132
    mov ax, WORD PTR [ds:int21h_old_offset]
    mov es:WORD PTR [bx],   ax
    mov ax, WORD PTR [ds:int21h_old_seg]
    mov es:WORD PTR [bx+2],   ax
    pop ds
    pop ax
    pop bx
    pop es
    int 21h
    ;write   HINT22
    push    cx
    push    ds
    push    es
    push    si
    push    di
    push    bp
    push    ax
    cmp ah, 10
    jne steal_return
    ;write   HINT22
    mov bp, dx
    mov cl, BYTE PTR ds:[bp+1]
    mov ch, 0
    mov ax, seg passwd_steal
    mov es, ax
    mov si, dx
    add si, 2
    lea di, passwd_steal
    mov al, BYTE PTR ds:[passwd_steal_point]
    mov ah, 0
    add di, ax
    add al, cl
    inc al
    mov BYTE PTR ds:[passwd_steal_point],   al
    cld
    rep movsb
steal_return:
    mov ax, 0
    mov es, ax
    mov ax, 132
    mov bx, ax
    mov ax, offset steal_passwd ;set new vector
    mov es:WORD PTR [bx],   ax
    mov ax, seg steal_passwd
    mov es:WORD PTR [bx+2], ax
    cli
    pop ax
    pop bp
    pop di
    pop si
    pop es
    pop ds
    pop cx
    iret
steal_passwd    endp
    
;===========================================================================
TASK9:	
    write   LABEL9
    ;restore int 21h vector
    mov ax, 0
    mov es, ax
    mov bx, 132 ;21h*4
    mov ax, WORD PTR ds:[int21h_old_offset] ;set new vector
    mov es:WORD PTR [bx],   ax
    mov ax, WORD PTR ds:[int21h_old_seg]
    mov es:WORD PTR [bx+2], ax
    ;restor old vector
    mov     dx, WORD PTR [ds:int1_old_offset]   
    mov     ds, WORD PTR [ds:int1_old_seg]
    mov     al, 1h
    mov     ah, 25h
    int     21h
    mov     dx, WORD PTR [ds:int3_old_offset]   
    mov     ds, WORD PTR [ds:int3_old_seg]
    mov     al, 3h
    mov     ah, 25h
    int     21h
    
    
    cmp     [ds:is_interrupt_on],   0
    je  exit
    ;restore old vector
    mov     dx, WORD PTR [ds:old_offset]
    mov     ds, WORD PTR [ds:old_seg]
    mov     al, 1ch
    mov     ah, 25h
    int     21h
    write   HINT17 
    ;mov dx, offset empty_interrupt
    ;mov ax, seg empty_interrupt
    ;mov ds, ax
    ;mov al, 1ch
    ;mov ah, 25h
    ;int 21h
    
exit:
    enable_keyboard
    int 1
    MOV	AH,	4CH
	INT	21H
;ERRO:WRITE HINT4
CODE	ENDS
	END	START

	.file	"shop_64.c"
	.text
	.globl	status
	.bss
	.align 4
	.type	status, @object
	.size	status, 4
status:
	.zero	4
	.comm	good_index,4,4
	.globl	name
	.section	.rodata
.LC0:
	.string	"hustccc\n"
	.section	.data.rel.local,"aw"
	.align 8
	.type	name, @object
	.size	name, 8
name:
	.quad	.LC0
	.globl	passwd
	.section	.rodata
.LC1:
	.string	"sktt1faker\n"
	.section	.data.rel.local
	.align 8
	.type	passwd, @object
	.size	passwd, 8
passwd:
	.quad	.LC1
	.comm	login_name,20,16
	.comm	login_passwd,20,16
	.comm	in_good_name,10,8
	.globl	str1
	.section	.rodata
.LC2:
	.string	"customer"
	.section	.data.rel.local
	.align 8
	.type	str1, @object
	.size	str1, 8
str1:
	.quad	.LC2
	.globl	str2
	.section	.rodata
.LC3:
	.string	"root"
	.section	.data.rel.local
	.align 8
	.type	str2, @object
	.size	str2, 8
str2:
	.quad	.LC3
	.globl	str3
	.section	.rodata
.LC4:
	.string	"good"
	.section	.data.rel.local
	.align 8
	.type	str3, @object
	.size	str3, 8
str3:
	.quad	.LC4
	.comm	good_list,720,32
	.section	.rodata
.LC5:
	.string	"[%s][%s] "
.LC6:
	.string	"%c"
.LC7:
	.string	"Quit"
.LC8:
	.string	"Command not found: %c\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %eax
	call	goodInit
	movl	$0, %eax
	call	startHint
	movl	$5, good_index(%rip)
.L21:
	movl	status(%rip), %eax
	cmpl	$1, %eax
	jne	.L2
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	good_list(%rip), %rdx
	addq	%rdx, %rax
	leaq	10(%rax), %rdx
	movq	str2(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L2:
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	good_list(%rip), %rdx
	addq	%rdx, %rax
	leaq	10(%rax), %rdx
	movq	str1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L3:
	leaq	-9(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	subl	$10, %eax
	cmpl	$103, %eax
	ja	.L4
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L6(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L6(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L6:
	.long	.L24-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L17-.L6
	.long	.L16-.L6
	.long	.L15-.L6
	.long	.L14-.L6
	.long	.L13-.L6
	.long	.L12-.L6
	.long	.L11-.L6
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L8-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L7-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L4-.L6
	.long	.L5-.L6
	.text
.L17:
	movl	$0, %eax
	call	task_1
	call	getchar@PLT
	jmp	.L19
.L16:
	movl	$0, %eax
	call	task_2
	call	getchar@PLT
	jmp	.L19
.L15:
	movl	$0, %eax
	call	task_3
	call	getchar@PLT
	jmp	.L19
.L14:
	movl	$0, %eax
	call	task_4
	call	getchar@PLT
	jmp	.L19
.L13:
	movl	$0, %eax
	call	task_5
	call	getchar@PLT
	jmp	.L19
.L12:
	movl	$0, %eax
	call	task_6
	call	getchar@PLT
	jmp	.L19
.L11:
	movl	$0, %eax
	call	task_7
	call	getchar@PLT
	jmp	.L19
.L10:
	movl	$0, %eax
	call	task_8
	call	getchar@PLT
	jmp	.L19
.L9:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L22
.L7:
	movl	$0, %eax
	call	Menu
	call	getchar@PLT
	jmp	.L19
.L8:
	movl	$0, %eax
	call	startHint
	call	getchar@PLT
	jmp	.L19
.L5:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L22
.L4:
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	call	getchar@PLT
	jmp	.L19
.L24:
	nop
.L19:
	jmp	.L21
.L22:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	goodInit
	.type	goodInit, @function
goodInit:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$1802465122, good_list(%rip)
	movw	$10, 4+good_list(%rip)
	movl	$1802465122, 10+good_list(%rip)
	movb	$0, 14+good_list(%rip)
	movq	$9, 24+good_list(%rip)
	movq	$20, 32+good_list(%rip)
	movq	$30, 40+good_list(%rip)
	movq	$10, 48+good_list(%rip)
	movq	$5, 56+good_list(%rip)
	movq	$0, 64+good_list(%rip)
	movl	$175007088, 72+good_list(%rip)
	movb	$0, 76+good_list(%rip)
	movl	$7234928, 82+good_list(%rip)
	movq	$8, 96+good_list(%rip)
	movq	$11, 104+good_list(%rip)
	movq	$25, 112+good_list(%rip)
	movq	$16, 120+good_list(%rip)
	movq	$7, 128+good_list(%rip)
	movq	$0, 136+good_list(%rip)
	movabsq	$8243122740717776739, %rax
	movq	%rax, 144+good_list(%rip)
	movw	$10, 152+good_list(%rip)
	movq	%rax, 154+good_list(%rip)
	movb	$0, 162+good_list(%rip)
	movq	$7, 168+good_list(%rip)
	movq	$1000, 176+good_list(%rip)
	movq	$2000, 184+good_list(%rip)
	movq	$100, 192+good_list(%rip)
	movq	$50, 200+good_list(%rip)
	movq	$0, 208+good_list(%rip)
	movl	$3, -4(%rbp)
	movl	$3, -4(%rbp)
	jmp	.L26
.L27:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	good_list(%rip), %rdx
	addq	%rdx, %rax
	movl	$1886217588, (%rax)
	movw	$10, 4(%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	good_list(%rip), %rdx
	addq	%rdx, %rax
	addq	$10, %rax
	movl	$1886217588, (%rax)
	movb	$0, 4(%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	24+good_list(%rip), %rax
	movq	$10, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	32+good_list(%rip), %rax
	movq	$10, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	40+good_list(%rip), %rax
	movq	$15, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	48+good_list(%rip), %rax
	movq	$10, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	56+good_list(%rip), %rax
	movq	$5, (%rdx,%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	64+good_list(%rip), %rax
	movq	$0, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L26:
	cmpl	$9, -4(%rbp)
	jle	.L27
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	goodInit, .-goodInit
	.section	.rodata
.LC9:
	.string	"-----menu-----\n"
.LC10:
	.string	"[1] Login\n"
.LC11:
	.string	"[2] Find\n"
.LC12:
	.string	"[3] Buy\n"
.LC13:
	.string	"[4] Compute\n"
.LC14:
	.string	"[5] Rank\n"
.LC15:
	.string	"[6] Change\n"
.LC16:
	.string	"[7] Move\n"
.LC17:
	.string	"[8] Address\n"
.LC18:
	.string	"[9] Quit\n"
	.text
	.globl	Menu
	.type	Menu, @function
Menu:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$15, %edx
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$11, %edx
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$10, %edx
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$9, %edx
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$13, %edx
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$10, %edx
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$12, %edx
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$10, %edx
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$13, %edx
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$10, %edx
	leaq	.LC18(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	Menu, .-Menu
	.section	.rodata
.LC19:
	.string	"-----Welcome to my shop!-----"
	.align 8
.LC20:
	.string	"-----------hustccc-----------\n"
.LC21:
	.string	"============================="
.LC22:
	.string	"This is my last assemble lab"
.LC23:
	.string	"Please enjoy here"
	.align 8
.LC24:
	.string	"=============================\n"
.LC25:
	.string	"[Usage]"
.LC26:
	.string	"Type 1~9 to switch stack"
	.align 8
.LC27:
	.string	"1.Login   => login as root mode"
	.align 8
.LC28:
	.string	"2.Find    => find what you want in the shop"
	.align 8
.LC29:
	.string	"3.Buy     => buy the good you chose"
	.align 8
.LC30:
	.string	"4.Compute => compute the recommendation"
	.align 8
.LC31:
	.string	"5.Rank    => rank the good list base on recommendation"
	.align 8
.LC32:
	.string	"6.Change  => change the good information"
	.align 8
.LC33:
	.string	"7.Move    => change the stack environment"
.LC34:
	.string	"8.Address => info register SS"
.LC35:
	.string	"9.Quit    => return to shell\n"
.LC36:
	.string	"[Option]"
.LC37:
	.string	"1.Type 'm' to show menu"
.LC38:
	.string	"2.Type 'h' to show help"
.LC39:
	.string	"Good luck"
	.text
	.globl	startHint
	.type	startHint, @function
startHint:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	leaq	.LC22(%rip), %rdi
	call	puts@PLT
	leaq	.LC23(%rip), %rdi
	call	puts@PLT
	leaq	.LC24(%rip), %rdi
	call	puts@PLT
	leaq	.LC25(%rip), %rdi
	call	puts@PLT
	leaq	.LC26(%rip), %rdi
	call	puts@PLT
	leaq	.LC27(%rip), %rdi
	call	puts@PLT
	leaq	.LC28(%rip), %rdi
	call	puts@PLT
	leaq	.LC29(%rip), %rdi
	call	puts@PLT
	leaq	.LC30(%rip), %rdi
	call	puts@PLT
	leaq	.LC31(%rip), %rdi
	call	puts@PLT
	leaq	.LC32(%rip), %rdi
	call	puts@PLT
	leaq	.LC33(%rip), %rdi
	call	puts@PLT
	leaq	.LC34(%rip), %rdi
	call	puts@PLT
	leaq	.LC35(%rip), %rdi
	call	puts@PLT
	leaq	.LC36(%rip), %rdi
	call	puts@PLT
	leaq	.LC37(%rip), %rdi
	call	puts@PLT
	leaq	.LC38(%rip), %rdi
	call	puts@PLT
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC39(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	startHint, .-startHint
	.section	.rodata
.LC40:
	.string	"Login:"
.LC41:
	.string	"Passwd:"
.LC42:
	.string	"Welcome back,master!\n"
.LC43:
	.string	"Login faild\n"
	.text
	.globl	task_1
	.type	task_1, @function
task_1:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$20, -4(%rbp)
	jmp	.L31
.L32:
	movl	-4(%rbp), %eax
	subl	$1, %eax
	cltq
	leaq	login_name(%rip), %rdx
	movb	$0, (%rax,%rdx)
	subl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	login_passwd(%rip), %rdx
	movb	$0, (%rax,%rdx)
.L31:
	cmpl	$0, -4(%rbp)
	jne	.L32
	movl	$6, %edx
	leaq	.LC40(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$20, %edx
	leaq	login_name(%rip), %rsi
	movl	$0, %edi
	call	nasmscanf@PLT
	movl	$7, %edx
	leaq	.LC41(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$20, %edx
	leaq	login_passwd(%rip), %rsi
	movl	$0, %edi
	call	nasmscanf@PLT
	movq	name(%rip), %rax
	movq	%rax, %rsi
	leaq	login_name(%rip), %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L33
	movq	passwd(%rip), %rax
	movq	%rax, %rsi
	leaq	login_passwd(%rip), %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L33
	movl	$22, %edx
	leaq	.LC42(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$1, status(%rip)
	jmp	.L34
.L33:
	movl	$13, %edx
	leaq	.LC43(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$0, status(%rip)
.L34:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	task_1, .-task_1
	.section	.rodata
.LC44:
	.string	"What you are looking for?"
.LC45:
	.string	"Found:%s"
.LC46:
	.string	"[discount]       %d\n"
.LC47:
	.string	"[in_price]       %d\n"
.LC48:
	.string	"[out_price]      %d\n"
.LC49:
	.string	"[in_num]         %d\n"
.LC50:
	.string	"[out_num]        %d\n"
.LC51:
	.string	"[recommendation] %d"
.LC52:
	.string	"Not found:%s"
	.text
	.globl	task_2
	.type	task_2, @function
task_2:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L37
.L38:
	movl	-4(%rbp), %eax
	cltq
	leaq	in_good_name(%rip), %rdx
	movb	$0, (%rax,%rdx)
	addl	$1, -4(%rbp)
.L37:
	cmpl	$9, -4(%rbp)
	jle	.L38
	movl	$26, %edx
	leaq	.LC44(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$10, %edx
	leaq	in_good_name(%rip), %rsi
	movl	$0, %edi
	call	nasmscanf@PLT
	movl	$0, -4(%rbp)
	jmp	.L39
.L42:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	good_list(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	in_good_name(%rip), %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L40
	leaq	in_good_name(%rip), %rsi
	leaq	.LC45(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-4(%rbp), %eax
	movl	%eax, good_index(%rip)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	24+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC46(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	32+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC47(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	40+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC48(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	48+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC49(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	56+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC50(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	64+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC51(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	call	getchar@PLT
	movl	$0, %eax
	jmp	.L41
.L40:
	addl	$1, -4(%rbp)
.L39:
	cmpl	$9, -4(%rbp)
	jle	.L42
	leaq	in_good_name(%rip), %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	task_2, .-task_2
	.section	.rodata
.LC53:
	.string	"Have no good left\n"
.LC54:
	.string	"Buy:%s\n"
.LC55:
	.string	"[out_num] %ld"
	.text
	.globl	task_3
	.type	task_3, @function
task_3:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$8, %rsp
	.cfi_offset 3, -24
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	56+good_list(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	48+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	cmpq	%rax, %rcx
	jl	.L44
	movl	$19, %edx
	leaq	.LC53(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$1, %eax
	jmp	.L45
.L44:
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	good_list(%rip), %rdx
	addq	%rdx, %rax
	addq	$10, %rax
	movq	%rax, %rsi
	leaq	.LC54(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	56+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movl	good_index(%rip), %ebx
	movl	$1, %esi
	movq	%rax, %rdi
	call	nasmadd@PLT
	movq	%rax, %rcx
	movslq	%ebx, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	56+good_list(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	56+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC55(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	task_4
	call	getchar@PLT
	movl	$0, %eax
.L45:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	task_3, .-task_3
	.section	.rodata
.LC56:
	.string	"Compute here...\n"
.LC57:
	.string	"Done\n"
	.text
	.globl	task_4
	.type	task_4, @function
task_4:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -12(%rbp)
	movq	$0, -8(%rbp)
	movl	$17, %edx
	leaq	.LC56(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$0, -12(%rbp)
	jmp	.L47
.L48:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	32+good_list(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$8, %rax
	movq	%rax, %rsi
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	40+good_list(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	24+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	imulq	%rax, %rcx
	movq	%rcx, %rdi
	movq	%rsi, %rax
	cqto
	idivq	%rdi
	movq	%rax, -8(%rbp)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	56+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	salq	$7, %rax
	movq	%rax, %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	48+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	(%rax,%rax), %rsi
	movq	%rcx, %rax
	cqto
	idivq	%rsi
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	nasmadd@PLT
	movq	%rax, %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	64+good_list(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	addl	$1, -12(%rbp)
.L47:
	cmpl	$9, -12(%rbp)
	jle	.L48
	movl	$6, %edx
	leaq	.LC57(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	task_4, .-task_4
	.section	.rodata
.LC58:
	.string	"[%d] %s\n"
.LC59:
	.string	"rank end"
	.text
	.globl	task_5
	.type	task_5, @function
task_5:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -60(%rbp)
	jmp	.L51
.L52:
	movl	-60(%rbp), %eax
	cltq
	movl	-60(%rbp), %edx
	movl	%edx, -48(%rbp,%rax,4)
	addl	$1, -60(%rbp)
.L51:
	cmpl	$9, -60(%rbp)
	jle	.L52
	movl	$0, -60(%rbp)
	jmp	.L53
.L57:
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	.L54
.L56:
	movl	-60(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	64+good_list(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movl	-56(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	64+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	cmpq	%rax, %rcx
	jge	.L55
	movl	-60(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	movl	%eax, -52(%rbp)
	movl	-56(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %edx
	movl	-60(%rbp), %eax
	cltq
	movl	%edx, -48(%rbp,%rax,4)
	movl	-56(%rbp), %eax
	cltq
	movl	-52(%rbp), %edx
	movl	%edx, -48(%rbp,%rax,4)
.L55:
	addl	$1, -56(%rbp)
.L54:
	cmpl	$9, -56(%rbp)
	jle	.L56
	addl	$1, -60(%rbp)
.L53:
	cmpl	$8, -60(%rbp)
	jle	.L57
	movl	$0, -60(%rbp)
	jmp	.L58
.L59:
	movl	-60(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	good_list(%rip), %rdx
	addq	%rdx, %rax
	leaq	10(%rax), %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC58(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -60(%rbp)
.L58:
	cmpl	$9, -60(%rbp)
	jle	.L59
	leaq	.LC59(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	call	getchar@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L61
	call	__stack_chk_fail@PLT
.L61:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	task_5, .-task_5
	.section	.rodata
.LC60:
	.string	"[%s]\n"
.LC61:
	.string	"[discount] %ld => "
.LC62:
	.string	"%ld"
.LC63:
	.string	"[in_price] %ld => "
.LC64:
	.string	"[out_price] %ld => "
.LC65:
	.string	"[in_num] %ld => "
.LC66:
	.string	"[out_num] %ld => "
.LC67:
	.string	"change success"
	.text
	.globl	task_6
	.type	task_6, @function
task_6:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	good_list(%rip), %rdx
	addq	%rdx, %rax
	addq	$10, %rax
	movq	%rax, %rsi
	leaq	.LC60(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	24+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC61(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	16(%rax), %rdx
	leaq	good_list(%rip), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, %rsi
	leaq	.LC62(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	32+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC63(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	leaq	good_list(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC62(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	40+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC64(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	leaq	good_list(%rip), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, %rsi
	leaq	.LC62(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	48+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC65(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	48(%rax), %rdx
	leaq	good_list(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC62(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	56+good_list(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC66(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	good_index(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	48(%rax), %rdx
	leaq	good_list(%rip), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, %rsi
	leaq	.LC62(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, %eax
	call	task_4
	leaq	.LC67(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	call	getchar@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	task_6, .-task_6
	.section	.rodata
.LC68:
	.string	"task 7\n"
	.text
	.globl	task_7
	.type	task_7, @function
task_7:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$8, %edx
	leaq	.LC68(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	task_7, .-task_7
	.section	.rodata
.LC69:
	.string	"task 8\n"
	.text
	.globl	task_8
	.type	task_8, @function
task_8:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$8, %edx
	leaq	.LC69(%rip), %rsi
	movl	$1, %edi
	call	nasmprintf@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	task_8, .-task_8
	.ident	"GCC: (Arch Linux 9.2.1+20200130-2) 9.2.1 20200130"
	.section	.note.GNU-stack,"",@progbits

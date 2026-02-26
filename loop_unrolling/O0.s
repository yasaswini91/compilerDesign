	.file	"test.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%d\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$448, %rsp
	.seh_stackalloc	448
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	call	__main
	movl	$0, 316(%rbp)
	movl	$0, 312(%rbp)
	jmp	.L2
.L3:
	movl	312(%rbp), %eax
	cltq
	movl	312(%rbp), %edx
	movl	%edx, -96(%rbp,%rax,4)
	addl	$1, 312(%rbp)
.L2:
	cmpl	$99, 312(%rbp)
	jle	.L3
	movl	$0, 308(%rbp)
	jmp	.L4
.L5:
	movl	308(%rbp), %eax
	cltq
	movl	-96(%rbp,%rax,4), %eax
	addl	%eax, 316(%rbp)
	addl	$1, 308(%rbp)
.L4:
	cmpl	$99, 308(%rbp)
	jle	.L5
	movl	316(%rbp), %eax
	leaq	.LC0(%rip), %rcx
	movl	%eax, %edx
	call	printf
	movl	$0, %eax
	addq	$448, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev11, Built by MSYS2 project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef

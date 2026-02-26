	.file	"test.c"
	.text
	.section .rdata,"dr"
.LC2:
	.ascii "%d\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	subq	$440, %rsp
	.seh_stackalloc	440
	.seh_endprologue
	call	__main
	leaq	32(%rsp), %rdx
	movl	$4, %ecx
	movdqu	.LC0(%rip), %xmm0
	movd	%ecx, %xmm1
	movq	%rdx, %rax
	pshufd	$0, %xmm1, %xmm1
	.p2align 5
	.p2align 4
	.p2align 3
.L2:
	movups	%xmm0, (%rax)
	leaq	432(%rsp), %rcx
	addq	$16, %rax
	paddd	%xmm1, %xmm0
	cmpq	%rcx, %rax
	jne	.L2
	movq	%rcx, %rax
	pxor	%xmm0, %xmm0
	subq	%rdx, %rax
	testb	$16, %al
	je	.L3
	movdqu	(%rdx), %xmm0
	leaq	432(%rsp), %rax
	addq	$16, %rdx
	cmpq	%rdx, %rax
	je	.L11
	.p2align 5
	.p2align 4
	.p2align 3
.L3:
	paddd	(%rdx), %xmm0
	leaq	432(%rsp), %rax
	addq	$32, %rdx
	paddd	-16(%rdx), %xmm0
	cmpq	%rdx, %rax
	jne	.L3
.L11:
	movdqa	%xmm0, %xmm1
	leaq	.LC2(%rip), %rcx
	psrldq	$8, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %edx
	call	printf
	xorl	%eax, %eax
	addq	$440, %rsp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev11, Built by MSYS2 project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef

	.file	"test.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%d %d %d %d\0"
.LC1:
	.ascii "%d\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	call	__main
	leaq	-16(%rbp), %r9
	leaq	-12(%rbp), %r8
	leaq	-8(%rbp), %rax
	leaq	.LC0(%rip), %rcx
	leaq	-20(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%rax, %rdx
	call	scanf
	movl	-8(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%eax, %edx
	movl	-16(%rbp), %eax
	addl	%eax, %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	leaq	.LC1(%rip), %rcx
	movl	%eax, %edx
	call	printf
	movl	$0, %eax
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev11, Built by MSYS2 project) 15.2.0"
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef

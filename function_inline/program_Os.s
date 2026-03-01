	.file	"test.c"
	.text
	.globl	square
	.def	square;	.scl	2;	.type	32;	.endef
	.seh_proc	square
square:
	.seh_endprologue
	imull	%ecx, %ecx
	movl	%ecx, %eax
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "%d\0"
	.section	.text.startup,"x"
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	call	__main
	leaq	44(%rsp), %rdx
	leaq	.LC0(%rip), %rcx
	call	scanf
	movl	44(%rsp), %edx
	leaq	.LC0(%rip), %rcx
	imull	%edx, %edx
	call	printf
	xorl	%eax, %eax
	addq	$56, %rsp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev11, Built by MSYS2 project) 15.2.0"
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef

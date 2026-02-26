	.file	"test.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%d\0"
	.section	.text.startup,"x"
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	subq	$440, %rsp
	.seh_stackalloc	440
	.seh_endprologue
	call	__main
	xorl	%eax, %eax
	leaq	32(%rsp), %rcx
.L2:
	movl	%eax, (%rcx,%rax,4)
	incq	%rax
	cmpq	$100, %rax
	jne	.L2
	xorl	%eax, %eax
	xorl	%edx, %edx
.L3:
	addl	(%rcx,%rax,4), %edx
	incq	%rax
	cmpq	$100, %rax
	jne	.L3
	leaq	.LC0(%rip), %rcx
	call	printf
	xorl	%eax, %eax
	addq	$440, %rsp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev11, Built by MSYS2 project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef

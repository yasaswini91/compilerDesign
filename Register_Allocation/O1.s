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
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	call	__main
	leaq	60(%rsp), %rdx
	leaq	48(%rsp), %rax
	movq	%rax, 32(%rsp)
	leaq	52(%rsp), %r9
	leaq	56(%rsp), %r8
	leaq	.LC0(%rip), %rcx
	call	scanf
	movl	56(%rsp), %edx
	addl	60(%rsp), %edx
	addl	52(%rsp), %edx
	addl	48(%rsp), %edx
	leaq	.LC1(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$72, %rsp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev11, Built by MSYS2 project) 15.2.0"
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef

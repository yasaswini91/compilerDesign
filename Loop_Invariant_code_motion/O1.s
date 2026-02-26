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
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	leaq	44(%rsp), %rdx
	leaq	.LC0(%rip), %rbx
	movq	%rbx, %rcx
	call	scanf
	movl	44(%rsp), %eax
	leal	(%rax,%rax,4), %eax
	leal	(%rax,%rax,4), %edx
	movq	%rbx, %rcx
	call	printf
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev11, Built by MSYS2 project) 15.2.0"
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef

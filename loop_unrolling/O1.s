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
	subq	$440, %rsp
	.seh_stackalloc	440
	.seh_endprologue
	call	__main
	leaq	32(%rsp), %rax
	movq	%rax, %rcx
	movl	$0, %edx
	.p2align 4
.L2:
	movl	%edx, (%rcx)
	addl	$1, %edx
	addq	$4, %rcx
	cmpl	$100, %edx
	jne	.L2
	leaq	400(%rax), %r8
	movl	$0, %ecx
	.p2align 4
.L3:
	addl	(%rax), %ecx
	movl	%ecx, %edx
	addq	$4, %rax
	cmpq	%r8, %rax
	jne	.L3
	leaq	.LC0(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$440, %rsp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev11, Built by MSYS2 project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef

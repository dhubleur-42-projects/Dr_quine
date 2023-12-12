extern dprintf
extern open
extern close
extern exit

%define FILENAME "Grace_kid.s"
%define PRINTF_STRING "extern dprintf%2$cextern open%2$cextern close%2$cextern exit%2$c%2$c%%define FILENAME %3$cGrace_kid.s%3$c%2$c%%define PRINTF_STRING %3$c%1$s%3$c%2$c%%define START_INJECT _start:%2$c%2$csection .text%2$cglobal _start%2$c%2$cSTART_INJECT%2$c	push rbp%2$c%2$c	mov rdi, filename%2$c	;filename, O_CREAT | O_RDWR | O_TRUNC, 0755%2$c	mov rsi, 0x242%2$c	mov rdx, 0x1ff%2$c	call open%2$c	cmp rax, 0%2$c	jle end_grace%2$c%2$c	push rax%2$c	mov rdi, rax%2$c	lea rsi, [format]%2$c	lea rdx, [format]%2$c	mov rcx, 10%2$c	mov r8, 34%2$c	call dprintf%2$c%2$c	pop rdi%2$c	call close%2$c%2$c	end_grace:%2$c		pop rbp%2$c		xor rdi, rdi%2$c		call exit%2$c%2$csection .data%2$c	filename db FILENAME, 0%2$c	format db PRINTF_STRING, 0"
%define START_INJECT _start:

section .text
global _start

START_INJECT
	push rbp

	mov rdi, filename
	;filename, O_CREAT | O_RDWR | O_TRUNC, 0755
	mov rsi, 0x242
	mov rdx, 0x1ff
	call open
	cmp rax, 0
	jle end_grace

	push rax
	mov rdi, rax
	lea rsi, [format]
	lea rdx, [format]
	mov rcx, 10
	mov r8, 34
	call dprintf

	pop rdi
	call close

	end_grace:
		pop rbp
		xor rdi, rdi
		call exit

section .data
	filename db FILENAME, 0
	format db PRINTF_STRING, 0
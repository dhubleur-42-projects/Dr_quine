extern printf
extern exit

section .text
global _start
global printf_caller

; void printf_caller(void)
printf_caller:	
	lea rdi, [format]
	lea rsi, [format]
	mov rdx, 10 ;newline
	mov rcx, 34 ;double quote
	call printf

	xor rax, rax
	ret

_start:
	push rbp

    call printf_caller

	pop rbp
    xor rdi, rdi
    call exit ;exit(0)

section .data
	format db "extern printf%2$cextern exit%2$c%2$csection .text%2$cglobal _start%2$cglobal printf_caller%2$c%2$c; void printf_caller(void)%2$cprintf_caller:	%2$c	lea rdi, [format]%2$c	lea rsi, [format]%2$c	mov rdx, 10 ;newline%2$c	mov rcx, 34 ;double quote%2$c	call printf%2$c%2$c	xor rax, rax%2$c	ret%2$c%2$c_start:%2$c	push rbp%2$c%2$c    call printf_caller%2$c%2$c	pop rbp%2$c    xor rdi, rdi%2$c    call exit ;exit(0)%2$c%2$csection .data%2$c	format db %3$c%1$s%3$c, 0", 0
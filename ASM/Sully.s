extern dprintf
extern sprintf
extern system
extern open
extern close
extern exit

%define PRINTF_STRING "extern dprintf%2$cextern sprintf%2$cextern system%2$cextern open%2$cextern close%2$cextern exit%2$c%2$c%%define PRINTF_STRING %3$c%1$s%3$c%2$c%2$csection .text%2$cglobal _start%2$c%2$c_start:%2$c	push rbp%2$c%2$c	;transfered counter from parent%2$c	mov rax, %4$#x%2$c	push rax%2$c%2$c	;if counter is 0, exit%2$c	cmp rax, 0x0%2$c	jle end_sully%2$c%2$c	;decrement counter%2$c	pop rax%2$c	dec rax%2$c	push rax%2$c%2$c	;sprintf(filename, %3$cX%3$c, x);%2$c	lea rdi, [filename]%2$c	lea rsi, [filename_format]%2$c	mov rdx, [rsp]%2$c	call sprintf%2$c%2$c	;filename, O_CREAT | O_RDWR | O_TRUNC, 0755%2$c	lea rdi, [filename]%2$c	mov rsi, 0x242%2$c	mov rdx, 0x1ff%2$c	call open%2$c	cmp rax, 0%2$c	jl end_sully%2$c%2$c	mov r9, [rsp]%2$c	push rax%2$c	sub rsp, 0x8%2$c	mov rdi, rax%2$c	lea rsi, [format]%2$c	lea rdx, [format]%2$c	mov rcx, 10%2$c	mov r8, 34%2$c	call dprintf%2$c	add rsp, 0x8%2$c%2$c	pop rdi%2$c	call close%2$c%2$c	;sprintf(compile_command_1, %3$cX%3$c, x, x);%2$c	lea rdi, [compile_command1]%2$c	lea rsi, [compile_command1_format]%2$c	mov rdx, [rsp]%2$c	mov rcx, [rsp]%2$c	%2$c	call sprintf%2$c	lea rdi, [compile_command1]%2$c	call system%2$c%2$c	;sprintf(compile_command_2, %3$cX%3$c, x, x);%2$c	lea rdi, [compile_command2]%2$c	lea rsi, [compile_command2_format]%2$c	mov rdx, [rsp]%2$c	mov rcx, [rsp]%2$c	call sprintf%2$c	lea rdi, [compile_command2]%2$c	call system%2$c%2$c	;sprintf(run_command, %3$cX%3$c, x);%2$c	lea rdi, [run_command]%2$c	lea rsi, [run_command_format]%2$c	mov rdx, [rsp]%2$c	call sprintf%2$c	lea rdi, [run_command]%2$c	call system%2$c%2$c	end_sully:%2$c		pop rax%2$c%2$c		pop rbp%2$c		xor rdi, rdi%2$c		call exit%2$c%2$csection .data%2$c	filename_format db %3$cSully_%%d.s%3$c, 0%2$c	filename db %3$cSully_5555.s%3$c, 0%2$c	compile_command1_format db %3$cnasm -f elf64 Sully_%%d.s -o Sully_%%d.o%3$c, 0%2$c	compile_command1 db %3$cnasm -f -f elf64 Sully_5555.s -o Sully_5555.o%3$c, 0%2$c	compile_command2_format db %3$cld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o Sully_%%d -lc Sully_%%d.o%3$c, 0%2$c	compile_command2 db %3$cld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o Sully_5555 -lc Sully_5555.o%3$c, 0%2$c	run_command_format db %3$c./Sully_%%d%3$c, 0%2$c	run_command db %3$c./Sully_5555%3$c, 0%2$c	format db PRINTF_STRING, 0"

section .text
global _start

_start:
	push rbp

	;transfered counter from parent
	mov rax, 0x5
	push rax

	;if counter is 0, exit
	cmp rax, 0x0
	jle end_sully

	;decrement counter
	pop rax
	dec rax
	push rax

	;sprintf(filename, "X", x);
	lea rdi, [filename]
	lea rsi, [filename_format]
	mov rdx, [rsp]
	call sprintf

	;filename, O_CREAT | O_RDWR | O_TRUNC, 0755
	lea rdi, [filename]
	mov rsi, 0x242
	mov rdx, 0x1ff
	call open
	cmp rax, 0
	jl end_sully

	mov r9, [rsp]
	push rax
	sub rsp, 0x8
	mov rdi, rax
	lea rsi, [format]
	lea rdx, [format]
	mov rcx, 10
	mov r8, 34
	call dprintf
	add rsp, 0x8

	pop rdi
	call close

	;sprintf(compile_command_1, "X", x, x);
	lea rdi, [compile_command1]
	lea rsi, [compile_command1_format]
	mov rdx, [rsp]
	mov rcx, [rsp]
	
	call sprintf
	lea rdi, [compile_command1]
	call system

	;sprintf(compile_command_2, "X", x, x);
	lea rdi, [compile_command2]
	lea rsi, [compile_command2_format]
	mov rdx, [rsp]
	mov rcx, [rsp]
	call sprintf
	lea rdi, [compile_command2]
	call system

	;sprintf(run_command, "X", x);
	lea rdi, [run_command]
	lea rsi, [run_command_format]
	mov rdx, [rsp]
	call sprintf
	lea rdi, [run_command]
	call system

	end_sully:
		pop rax

		pop rbp
		xor rdi, rdi
		call exit

section .data
	filename_format db "Sully_%d.s", 0
	filename db "Sully_5555.s", 0
	compile_command1_format db "nasm -f elf64 Sully_%d.s -o Sully_%d.o", 0
	compile_command1 db "nasm -f -f elf64 Sully_5555.s -o Sully_5555.o", 0
	compile_command2_format db "ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o Sully_%d -lc Sully_%d.o", 0
	compile_command2 db "ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o Sully_5555 -lc Sully_5555.o", 0
	run_command_format db "./Sully_%d", 0
	run_command db "./Sully_5555", 0
	format db PRINTF_STRING, 0
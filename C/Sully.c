#include <stdio.h>
#include <stdlib.h>

#define CODE "#include<stdio.h>%1$c%1$c#include<stdlib.h>%1$c%1$c#define CODE %4$c%5$s%4$c%1$c%1$cint main() {%1$c%2$cint x = %3$d;%1$c%1$c%2$cif (x > 0) {%1$c%2$c%2$cchar filename[100];%1$c%2$c%2$csprintf(filename, %4$cSully_%%d.c%4$c, x - 1);%1$c%2$c%2$cFILE *f = fopen(filename, %4$cw%4$c);%1$c%1$c%2$c%2$cfprintf(f, CODE, 10, 9, x - 1, 34, CODE);%1$c%1$c%2$c%2$cfclose(f);%1$c%1$c%2$c%2$cchar compile_command[100];%1$c%2$c%2$csprintf(compile_command, %4$cgcc -Wall -Wextra -Werror Sully_%%d.c -o Sully_%%d%4$c, x - 1, x - 1);%1$c%2$c%2$csystem(compile_command);%1$c%1$c%2$c%2$cchar execute_command[100];%1$c%2$c%2$csprintf(execute_command, %4$c./Sully_%%d%4$c, x - 1);%1$c%2$c%2$csystem(execute_command);%1$c%2$c}%1$c%1$c%2$creturn 0;%1$c}%1$c"

int main() {
	int x = 5;

	if (x > 0) {
		char filename[100];
		sprintf(filename, "Sully_%d.c", x - 1);
		FILE *f = fopen(filename, "w");

		fprintf(f, CODE, 10, 9, x - 1, 34, CODE);

		fclose(f);

		char compile_command[100];
		sprintf(compile_command, "gcc -Wall -Wextra -Werror Sully_%d.c -o Sully_%d", x - 1, x - 1);
		system(compile_command);

		char execute_command[100];
		sprintf(execute_command, "./Sully_%d", x - 1);
		system(execute_command);
	}

	return 0;
}
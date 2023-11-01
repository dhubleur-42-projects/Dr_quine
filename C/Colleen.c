#include <stdio.h>

/*
	To use instead of printf because to use printf, we need to use some double quotes
	To use instead of puts because puts adds a newline at the end
*/
void print_string(char *str) {
	for (int i = 0; str[i]; i++) {
		putchar(str[i]);
	}
}

int main() {
	/*
		Define some characters
	*/
	char quote = 34;
	char newline = 10;
	char comma = 44;

	char code[44][100] = {
		"#include <stdio.h>",
		"",
		"/*",
		"	To use instead of printf because to use printf, we need to use some double quotes",
		"	To use instead of puts because puts adds a newline at the end",
		"*/",
		"void print_string(char *str) {",
		"	for (int i = 0; str[i]; i++) {",
		"		putchar(str[i]);",
		"	}",
		"}",
		"",
		"int main() {",
		"	/*",
		"		Define some characters",
		"	*/",
		"	char quote = 34;",
		"	char newline = 10;",
		"	char comma = 44;",
		"",
		"	char code[44][100] = {",
		"		",
		"	};",
		"",
		"	for (int i = 0; i < 21; i++) {",
		"		print_string(code[i]);",
		"		putchar(newline);",
		"	}",
		"	for (int i = 0; i < 44; i++) {",
		"		print_string(code[21]);",
		"		putchar(quote);",
		"		print_string(code[i]);",
		"		putchar(quote);",
		"		if (i < 43) {",
		"			putchar(comma);",
		"		}",
		"		putchar(newline);",
		"	}",
		"	for (int i = 22; i < 44; i++) {",
		"		print_string(code[i]);",
		"		putchar(newline);",
		"	}",
		"	return 0;",
		"}"
	};

	for (int i = 0; i < 21; i++) {
		print_string(code[i]);
		putchar(newline);
	}
	for (int i = 0; i < 44; i++) {
		print_string(code[21]);
		putchar(quote);
		print_string(code[i]);
		putchar(quote);
		if (i < 43) {
			putchar(comma);
		}
		putchar(newline);
	}
	for (int i = 22; i < 44; i++) {
		print_string(code[i]);
		putchar(newline);
	}
	return 0;
}

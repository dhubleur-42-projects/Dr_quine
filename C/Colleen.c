#include <stdio.h>

// To use instead of printf because to use printf, we need to use some double quotes
// To use instead of puts because puts adds a newline at the end
void print_string(char *str) {
	for (int i = 0; str[i]; i++) {
		putchar(str[i]);
	}
}

int main() {
	// Define some characters
	char quote = 34;
	char newline = 10;
	char comma = 44;

	// Define the code
	char code[42][100] = {
		"#include <stdio.h>",
		"",
		"// To use instead of printf because to use printf, we need to use some double quotes",
		"// To use instead of puts because puts adds a newline at the end",
		"void print_string(char *str) {",
		"	for (int i = 0; str[i]; i++) {",
		"		putchar(str[i]);",
		"	}",
		"}",
		"",
		"int main() {",
		"	// Define some characters",
		"	char quote = 34;",
		"	char newline = 10;",
		"	char comma = 44;",
		"",
		"	// Define the code",
		"	char code[42][100] = {",
		"		",
		"	};",
		"",
		"	// Print the code",
		"	for (int i = 0; i < 18; i++) {",
		"		print_string(code[i]);",
		"		putchar(newline);",
		"	}",
		"	for (int i = 0; i < 42; i++) {",
		"		print_string(code[18]);",
		"		putchar(quote);",
		"		print_string(code[i]);",
		"		putchar(quote);",
		"		if (i < 41) {",
		"			putchar(comma);",
		"		}",
		"		putchar(newline);",
		"	}",
		"	for (int i = 19; i < 42; i++) {",
		"		print_string(code[i]);",
		"		putchar(newline);",
		"	}",
		"	return 0;",
		"}"
	};

	// Print the code
	for (int i = 0; i < 18; i++) {
		print_string(code[i]);
		putchar(newline);
	}
	for (int i = 0; i < 42; i++) {
		print_string(code[18]);
		putchar(quote);
		print_string(code[i]);
		putchar(quote);
		if (i < 41) {
			putchar(comma);
		}
		putchar(newline);
	}
	for (int i = 19; i < 42; i++) {
		print_string(code[i]);
		putchar(newline);
	}
	return 0;
}

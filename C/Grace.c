#include <stdio.h>

#define STR "#include <stdio.h>%1$c%1$c#define STR %2$c%3$s%2$c%1$c%1$c/* 10/34 define newline and quotes */%1$c#define GRACE(x) int main() { FILE *f = fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c); fprintf(f, STR, 10, 34, STR); fclose(f); return 0; }%1$c%1$cGRACE()"

/* 10/34 define newline and quotes */
#define GRACE(x) int main() { FILE *f = fopen("Grace_kid.c", "w"); fprintf(f, STR, 10, 34, STR); fclose(f); return 0; }

GRACE()
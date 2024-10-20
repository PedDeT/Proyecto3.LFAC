%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
%}

/* Define tokens */
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
NUMBER [0-9]+
STRING \"(\\.|[^\\"])*\"

%%
"SELECT"         { printf("Token: SELECT\n"); }
"FROM"           { printf("Token: FROM\n"); }
"WHERE"          { printf("Token: WHERE\n"); }
"INSERT"         { printf("Token: INSERT\n"); }
"INTO"           { printf("Token: INTO\n"); }
"VALUES"         { printf("Token: VALUES\n"); }
"DELETE"         { printf("Token: DELETE\n"); }
"UPDATE"         { printf("Token: UPDATE\n"); }
"SET"            { printf("Token: SET\n"); }
"CREATE"         { printf("Token: CREATE\n"); }
"TABLE"          { printf("Token: TABLE\n"); }
"DROP"           { printf("Token: DROP\n"); }
"ALTER"          { printf("Token: ALTER\n"); }
"ADD"            { printf("Token: ADD\n"); }
"COLUMN"         { printf("Token: COLUMN\n"); }
"IF"             { printf("Token: IF\n"); }
"ELSE"           { printf("Token: ELSE\n"); }
"WHILE"          { printf("Token: WHILE\n"); }
"RETURN"         { printf("Token: RETURN\n"); }
"INT"            { printf("Token: INT\n"); }
"FLOAT"          { printf("Token: FLOAT\n"); }
"DOUBLE"         { printf("Token: DOUBLE\n"); }
"CHAR"           { printf("Token: CHAR\n"); }
":="             { printf("Token: ASSIGN\n"); }
"="              { printf("Token: EQ\n"); }
"!="             { printf("Token: NEQ\n"); }
"<"              { printf("Token: LT\n"); }
">"              { printf("Token: GT\n"); }
"<="             { printf("Token: LEQ\n"); }
">="             { printf("Token: GEQ\n"); }
"+"              { printf("Token: PLUS\n"); }
"-"              { printf("Token: MINUS\n"); }
"*"              { printf("Token: TIMES\n"); }
"/"              { printf("Token: DIVIDE\n"); }
"("              { printf("Token: LPAREN\n"); }
")"              { printf("Token: RPAREN\n"); }
{IDENTIFIER}     { printf("Token: IDENTIFIER (%s)\n", yytext); }
{NUMBER}         { printf("Token: NUMBER (%s)\n", yytext); }
{STRING}         { printf("Token: STRING (%s)\n", yytext); }
[ \t\n]+         { /* Ignore whitespaces */ }
.                { printf("Unexpected character: %s\n", yytext); exit(1); }
%%

int yywrap() {
    return 1;
}


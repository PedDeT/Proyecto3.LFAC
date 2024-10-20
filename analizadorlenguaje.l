%{
#include "pars.tab.h"
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
%}

/* Define tokens */
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
NUMBER [0-9]+
STRING \"(\\.|[^\\"])*\"

%%
"SELECT"         { return SELECT; }
"FROM"           { return FROM; }
"WHERE"          { return WHERE; }
"INSERT"         { return INSERT; }
"INTO"           { return INTO; }
"VALUES"         { return VALUES; }
"DELETE"         { return DELETE; }
"UPDATE"         { return UPDATE; }
"SET"            { return SET; }
"CREATE"         { return CREATE; }
"TABLE"          { return TABLE; }
"DROP"           { return DROP; }
"ALTER"          { return ALTER; }
"ADD"            { return ADD; }
"COLUMN"         { return COLUMN; }
"IF"             { return IF; }
"ELSE"           { return ELSE; }
"WHILE"          { return WHILE; }
"RETURN"         { return RETURN; }
"INT"            { return INT; }
"FLOAT"          { return FLOAT; }
"DOUBLE"         { return DOUBLE; }
"CHAR"           { return CHAR; }
":="             { return ASSIGN; }
"="              { return EQ; }
"!="             { return NEQ; }
"<"              { return LT; }
">"              { return GT; }
"<="             { return LEQ; }
">="             { return GEQ; }
"+"              { return PLUS; }
"-"              { return MINUS; }
"*"              { return TIMES; }
"/"              { return DIVIDE; }
{IDENTIFIER}     { yylval.str = strdup(yytext); return IDENTIFIER; }
{NUMBER}         { yylval.num = atoi(yytext); return NUMBER; }
{STRING}         { yylval.str = strdup(yytext); return STRING; }
[ \t\n]+         { /* Ignore whitespace */ }
.                { printf("Unexpected character: %s\n", yytext); exit(1); }
%%

int yywrap() {
    return 1;
}

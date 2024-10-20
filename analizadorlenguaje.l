%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

void yyerror(const char *s);
%}

/* Define tokens */
%token SELECT FROM WHERE INSERT INTO VALUES DELETE UPDATE SET CREATE TABLE DROP ALTER ADD COLUMN 
%token IF ELSE WHILE RETURN INT FLOAT DOUBLE CHAR
%token IDENTIFIER NUMBER STRING
%token ASSIGN /* := or = */
%token EQ NEQ LT GT LEQ GEQ
%token PLUS MINUS TIMES DIVIDE

%%

/* Rules for keywords */
"SELECT"      { return SELECT; }
"FROM"        { return FROM; }
"WHERE"       { return WHERE; }
"INSERT"      { return INSERT; }
"INTO"        { return INTO; }
"VALUES"      { return VALUES; }
"DELETE"      { return DELETE; }
"UPDATE"      { return UPDATE; }
"SET"         { return SET; }
"CREATE"      { return CREATE; }
"TABLE"       { return TABLE; }
"DROP"        { return DROP; }
"ALTER"       { return ALTER; }
"ADD"         { return ADD; }
"COLUMN"      { return COLUMN; }
"if"          { return IF; }
"else"        { return ELSE; }
"while"       { return WHILE; }
"return"      { return RETURN; }
"int"         { return INT; }
"float"       { return FLOAT; }
"double"      { return DOUBLE; }
"char"        { return CHAR; }

/* Rules for identifiers */
[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.str = strdup(yytext);
    return IDENTIFIER;
}

/* Rules for numbers */
[0-9]+ {
    yylval.num = atoi(yytext);
    return NUMBER;
}

/* Rules for strings */
\"[^\"]*\" {
    yylval.str = strdup(yytext + 1);  /* Remove the starting quote */
    yylval.str[strlen(yylval.str) - 1] = '\0';  /* Remove the ending quote */
    return STRING;
}

/* Rules for operators */
":="          { return ASSIGN; }
"="           { return EQ; }
"!="          { return NEQ; }
"<>"          { return NEQ; }
"<"           { return LT; }
">"           { return GT; }
"<="          { return LEQ; }
">="          { return GEQ; }
"+"           { return PLUS; }
"-"           { return MINUS; }
"*"           { return TIMES; }
"/"           { return DIVIDE; }
"("           { return '('; }
")"           { return ')'; }
","           { return ','; }
";"           { return ';'; }

/* Ignore whitespace */
[ \t\n]+      { /* ignore whitespace */ }

/* Catch all for unrecognized characters */
.             { yyerror("Unrecognized character"); }

%%

int yywrap() {
    return 1;
}

int main() {
    yyparse();
    return 0;
}

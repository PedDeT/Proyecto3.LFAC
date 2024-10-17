%{
#include <stdio.h>
%}

digit       [0-9]
letter      [a-zA-Z]
identifier  {letter}({letter}|{digit})*
number      {digit}+
whitespace  [ \t\n]+

%%

"if"        { printf("IF\n"); }
"else"      { printf("ELSE\n"); }
"while"     { printf("WHILE\n"); }
"return"    { printf("RETURN\n"); }
"int"       { printf("INT\n"); }
"float"     { printf("FLOAT\n"); }
"void"      { printf("VOID\n"); }

{identifier} { printf("IDENTIFIER(%s)\n", yytext); }
{number}     { printf("NUMBER(%s)\n", yytext); }
{whitespace} { /* ignore whitespace */ }

"+"         { printf("PLUS\n"); }
"-"         { printf("MINUS\n"); }
"*"         { printf("MULTIPLY\n"); }
"/"         { printf("DIVIDE\n"); }
"="         { printf("ASSIGN\n"); }
"=="        { printf("EQUAL\n"); }
"!="        { printf("NOT_EQUAL\n"); }
"<"         { printf("LESS_THAN\n"); }
">"         { printf("GREATER_THAN\n"); }
"<="        { printf("LESS_EQUAL\n"); }
">="        { printf("GREATER_EQUAL\n"); }

"("         { printf("LPAREN\n"); }
")"         { printf("RPAREN\n"); }
"{"         { printf("LBRACE\n"); }
"}"         { printf("RBRACE\n"); }
";"         { printf("SEMICOLON\n"); }
","         { printf("COMMA\n"); }

.           { printf("UNKNOWN(%s)\n", yytext); }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}
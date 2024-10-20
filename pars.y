%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
extern int yylex();
extern FILE *yyin;  // File pointer for input
%}

%union {
    int num;
    char *str;
}

/* Define tokens */
%token <str> IDENTIFIER STRING
%token <num> NUMBER
%token SELECT FROM WHERE INSERT INTO VALUES DELETE UPDATE SET CREATE TABLE DROP ALTER ADD COLUMN 
%token IF ELSE WHILE RETURN INT FLOAT DOUBLE CHAR
%token ASSIGN /* := or = */
%token EQ NEQ LT GT LEQ GEQ
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN

/* Declare the types of non-terminals */
%type <str> type
%type <num> expression term factor

/* Declare operator precedence */
%left PLUS MINUS
%left TIMES DIVIDE
%precedence IFX
%precedence ELSE

%%

// Define grammar rules
program:
    statement_list
    ;

statement_list:
    statement_list statement
    | statement
    ;

statement:
    variable_declaration
    | assignment
    | if_statement
    | while_statement
    | expression_statement
    ;

variable_declaration:
    type IDENTIFIER ';' { printf("Variable declaration: %s %s\n", $1, $2); free($2); }
    ;

assignment:
    IDENTIFIER ASSIGN expression ';' { printf("Assignment: %s := %d\n", $1, $3); }
    ;

if_statement:
    IF '(' expression ')' statement %prec IFX
    | IF '(' expression ')' statement ELSE statement
    ;

while_statement:
    WHILE '(' expression ')' statement { printf("While statement\n"); }
    ;

expression_statement:
    expression ';' { printf("Expression statement: %d\n", $1); }
    ;

expression:
    expression PLUS term { $$ = $1 + $3; }
    | expression MINUS term { $$ = $1 - $3; }
    | term { $$ = $1; }
    ;

term:
    term TIMES factor { $$ = $1 * $3; }
    | term DIVIDE factor { $$ = $1 / $3; }
    | factor { $$ = $1; }
    ;

factor:
    NUMBER { $$ = $1; }
    | IDENTIFIER { $$ = 0; /* Placeholder value */ }
    | '(' expression ')' { $$ = $2; }
    ;

type:
    INT { $$ = strdup("int"); }
    | FLOAT { $$ = strdup("float"); }
    | DOUBLE { $$ = strdup("double"); }
    | CHAR { $$ = strdup("char"); }
    ;

%%

// Error handling function
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char **argv) {
    FILE *file = fopen("ejemplo_computadoras.sql", "r");
    if (!file) {
        perror("Could not open ejemplo_computadoras.sql");
        return 1;
    }
    
    yyin = file;  // Set the input file for the lexer

    int result = yyparse();  // Call the parser
    
    fclose(file);  // Close the file after parsing
    return result;
}

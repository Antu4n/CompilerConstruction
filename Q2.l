%{
#include <stdio.h>
%}

%%
is|am|are|were|was|be|being|been|do|does|did|will|would|should|can|could|has|have|had|go {
    printf("%s: Is a verb\n", yytext);
}
.	;
%%
int yywrap() {
    return 1;
}

int main() {
    printf("Enter input: ");
    yylex();
    return 0;
}

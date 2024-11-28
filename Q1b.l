%{
#include <stdio.h>
%}

%%
[a-zA-Z]*abc[a-zA-Z]* {
    //Replace "abc" with "ABC" in the matched word
    for (int i=0; i < yyleng; i++){
        if (yytext[i] == 'a' && yytext[i+1]== 'b' && yytext[i+2]=='c'){
            printf("ABC");
            i+=2; //skip "abc"
        }
        else{
            putchar(yytext[i]);
        }
    }
}

[ \t\n]+	{printf("%s", yytext);} //preserve whitespaces
.		{putchar(yytext[0]);} //print other characters as is
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}


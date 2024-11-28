%{
#include <stdio.h>
int word_count = 0;
int total_size = 0;
int in_word = 0;
%}

%%
[a-zA-Z0-9_]+	{ total_size+=yyleng;in_word = 1; }//yylengpredefined rule that holds the length of matched text.
[ \t\n]+        { if (in_word) { word_count++; in_word = 0; }}
.		{ total_size+=yyleng;}
%%

int yywrap(void){
return 1;
}

int main(){
yylex();
printf("The file has %d words \nthe the total size is %d\n", word_count, total_size);
return 0;
}

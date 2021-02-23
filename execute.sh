flex lexical.l #generates the lexical lex.yy.c C
bison -d synt.y  
gcc lex.yy.c synt.tab.c -ll -ly  -o lang
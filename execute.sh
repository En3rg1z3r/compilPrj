

flex lexical.l #generates the lexical lex.yy.c C
cd Syntaxique
cat Tokens/tokens.y Root/root.y *.y Footer/footer.y> ../syntax.y
cd ..
bison -d syntax.y  
gcc lex.yy.c syntax.tab.c -ll -ly  -o lang

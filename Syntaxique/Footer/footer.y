
%%
main()
{ 
  yyparse();
  afficher();

}
yywrap() {}
yyerror(char*msg) {
  printf("erreur syntaxique a ligne %d \n",nb_ligne);
}
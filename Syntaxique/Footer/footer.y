
%%
main()
{ 
  yyparse();
  afficher();

}
yywrap() {}
yyerror(char*msg) {
  printf("Erreur syntaxique a la ligne %d\n", nb_ligne);
}
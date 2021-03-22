%{
  int nb_ligne = 1;
  char sauvType[20];
  char expression_type[20];
 
%}
%union {
  int entier;
  char* str;
  float reel;
}

%token 
  mc_import
  pvg
  <str>bib_io
  <str>bib_lang
  err mc_public 
  mc_private
  mc_protected
  mc_class
  <str>idf_var
  idf_reel
  aco_ov
  aco_fr
	<entier> mc_entier
  mc_reel
  mc_chaine
  vrg
  <str>idf_tab
  cr_ov
  cr_fm
	<entier> idf_entier
  mc_operateur_ar
  mc_print
  <str>string
  par_ov
  par_fr
  mc_operateur_comp
  mc_affecter
  mc_scan
  mc_for
  mc_operateur_short_hand
  template

%%
S: LISTE_BIB CLASS {
                     printf("pgm syntaxiquement correcte\n");
                     YYACCEPT;        
                    }
;





 
		  


AFFECTATION: 
  idf_var  mc_affecter EXPRESSION pvg 
    {
      handle_undeclared($1);
      require_number($1);
    }
  |idf_tab cr_ov idf_entier cr_fm  mc_affecter EXPRESSION_ARETHMETIQUE pvg 
    {
      handle_undeclared($1);
      tab_index($1, $3);
      require_number();
    }
  |idf_var mc_affecter idf_var pvg {require_type($1, $3)}
  |idf_var mc_affecter idf_tab cr_ov idf_entier cr_fm pvg {require_type($1, $3)}
  |idf_tab cr_ov idf_entier cr_fm  mc_affecter idf_var pvg {require_type($1, $6)}
  |AFFECTATION_SHORT_HAND
;

AFFECTATION_SHORT_HAND:
  idf_var mc_operateur_short_hand pvg
;	



HEADER_CLASS:
  MODIFICATEUR mc_class idf_var
;
MODIFICATEUR: 
  mc_public| 
  mc_private|
  mc_protected
;

BLOCK: aco_ov LISTE_INSTRUCTIONS aco_fr;

CLASS:
HEADER_CLASS BLOCK {require_lib()}
;

BOUCLE_FOR: 
  mc_for 
  par_ov
  AFFECTATION
  EXPRESSION_LOGIQUE pvg
  AFFECTATION_SHORT_HAND
  par_fr
  BLOCK
;
DEC: 
  DEC_VAR |
  DEC_TAB
;
DEC_VAR: TYPE LISTE_IDF pvg
;

LISTE_IDF: 
  idf_var vrg LISTE_IDF {delcare_var($1);}
  |idf_var {delcare_var($1);}
;	
DEC_TAB: TYPE LISTE_IDF_TAB pvg
;

LISTE_IDF_TAB: 
  idf_tab cr_ov idf_entier cr_fm vrg LISTE_IDF_TAB {declare_tab($1, $3);}|
  idf_tab cr_ov idf_entier cr_fm {declare_tab($1, $3);}
;	


EXPRESSION_VALUE:
  idf_entier 
  |idf_reel
  
;

EXPRESSION_ARETHMETIQUE: 
  EXPRESSION_VALUE mc_operateur_ar EXPRESSION_ARETHMETIQUE
  |par_ov EXPRESSION_ARETHMETIQUE par_fr
  |EXPRESSION_VALUE
;

EXPRESSION_LOGIQUE:
  idf_var mc_operateur_comp idf_var 
  |idf_var mc_operateur_comp idf_entier 
;

EXPRESSION:
  EXPRESSION_ARETHMETIQUE
  |EXPRESSION_LOGIQUE
;
LISTE_INSTRUCTIONS: INSTRUCTION LISTE_INSTRUCTIONS | 
;

INSTRUCTION: 
  AFFECTATION |
  DEC |
  SCAN |
  PRINT |
  BOUCLE_FOR
;

PRINT: mc_print par_ov PRINT_ARGUMENTS par_fr pvg 

;

SCAN:  mc_scan par_ov template vrg LISTE_IDF par_fr pvg
;


PRINT_ARGUMENTS:
  string |
  template vrg LISTE_PARAMS
;

LISTE_PARAMS:
  string vrg LISTE_PARAMS
  |idf_var vrg LISTE_PARAMS
  |idf_tab vrg LISTE_PARAMS
  |string
  |idf_var
  |idf_tab 
;


NOM_BIB:
  bib_io {import_lib($1)}|
  bib_lang {import_lib($1)}
;

BIB: mc_import NOM_BIB pvg
;

LISTE_BIB: 
  BIB LISTE_BIB |
;	
TYPE:
  mc_entier|
  mc_reel|
  mc_chaine
;
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
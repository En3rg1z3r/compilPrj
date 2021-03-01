%token 
  mc_import
  pvg
  bib_io
  bib_lang
  err mc_public 
  mc_private
  mc_protected
  mc_class
  idf
  idf_reel
  aco_ov
  aco_fr
	mc_entier
  mc_reel
  mc_chaine
  vrg
  idf_tab
  cr_ov
  cr_fm
	cst
  mc_operateur_ar
  mc_print
  string
  par_ov
  par_fr
  mc_operateur_comp
  mc_affecter
  comment 
  mc_scan
  mc_for
  mc_operateur_short_hand
  template

%%
S: LISTE_BIB CLASS{printf("pgm syntaxiquement correcte\n"); 
               YYACCEPT;        }
;





 
		  

AFFECTATION: 
  idf mc_affecter NOMBRE pvg |
  idf mc_affecter EXPRESSION  |
  AFFECTATION_SHORT_HAND pvg
;

AFFECTATION_SHORT_HAND:
  idf mc_operateur_short_hand
;	

NOMBRE: 
  idf_reel| 
  cst |
  idf
;

HEADER_CLASS:
  MODIFICATEUR mc_class idf
;
MODIFICATEUR: 
  mc_public| 
  mc_private|
  mc_protected
;

BLOCK: aco_ov LISTE_INSTRUCTIONS aco_fr;

CLASS:
HEADER_CLASS BLOCK;
;

COMMENTAIRE:  comment;
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
  idf vrg LISTE_IDF|
  idf
;	
DEC_TAB: TYPE LISTE_IDF_TAB pvg
;

LISTE_IDF_TAB: 
  idf_tab cr_ov cst cr_fm vrg LISTE_IDF_TAB |
  idf_tab cr_ov cst cr_fm
;	
EXPRESSION: 
  NOMBRE mc_operateur_ar EXPRESSION |
  NOMBRE
;

EXPRESSION_LOGIQUE:
  idf mc_operateur_comp NOMBRE
;
LISTE_INSTRUCTIONS: INSTRUCTION LISTE_INSTRUCTIONS | 
;

INSTRUCTION: 
  AFFECTATION |
  DEC |
  COMMENTAIRE |
  SCAN |
  PRINT |
  BOUCLE_FOR|
;

PRINT: mc_print par_ov PRINT_ARGUMENTS par_fr pvg
;

SCAN:  mc_scan par_ov TEMPLATE vrg LISTE_IDF par_fr pvg
;


PRINT_ARGUMENTS:
  STRING |
  EXPRESSION|
  TEMPLATE vrg LISTE_IDF
;
NOM_BIB:
  bib_io |
  bib_lang
;

BIB: mc_import NOM_BIB pvg
;

LISTE_BIB: 
  BIB LISTE_BIB |
;	
STRING:
  string // "Hello world"
;

TEMPLATE: // "hello %s"
  template
;
TYPE:
  mc_entier|
  mc_reel|
  mc_chaine
;
%%
main()
{yyparse();}
yywrap() {}

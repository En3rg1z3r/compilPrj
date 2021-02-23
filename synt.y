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
  comment scan

%%
S: LISTE_BIB HEADER_CLASS aco_ov CORPS aco_fr{printf("pgm syntaxiquement correcte"); 
               YYACCEPT;        }
;

HEADER_CLASS:MODIFICATEUR mc_class idf
;
MODIFICATEUR: mc_public
             |mc_private
			 |mc_protected
			 ;

CORPS: LIGNE;
LIGNE :AFFECTATION LIGNE | DEC LIGNE | COMMENTAIRE LIGNE | PRINT LIGNE|AFFECTATION | DEC | COMMENTAIRE | PRINT  ;

COMMENTAIRE :  comment;

PRINT : mc_print par_ov STATEMENT par_fr pvg;

STATEMENT : string | EXPRESSION;

LISTE_DEC: DEC LISTE_DEC 
          |
;




DEC: DEC_VAR
     |DEC_TAB
;
DEC_VAR: TYPE LISTE_IDF pvg
;
LISTE_IDF: idf vrg LISTE_IDF
          |idf
;	
DEC_TAB: TYPE LISTE_IDF_TAB pvg
;
LISTE_IDF_TAB: idf_tab cr_ov cst cr_fm vrg LISTE_IDF_TAB
              |idf_tab cr_ov cst cr_fm
;			  


	  
TYPE:mc_entier
    |mc_reel
	|mc_chaine
;


LISTE_AFFECTATION : AFFECTATION LISTE_AFFECTATION | AFFECTATION;

AFFECTATION : idf mc_affecter NOMBRE pvg | idf mc_affecter EXPRESSION pvg;

EXPRESSION : NOMBRE mc_operateur_ar EXPRESSION | NOMBRE; 

NOMBRE : idf_reel| cst | idf;
			 
			 
			 
LISTE_BIB: BIB LISTE_BIB
          |
;		  
BIB: mc_import NOM_BIB pvg
;
NOM_BIB:bib_io
         |bib_lang
;		  
%%
main()
{yyparse();}
yywrap() {}

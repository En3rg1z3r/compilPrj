
IDF:
  idf_var {handle_undeclared($1);}
  |idf_tab {handle_undeclared($1);}
  |idf_entier
  |idf_reel
;

EXPRESSION_ARETHMETIQUE: 
  IDF mc_operateur_ar EXPRESSION 
  |par_ov EXPRESSION par_fr
  |IDF
;

EXPRESSION_LOGIQUE:
  IDF mc_operateur_comp IDF
;

EXPRESSION:
  EXPRESSION_ARETHMETIQUE
  |EXPRESSION_LOGIQUE
;
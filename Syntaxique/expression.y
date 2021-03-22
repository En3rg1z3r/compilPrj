


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
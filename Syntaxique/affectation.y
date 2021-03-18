
AFFECTATION: 
  idf_var mc_affecter EXPRESSION pvg {handle_undeclared($1)}|
  AFFECTATION_SHORT_HAND
;

AFFECTATION_SHORT_HAND:
  idf_var mc_operateur_short_hand pvg {handle_undeclared($1)}
;	




PRINT: mc_print par_ov PRINT_ARGUMENTS par_fr pvg 

;

SCAN:  mc_scan par_ov template vrg LISTE_IDF par_fr pvg
;


PRINT_ARGUMENTS:
  string |
  EXPRESSION |
  template vrg LISTE_PARAMS
;

LISTE_PARAMS:
  string vrg LISTE_PARAMS
  |EXPRESSION vrg LISTE_PARAMS
  |string
  |EXPRESSION
;


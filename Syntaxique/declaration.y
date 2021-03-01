
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

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
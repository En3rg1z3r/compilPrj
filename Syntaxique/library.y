
NOM_BIB:
  bib_io {import_lib($1)}|
  bib_lang {import_lib($1)}
;

BIB: mc_import NOM_BIB pvg
;

LISTE_BIB: 
  BIB LISTE_BIB |
;	
%{
  int nb_ligne = 1;
  char sauvType[20];

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




AFFECTATION: 
  idf_var  mc_affecter EXPRESSION pvg 
    {
      handle_undeclared($1);
      require_number($1);
    }
  |idf_tab cr_ov idf_entier cr_fm  mc_affecter EXPRESSION_ARETHMETIQUE pvg 
    {
      handle_undeclared($1);
      tab_index($1, $3);
      require_number();
    }
  |idf_var mc_affecter idf_var pvg {require_type($1, $3)}
  |idf_var mc_affecter idf_tab cr_ov idf_entier cr_fm pvg {require_type($1, $3)}
  |idf_tab cr_ov idf_entier cr_fm  mc_affecter idf_var pvg {require_type($1, $6)}
  |AFFECTATION_SHORT_HAND
;

AFFECTATION_SHORT_HAND:
  idf_var mc_operateur_short_hand pvg
;	



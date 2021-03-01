%{
#include "syntax.tab.h"
int nb_ligne=1;
%}
lettres [a-zA-Z]
chiffres [0-9]
lettres_chiffres ({lettres}|{chiffres}|_)*
idf "$"{lettres_chiffres}
idf_tab "@"{lettres}{lettres_chiffres}
idf_reel -?({chiffres}+\.{chiffres}+|{idf_entier})
idf_entier -?{chiffres}+
operateur_ar \+|\-|\/|\*
operateur_comp !=|==|(<|>)=?
operateur_short_hand \+\+|\-\-
mot .*
comment ##{mot}##
double_quote \"
format %[dsf]
string ([^%]*)
template \"((%[dfs])([^%])*|([^%])*(%[dfs]))((%[dfs])|([^%]))*\"




%%
import return mc_import;
ISIL.io return bib_io;
ISIL.lang return bib_lang;
public return mc_public;
private return mc_private;
protected return mc_protected;
class return mc_class;
Entier return mc_entier;
Reel return mc_reel;
Chaine return mc_chaine;


{idf} return idf;
{idf_tab} return idf_tab;
{idf_entier} return cst;
"[" return cr_ov;
"]" return cr_fm;
"," return vrg;
"{" return aco_ov;
"}" return aco_fr;
"(" return par_ov;
")" return par_fr;
; return pvg;

{double_quote}{string}{double_quote} return string;
print return mc_print;
For return mc_for;

, return vrg;
Out return mc_print;
In return mc_scan;
{template} return template;

{operateur_ar} return mc_operateur_ar;
{idf_reel} return idf_reel;
{operateur_comp} return mc_operateur_comp;
{operateur_short_hand} return mc_operateur_short_hand;
{comment} return comment;
= return mc_affecter; 
[ \t] 
[\n] nb_ligne++;
. {printf("erreur lexicale a ligne %d sur l'entite %s\n",nb_ligne,yytext);
   return err;  }


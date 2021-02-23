%{
#include "synt.tab.h"
int nb_ligne=1;
%}
lettres [a-zA-Z]
chiffres [0-9]
idf "$"({lettres}|{chiffres}|_)*
idf_tab "@"{lettres}({lettres}|{chiffres}|_)*
idf_reel -?({chiffres}+\.{chiffres}+|{idf_entier})
idf_entier -?{chiffres}+
operateur_ar \+|\-|\/|\*
operateur_comp !=|==|(<|>)=?
mot .*
comment ##{mot}##

string \".*\"



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
{string} return string;
print return mc_print;
{operateur_ar} return mc_operateur_ar;
{idf_reel} return idf_reel;
{operateur_comp} return mc_operateur_comp;
{comment} return comment;
= return mc_affecter; 
[ \t] 
[\n] nb_ligne++;
. {printf("erreur lexicale a ligne %d sur l'entite %s\n",nb_ligne,yytext);
   return err;  }


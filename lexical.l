%{
#include "syntax.tab.h"
#include "functions.h"

extern nb_ligne;
extern YYSTYPE yylval;
extern char sauvType[20];

%}
lettres [a-zA-Z]
chiffres [0-9]
lettres_chiffres ({lettres}|{chiffres}|_)*
idf_var "$"{lettres_chiffres}
idf_tab "@"{lettres}{lettres_chiffres}
idf_reel -?({chiffres}+\.{chiffres}+|{idf_entier})
idf_entier -?{chiffres}+
operateur_ar \+|\-|\/|\*
operateur_comp !=|==|(<|>)=?
operateur_short_hand \+\+|\-\-
comment ##[^#]*##
double_quote \"
format %[dsf]
string \"[^%\"]*\"
template \"((%[dfs])([^%\"])*|([^%\"])*(%[dfs]))((%[dfs])|([^%\"]))*\"




%%

import return mc_import;
ISIL.io { 
          strcpy(sauvType, "LIB");
          yylval.str = strdup("ISIL.io");
          return bib_io;
      
        }
ISIL.lang { 
            strcpy(sauvType, "LIB");
            yylval.str = strdup("ISIL.lang");
            return bib_lang;
          }
public return mc_public;
private return mc_private;
protected return mc_protected;
class return mc_class;
For return mc_for;
Out return mc_print;
In return mc_scan;

Entier  { yylval.str = strdup("Entier");
          strcpy(sauvType, "Entier");
          return mc_entier;
        }

Reel    { yylval.str = strdup("Reel");
          strcpy(sauvType, "Reel");
          return mc_reel;
        }

Chaine  { yylval.str = strdup("Chaine");
          strcpy(sauvType, "Chaine");
          return mc_chaine;
        }


{idf_var} { 
            if(yyleng < 20) 
            {
              yylval.str = strdup(yytext);
              
              return idf_var;
            }
            else printf("erreur lexical a la ligne %d: l'idf %s trop long\n",nb_ligne,yytext); 
          }


{idf_tab} { yylval.str=strdup(yytext);
            return idf_tab;
			    }

{idf_entier} { 
               yylval.entier = atoi(yytext);
               return idf_entier;
             }

{idf_reel} { yylval.reel = atoi(yytext);
             return idf_reel;
           }
      

"[" return cr_ov;
"]" return cr_fm;
"{" return aco_ov;
"}" return aco_fr;
"(" return par_ov;
")" return par_fr;
";" return pvg;
"," return vrg;
"=" return mc_affecter; 

{operateur_ar} return mc_operateur_ar;
{operateur_comp} return mc_operateur_comp;
{operateur_short_hand} return mc_operateur_short_hand;

{string} { 
           yylval.str = strdup(yytext);
           return string;
         }

{template} return template;


{comment} ;
[ \t] 
[\n] nb_ligne++;
. {printf("erreur lexicale a ligne %d sur l'entite %s\n",nb_ligne,yytext);
   return err;  }


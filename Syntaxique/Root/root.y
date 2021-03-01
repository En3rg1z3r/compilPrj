%%
S: LISTE_BIB CLASS{printf("pgm syntaxiquement correcte\n"); 
               YYACCEPT;        }
;

STATEMENT: 
  string |
  EXPRESSION|
  string vrg idf
;

NOMBRE: 
  idf_reel| 
  cst |
  idf
;

 
		  

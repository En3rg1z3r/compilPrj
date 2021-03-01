/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     mc_import = 258,
     pvg = 259,
     bib_io = 260,
     bib_lang = 261,
     err = 262,
     mc_public = 263,
     mc_private = 264,
     mc_protected = 265,
     mc_class = 266,
     idf = 267,
     idf_reel = 268,
     aco_ov = 269,
     aco_fr = 270,
     mc_entier = 271,
     mc_reel = 272,
     mc_chaine = 273,
     vrg = 274,
     idf_tab = 275,
     cr_ov = 276,
     cr_fm = 277,
     cst = 278,
     mc_operateur_ar = 279,
     mc_print = 280,
     string = 281,
     par_ov = 282,
     par_fr = 283,
     mc_operateur_comp = 284,
     mc_affecter = 285,
     comment = 286,
     mc_scan = 287,
     mc_for = 288,
     mc_operateur_short_hand = 289,
     format = 290
   };
#endif
/* Tokens.  */
#define mc_import 258
#define pvg 259
#define bib_io 260
#define bib_lang 261
#define err 262
#define mc_public 263
#define mc_private 264
#define mc_protected 265
#define mc_class 266
#define idf 267
#define idf_reel 268
#define aco_ov 269
#define aco_fr 270
#define mc_entier 271
#define mc_reel 272
#define mc_chaine 273
#define vrg 274
#define idf_tab 275
#define cr_ov 276
#define cr_fm 277
#define cst 278
#define mc_operateur_ar 279
#define mc_print 280
#define string 281
#define par_ov 282
#define par_fr 283
#define mc_operateur_comp 284
#define mc_affecter 285
#define comment 286
#define mc_scan 287
#define mc_for 288
#define mc_operateur_short_hand 289
#define format 290




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;


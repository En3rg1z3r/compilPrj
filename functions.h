#include<stdbool.h>
extern nb_ligne;
extern char sauvType[20];


void erreur(char msg[], char entity[]) 
{
  printf("Erreur sémentique : %s, %s a la ligne %d\n", msg, entity, nb_ligne);
}

typedef struct
{
  char NomEntite[20];
  char CodeEntite[20];
  char TypeEntite[20];
  int taille;

} Entity;

Entity T[100];
int T_size = 0;

int get(char nom[])
{
  int i = 0;
  while(i< T_size)
  {
    if (strcmp(T[i].NomEntite, nom)== 0)       
      return i;
    i++;
  }
  return -1;
}

bool exists(char nom[])
{ 
  if (get(nom) < 0)
    return false;
  else 
    return true;
}


void insert_idf(char nom[], int size) 
{
  //Entity entity = T[T_size];
  strcpy(T[T_size].NomEntite, nom);
  strcpy(T[T_size].CodeEntite, "IDF");
  strcpy(T[T_size].TypeEntite, sauvType);
  T[T_size].taille = size;
  T_size ++;
  
}
void declare(char nom[], int size)
{
  if (exists(nom))
    erreur("variable déja declarée", nom);
  else 
    insert_idf(nom, size);
}

void delcare_var(char nom[])
{
  declare(nom, 1);
}

void declare_tab(char nom[], int size) {
  if (size < 0)
    erreur("la taille du tableau doit etre un entier positif", nom);
  else
    declare(nom, size); 
}

void tab_index(char nom[], int i)
{
  int pos = get(nom);
  if (i < 0)
    erreur("la taille du tableau doit etre un entier positif", nom);
  else if(pos == -1)
    erreur("not declared", nom);
  else if (T[pos].taille <= i)
    erreur("index out of bounds", nom);

}

void handle_undeclared(char nom[])
{
  if (!exists(nom))
    erreur("Variable n'a pas ete declaree", nom);
}
void import_lib(char nom[]) 
{
  if (exists(nom))
    printf("Warning: importing %s is useless, already imported.", nom);
  else 
  {
    declare(nom, 1);
  
  }
}

void require_lib()
{
  if (!exists("ISIL.io"))
    printf("Erreur : Missing library. ISIL.io\n");
  if (!exists("ISIL.lang"))
    printf("Erreur : Missing library. ISIL.lang\n");
}

void require_number(char nom[])
{
  if (strcmp(T[get(nom)].TypeEntite, "Entier")!=0)
    erreur("Expression doit etre arithmetique", "");
}

void require_type(char nom1[], char nom2[])
{
  if (strcmp(T[get(nom1)].TypeEntite, T[get(nom2)].TypeEntite) != 0)
    erreur("Affectation impossible deux types differents.", nom1);
}

void afficher ()
{
	printf("\n/***************Table des symboles ******************/\n");
	printf("______________________________________________________________\n");
	printf("\t| NomEntite |  CodeEntite | TypeEntite |Taille \n");
	printf("______________________________________________________________\n");
	int i=0;
  
  while(i<T_size)
  {
    printf("\t|%10s |%12s | %10s |%10d\n",T[i].NomEntite,T[i].CodeEntite, T[i].TypeEntite,T[i].taille);
    i++;
  }
}
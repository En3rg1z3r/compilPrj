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


bool already_declared(char nom[])
{
  int i = 0;
  while(i< T_size)
  {
    if (strcmp(T[i].NomEntite, nom)== 0) 
    {
      
      return true;
    }
      
    i++;
  }
  printf("new variable\n");
  return false;
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
  if (already_declared(nom))
    
    erreur("variable déja declarée", nom);
  else  
  {
    insert_idf(nom, size);
    
  }
  
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

void handle_undeclared(char nom[])
{
  if (!already_declared(nom))
  {
    erreur("Variable n'a pas ete declaree", nom);
  }
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
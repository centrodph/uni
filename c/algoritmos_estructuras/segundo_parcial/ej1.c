/**
 1) Crear y mostrar un árbol binario de búsqueda.

Crear las funciones necesarias para:

a) Calcular y mostrar la cantidad de nodos del árbol mayores a la raíz

b) Calcular y mostrar la cantidad de nodos hoja con valor par

*/
#include <stdio.h>
#include <stdlib.h>

typedef struct arbol
{
    int dato;
    struct arbol *izq;
    struct arbol *der;
} treenode;

void crear(treenode **hoja);
void insertar(treenode **hoja, int elem);
void mostrar(treenode *hoja, int primer_elemento, int *contador_mayor_raiz, int *contador_hoja_par);

int main()
{

    int primer_elemento, contador_mayor_raiz = 0, contador_hoja_par = 0;
    printf("arboles\n");
    treenode *arbol = NULL;

    crear(&arbol);
    primer_elemento = arbol->dato;

    printf("**************\n");
    printf("mostrar arbol\n");
    printf("***************\n");

    mostrar(arbol, primer_elemento, &contador_mayor_raiz, &contador_hoja_par);

    printf("\n\n contador_mayor_raiz: %d\n\n", contador_mayor_raiz);
    printf("\n\n contador_hoja_par: %d\n\n", contador_hoja_par);

    return 0;
}
void crear(treenode **hoja)
{
    int numero;

    printf("ingrese numero\n");
    scanf("%d", &numero);
    while (numero != -1)
    {

        insertar(&(*hoja), numero);
        printf("ingrese numero\n");
        scanf("%d", &numero);
    }
}

void insertar(treenode **hoja, int elem)
{
    int numero = elem;
    if (elem == -1)
        return;
    if (*hoja == NULL)
    {
        // creo la hoja vacia
        (*hoja) = (treenode *)malloc(sizeof(treenode));
        (*hoja)->dato = elem;
        (*hoja)->der = NULL;
        (*hoja)->izq = NULL;
    }
    else
    {

        if (numero > (*hoja)->dato)
        {

            insertar(&(*hoja)->der, elem);
        }
        else
        {

            insertar(&(*hoja)->izq, elem);
        }
    }
    return;
}

void mostrar(treenode *hoja, int primer_elemento, int *contador_mayor_raiz, int *contador_hoja_par)
{
    if (hoja != NULL)
    {

        mostrar(hoja->izq, primer_elemento, contador_mayor_raiz, contador_hoja_par);
        printf("%d ", hoja->dato);
        if (hoja->izq == NULL && hoja->der == NULL && hoja->dato % 2 == 0)
        {
            *contador_hoja_par += 1;
        }
        if (hoja->dato > primer_elemento)
        {
            *contador_mayor_raiz += 1;
        }
        mostrar(hoja->der, primer_elemento, contador_mayor_raiz, contador_hoja_par);
    }
    return;
}

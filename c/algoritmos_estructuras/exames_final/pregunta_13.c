#include <stdio.h>
#include <stdlib.h>

// La cantidad de nodos hoja que a su vez son divisores de la
// raíz en un árbol binario.

typedef struct arbol

{

    int dato;

    struct arbol *izq;

    struct arbol *der;

} treenode;

void crear(treenode **hoja);

void insertar(treenode **hoja, int elem);

void mostrar(treenode *hoja, int raiz, int *cantidad);

int main()

{
    int cantidad = 0;
    int raiz;

    printf("arboles\n");

    treenode *arbol = NULL;

    crear(&arbol);

    raiz = arbol->dato;

    printf("raiz %d\n", raiz);

    printf("**************\n");

    printf("mostrar arbol\n");

    printf("***************\n");

    mostrar(arbol, raiz, &cantidad);

    printf("cantidad  %d\n", cantidad);
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

void mostrar(treenode *hoja, int raiz, int *cantidad)

{

    if (hoja != NULL)

    {

        mostrar(hoja->izq, raiz, cantidad);

        printf("%d ", hoja->dato);
        if (hoja->izq == NULL && hoja->der == NULL && raiz % hoja->dato == 0)
        {
            *cantidad = *cantidad + 1;
        }

        mostrar(hoja->der, raiz, cantidad);
    }

    return;
}
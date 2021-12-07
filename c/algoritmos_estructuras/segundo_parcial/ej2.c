/*
Crear una pila con la siguiente información:

            num: número entero.

            siguiente: puntero al próximo elemento de la pila.

Crear las funciones necesarias para calcular y mostrar la sumatoria
de los nodos con el mismo valor que el tope de pila. No incluir al tope de pila en la sumatoria
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CANT 4

typedef struct tiponodo
{
    int dato;

    struct tiponodo *siguiente;
} nodo;

void mostrar(nodo aux)

{
    printf("%d \n", aux.dato);
}

nodo *crear_nodo(int dato)
{
    nodo *u;
    u = (nodo *)malloc(sizeof(nodo));
    u->dato = dato;

    u->siguiente = NULL;

    return u;
}

void apilar(nodo **p, nodo *u)
{
    printf("apilar_nodo\n");

    u->siguiente = *p;
    // printf("%d p=%X u=%X\n", u->dato, *p, u);
    *p = u;
}

nodo desapilar(nodo **p, int tope_pila, int *sumatoria)
{
    nodo *aux;
    nodo datos;

    datos = **p;

    aux = *p;

    if (aux->siguiente != NULL && tope_pila == aux->dato)
    {
        *sumatoria += aux->dato;
    }

    *p = (*p)->siguiente;
    free(aux);

    return datos;
}

int main()
{

    int tope_pila;
    int sumatoria = 0;
    int i, num;
    nodo *p = NULL;

    for (i = 0; i < CANT; i++)
    {
        printf("Ingrese un numero \n");
        scanf("%d", &num);
        apilar(&p, crear_nodo(num));
        if (i == 0)
        {
            tope_pila = p->dato;
        }
    }

    printf("\nVamos a desapilar todo\n");
    while (p != NULL)
    {

        mostrar(desapilar(&p, tope_pila, &sumatoria));
    }

    printf("\n\n sumatoria: %d\n\n", sumatoria);
    return 0;
}

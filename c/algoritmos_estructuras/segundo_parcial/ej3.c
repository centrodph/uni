/*
Crear una cola con la siguiente información:

            num: número entero.

            siguiente: puntero al próximo elemento de la cola.

Crear las funciones necesarias para calcular y mostrar la cantidad de nodos
múltiplos del primer elemento ingresado en la cola. Incluir el primer elemento
ingresado en dicha cantidad
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

void acolar(nodo **p, nodo **u, nodo *q)
{
    printf("acolar_nodo\n");
    if (*p == NULL)
        *p = *u = q; /*porque hay uno solo*/
    else
    {
        (*u)->siguiente = q;
        (*u) = q;
    }
    // printf("%022d p=%X u=%X\n", q->dato, *p, *u);
}

nodo desacolar(nodo **inicio, int primer_elemento, int *cantidad_multiplos)
{
    nodo *aux;
    nodo datos;

    datos = **inicio;

    aux = *inicio;
    if (aux->dato % primer_elemento == 0)
    {
        *cantidad_multiplos += 1;
    }

    *inicio = (*inicio)->siguiente;
    free(aux);

    return datos;
}

int main()
{

    int primer_elemento, cantidad_multiplos = 0;
    int i, num;
    nodo *p = NULL;
    nodo *u = NULL;

    for (i = 0; i < CANT; i++)
    {
        printf("Ingrese un numero");
        scanf("%d", &num);
        acolar(&p, &u, crear_nodo(num));
    }

    primer_elemento = p->dato;

    printf("\n\n primer_elemento: %d\n\n", primer_elemento);
    printf("\nVamos a desacolar todo\n");
    while (p != NULL)
    {
        mostrar(desacolar(&p, primer_elemento, &cantidad_multiplos));
    }

    printf("\n\n cantidad_multiplos: %d\n\n", cantidad_multiplos);
    return 0;
}

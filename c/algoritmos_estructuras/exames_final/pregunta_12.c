#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CANT 10

// La cantidad de números múltiplos del último elemento
// ingresado a una cola de números enteros (incluyendo a si mismo).

typedef struct tiponodo

{

    int dato;

    struct tiponodo *siguiente;

} nodo;

void mostrar(nodo aux, int ultimo, int *cantidad)

{

    printf("%d \n", aux.dato);
    if (aux.dato % ultimo == 0)
    {
        (*cantidad)++;
    }
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

    printf("%02d p=%X u=%X\n", q->dato, *p, *u);
}

nodo desacolar(nodo **inicio)

{

    nodo *aux;

    nodo datos;

    datos = **inicio;

    aux = *inicio;

    *inicio = (*inicio)->siguiente;

    free(aux);

    return datos;
}

int main()

{

    int i, num;
    int ultimo;
    int cantidad = 0;
    nodo *p = NULL;

    nodo *u = NULL;

    for (i = 0; i < CANT; i++)

    {

        printf("Ingrese un numero");

        scanf("%d", &num);

        acolar(&p, &u, crear_nodo(num));
    }

    ultimo = u->dato;

    printf("\nVamos a desacolar todo\n");

    while (p != NULL)

    {

        mostrar(desacolar(&p), ultimo, &cantidad);
    }

    printf("\nCantidad de multiplos %d\n", cantidad);

    return 0;
}
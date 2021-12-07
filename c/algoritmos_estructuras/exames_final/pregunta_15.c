#include <stdio.h>
#include <stdlib.h>

// Dada una lista con números enteros, solicitar al usuario
// el ingreso un número. Luego, eliminar aquellos nodos cuyo valor
// sea múltiplo del valor ingresado por el usuario.

typedef struct lista
{

    int num;

    struct lista *sig;

} nodo;

void crear(nodo *pt);

void mostrar(nodo *pt);

nodo *eliminar1(nodo *, int numero);

void eliminar2(nodo *, int numero);

int main()

{

    int numero;
    printf("ingrese numero para hacer el calculo en la lista\n");
    scanf("%d", &numero);

    nodo *prin = NULL;

    prin = (nodo *)malloc(sizeof(nodo));

    crear(prin);
    printf("\n\n\nlista\n");
    mostrar(prin);

    prin = eliminar1(prin, numero);

    eliminar2(prin, numero);


    printf("\n\nresultado\n");
    mostrar(prin);

    return 0;
}

void crear(nodo *registro)
{

    scanf("%d", &registro->num);

    if (registro->num == -1)
        registro->sig = NULL;
    else
    {
        registro->sig = (nodo *)malloc(sizeof(nodo));
        crear(registro->sig);
    }
    return;
}

void mostrar(nodo *registro)

{

    if (registro->sig != NULL)

    {

        printf("%d\n", registro->num);

        mostrar(registro->sig);
    }

    return;
}

nodo *eliminar1(nodo *p, int numero)

{
    nodo *aux;

    while (p->num % numero == 0) // condicion de eliminacion

    {

        aux = p->sig;

        free(p);

        p = aux;
    }

    return p;
}

void eliminar2(nodo *p, int numero)

{
    nodo *aux;

    while (p->sig != NULL && p->sig->sig != NULL)

    {

        if (p->sig->num % numero == 0) // condicion de eliminacion

        {

            aux = p->sig->sig;

            free(p->sig);

            p->sig = aux;
        }

        else

        {

            p = p->sig;
        }
    }
}

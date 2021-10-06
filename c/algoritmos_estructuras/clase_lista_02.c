#include <stdio.h>
#include <stdlib.h>

typedef struct lista
{
    int num;
    struct lista *sig;
} nodo;

void crear(nodo *pt);
void mostrar(nodo *pt);

nodo *eliminar1(nodo *);
void insertar2(nodo *);
void eliminar2(nodo *);

int main()
{

    nodo *prin = NULL;
    prin = (nodo *)malloc(sizeof(nodo));

    crear(prin);
    mostrar(prin);
    printf("\nInsertar2\n");
    insertar2(prin);
    mostrar(prin);
    printf("\nEliminar1\n");
    prin = eliminar1(prin);
    mostrar(prin);
    printf("\nEliminar2\n");
    eliminar2(prin);
    mostrar(prin);
    return 0;
}

void crear(nodo *registro)
{

    scanf("%d", &registro->num);

    if (registro->num == 1000)
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
        printf(" [%d] ", registro->num);

        mostrar(registro->sig);
    }
    printf("\n");
    return;
}

void insertar2(nodo *p)
{
    nodo *aux;
    while (p->sig != NULL && p->sig->sig != NULL)
    {
        if (p->num == p->sig->num - 1) //condicion de insercion
        {
            aux = (nodo *)malloc(sizeof(nodo));
            aux->num = p->sig->num + 1; //valor a insertar
            aux->sig = p->sig->sig;
            p->sig->sig = aux;
            p = p->sig;
        }
        p = p->sig;
    }
}

nodo *eliminar1(nodo *p)
{
    nodo *aux;
    while (p->num == p->sig->num - 1) //condicion de eliminacion
    {
        aux = p->sig;
        free(p);
        p = aux;
    }
    return p;
}
void eliminar2(nodo *p)
{
    nodo *aux;
    while (p->sig != NULL && p->sig->sig != NULL)
    {
        if (p->num == p->sig->num - 1) //condicion de eliminacion
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
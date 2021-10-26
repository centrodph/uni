/**
 * Crear y mostrar la lista. La carga finaliza con -1
 * 1) Calcular y mostrar el promedio de los números ingresados a la lista.
 * Luego, si el nodo tiene número mayor al promedio, eliminar dicho nodo.
 *  2) Si un nodo tiene valor negativo, insertar adelante del mismo todos sus
 * \sucesores hasta el 0 (inclusive).
 * */

#include <stdio.h>
#include <stdlib.h>

typedef struct lista
{
    int num;
    struct lista *sig;
} nodo;

void crear(nodo *pt);
void mostrar(nodo *pt);
float promedio(nodo *pt);
nodo *eliminar1(nodo *, float prom);
void insertar2(nodo *);
void eliminar2(nodo *, float prom);

int main()
{

    nodo *prin = NULL;
    prin = (nodo *)malloc(sizeof(nodo));

    printf("Crear lista\n");
    crear(prin);
    printf("\n\n\n-------------\n");
    printf("Mostrar lista\n");
    mostrar(prin);

    printf("\n\n\n-------------\n");
    float prom = promedio(prin);
    printf("El promedio es %f\n", prom);
    prin = eliminar1(prin, prom);
    mostrar(prin);
    eliminar2(prin, prom);

    printf("\n\n\n-------------\n");
    printf("Despues de eliminacion\n");
    mostrar(prin);

    printf("\n\n\n-------------\n");
    printf("Despues de insertar sucesores\n");
    insertar2(prin);
    mostrar(prin);

    printf("\n\n\n-------------\n");
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
float promedio(nodo *registro)
{
    float suma = 0;
    float cantidad = 0;
    nodo *aux = registro;
    while (aux->sig != NULL)
    {
        cantidad = cantidad + 1;
        suma = suma + aux->num;
        aux = aux->sig;
    }
    return suma / cantidad;
}

void insertar2(nodo *p)
{
    int faltan_para_cero = 0;
    nodo *aux;
    while (p->sig != NULL)
    {
        while (p->num < 0)
        {
            aux = (nodo *)malloc(sizeof(nodo));
            aux->num = p->num + 1; // valor a insertar
            aux->sig = p->sig;
            p->sig = aux;
            p = p->sig;
        }
        p = p->sig;
    }
}

nodo *eliminar1(nodo *p, float prom)
{
    nodo *aux;
    while (p->num > prom) // condicion de eliminacion
    {
        aux = p->sig;
        free(p);
        p = aux;
    }
    return p;
}
void eliminar2(nodo *p, float prom)
{
    nodo *aux;
    while (p->sig != NULL && p->sig->sig != NULL)
    {
        if (p->sig->num > prom) // condicion de eliminacion
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

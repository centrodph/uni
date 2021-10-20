/**
 * 
 
 Crear y mostrar la lista. Termina con num=1000.

Se pide:
a)	Ingresar dos números enteros y eliminar todos los nodos entre dichos números.
Si no es posible, mostrar un cartel aclaratorio.  

b)	Ingresar otro número. Buscar la posición de dicho nodo e insertar todos sus antecesores hasta cero.
                 Si no es posible, mostrar un cartel aclaratorio.   

Ejemplo:

Lista original:

8	14  6  2  9  3  20  3  6  2  4  8                
                
                b) Se ingresan 1  y  4

                Se elimina del nodo 1 hasta el 4 inclusive

                        9  3  20  3  6  2  4  8  

               C) Se ingresa 5

                  Se inserta a partir del nodo 5   

9	3  20  3  6  5  4  3  2  1  0  2  4  8  

 * 
 * 
 **/

#include <stdio.h>
#include <stdlib.h>

typedef struct lista
{
    int num;
    struct lista *sig;
} nodo;

void crear(nodo *pt);
void mostrar(nodo *pt);
nodo *insertar1(nodo *);
nodo *eliminar1(nodo *, int eliminar_end_number, int eliminar_start_number);
void insertar2(nodo *, int posicion_antecesores);
void eliminar2(nodo *, int eliminar_end_number, int eliminar_start_number);

int main()
{

    nodo *prin = (nodo *)malloc(sizeof(nodo));
    crear(prin);
    printf("\n\nMostrar: \n");
    mostrar(prin);
    int eliminar_start_number;
    int eliminar_end_number;
    int posicion_antecesores;

    printf("Ingrese posicion inicial:");
    scanf("%d", &eliminar_start_number);
    printf("Ingrese posicion final:");
    scanf("%d", &eliminar_end_number);

    if (eliminar_start_number == 1)
    {
        prin = eliminar1(prin, eliminar_end_number, eliminar_start_number);
    }
    else
    {
        eliminar2(prin, eliminar_end_number, eliminar_start_number);
    }
    printf("\n\n");
    mostrar(prin);

    printf("Ingrese posicion para completar antecesores:");
    scanf("%d", &posicion_antecesores);

    insertar2(prin, posicion_antecesores);
    printf("\n\n");
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
        printf("%d\n", registro->num);
        mostrar(registro->sig);
    }
    return;
}

void insertar2(nodo *p, int posicion_antecesores)
{
    int contador_posiciones = 1;
    nodo *aux;
    while (p->sig != NULL)
    {
        if (posicion_antecesores == contador_posiciones) //condicion de insercion
        {
            while (p->num > 0)
            {
                aux = (nodo *)malloc(sizeof(nodo));
                aux->num = p->num - 1; //valor a insertar
                aux->sig = p->sig;
                p->sig = aux;
                p = p->sig;
            }
        }
        p = p->sig;
        contador_posiciones += 1;
    }
}

nodo *eliminar1(nodo *p, int eliminar_end_number, int eliminar_start_number)
{
    int contador_posiciones = 0;
    nodo *aux;
    while (contador_posiciones <= eliminar_end_number - eliminar_start_number)
    {
        aux = p->sig;
        free(p);
        p = aux;
        contador_posiciones += 1;
    }
    return p;
}
void eliminar2(nodo *p, int eliminar_end_number, int eliminar_start_number)
{
    nodo *aux;
    int contador_posiciones = 0;
    while (p->sig != NULL && p->sig->sig != NULL)
    {
        if (contador_posiciones < eliminar_end_number - 1 && contador_posiciones + 1 >= eliminar_start_number - 1) //condicion de eliminacion
        {
            aux = p->sig->sig;
            free(p->sig);
            p->sig = aux;
        }
        else
        {
            p = p->sig;
        }
        contador_posiciones += 1;
    }
}

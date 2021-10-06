/**

Dada la siguiente lista simplemente enlazada que contiene la siguiente información:
    
    DNI: entero positivo de hasta 8 dígitos.
    Nombre: cadena de 15 caracteres
    Tipo de cuenta: carácter (C,E,A)
    Saldo: real
    Siguiente: puntero al próximo elemento de la lista.
    Desarrollar un procedimiento que busque en la lista un nodo cuyo DNI sea igual a uno
    dado. El mismo devolverá un puntero al nodo hallado o NULL, si no existiera tal nodo
 **/
#include <stdio.h>
#include <stdlib.h>

typedef struct lista
{
    int dni;
    char nombre[15];
    char cuenta;
    struct lista *sig;
} nodo;

void crear(nodo *reg);
void mostrar(nodo *reg);

int main()
{
    nodo *inicial;
    inicial = (nodo *)malloc(sizeof(nodo));
    crear(inicial);
    mostrar(inicial);
    return 0;
}

void crear(nodo *reg)
{
    printf("Ingrese numero:");
    scanf("%d", &reg->cuenta);
    if (reg->cuenta == -1)
    {
        reg->sig = NULL;
    }
    else
    {
        reg->sig = (nodo *)malloc(sizeof(nodo));
        crear(reg->sig);
    }
}
void mostrar(nodo *reg)
{
    if (reg->sig != NULL)
    {
        printf("%d\n", reg->cuenta);
        mostrar(reg->sig);
    }
    return;
}

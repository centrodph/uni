#include <stdio.h>
#include <stdlib.h>

int calcular_sumatoria(int numero);
int main()
{

    printf("\ncalcular_sumatoria es %d \n", calcular_sumatoria(4));
    return 0;
}

int calcular_sumatoria(int numero)
{
    if (numero == 0)
    {
        return 0; // caso base
    }
    return numero + calcular_sumatoria(numero - 1); // algoritmo recursivo
}
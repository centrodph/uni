#include <stdio.h>
#include <stdlib.h>

int factorial(int n);
int main()
{
    int numero;
    printf("ingrese numero para hacer el calculo\n");
    scanf("%d", &numero);
    printf("\nfactorial de %d es %d \n", numero, factorial(numero));
    return 0;
}

int factorial(int n)
{
    if (n < 2)
    {
        return 1;
    }
    return n * factorial(n - 1);
}
#include <stdio.h>
#include <stdlib.h>

// Diseñar un algoritmo recursivo que permita hacer la división por restas sucesivas.
int division(int dividendo, int divisor);
int main()
{

    printf("\n 33 dividido de 4 es %d \n", division(33, 4));
    return 0;
}

int division(int dividendo, int divisor)
{
    if (dividendo < divisor)
    {
        return 0;
    }
    return division(dividendo - divisor, divisor) + 1;
}
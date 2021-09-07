#include <stdio.h>
#include <stdlib.h>

int factorial(int n);
int main()
{

    printf("\nfactorial de 4 es %d \n", factorial(4));
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
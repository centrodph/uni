#include <stdio.h>
#include <stdlib.h>

int potencia(int A, int B);
void primos(int num);

int main()
{

    int base, exp, prim;

    printf("Ingrese una base 'A'\n");
    scanf("%d", &base);
    printf("Ingrese un exponente 'B'\n");
    scanf("%d", &exp);

    printf("El resultado de la potencia es %d\n", potencia(base, exp));

    printf("Ingrese un numero para obtener los primos\n");
    scanf("%d", &prim);

    printf("Los primos anteriores a %d son\n", prim);
    primos(prim);

    return 0;
}

int potencia(int A, int B)
{
    if (B == 1)
    {
        return A;
    }
    else
    {
        return A * potencia(A, B - 1);
    }
}

void primos(int numero)
{
    int checker = (numero / 2) + 1;

    if (numero == 1)
    {
        printf("%d", 2);
        return;
    }
    else
    {
        while (checker > 1)
        {
            if (numero % checker == 0)
            {
                return primos(numero - 1);
            }
            checker--;
        }

        printf("%d ", numero);

        return primos(numero - 1);
    }
}
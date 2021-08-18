/**
 Ingresar números enteros hasta cargar un arreglo de 8 posiciones
 intercalando un numero impar positivo y un número negativo. Mostrarlo
Calcular:
1. El valor máximo y el valor mínimo.
2. El promedio de los elementos del arreglo e insertarlo en la primera posición del arreglo.
3. Ordenar el arreglo de menor a mayor.

Ejemplo: 
[1,-1,3,-2,5,-3,7,-4]
[0,1,-1,3,-2,5,-3,7,-4]
**/
#include <stdio.h>

void cargar(int[]);
void cargar(int vec[]);
void mostrar(int vec[], int n);
void max_min(int vec[], int n);
float promedio(int vec[], int n);
void insertar(int vec[], int promedio);
void ordenar(int vec[]);


int main()
{
    float vec[10], n = 8, p;
    cargar(vec);
    mostrar(vec, n);
    max_min(vec, n);
    p = promedio(vec, n);
    insertar(vec, p);
    mostrar(vec, n);
    ordenar(vec);
    mostrar(vec, n);
    return 0;
}

void cargar(int vec[])
{
    int cont = 0, num;
    int i = 0, j = 1;
    while (cont < 8)
    {
        printf("\nIngrese un numero: ");
        scanf("%d", &num);

        if (num > 0 && num % 2 != 0 && i < 7)
        {
            vec[i] = num;
            i += 2;
            cont++;
        }
        if (num < 0 && j < 8)
        {
            vec[j] = num;
            j += 2;
            cont++;
        }
    }
}

void mostrar(int vec[], int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("[%d]", vec[i]);
    }
    printf("\n");
}

void max_min(int vec[], int n)
{
    int max = vec[0], min = vec[0];
    for (int i = 0; i < n; i++)
    {
        if (vec[i] > max)
        {
            max = vec[i];
        }
        if (vec[i] < min)
        {
            min = vec[i];
        }
    }
    printf("\nmax: %d \nmin: %d", max, min);
}

float promedio(int vec[], int n)
{
    int acum = 0;
    for (int i = 0; i < n; i++)
    {
        acum += vec[i];
    }
    printf("\npromedio: %d \n", acum / n);
    return acum / n;
}

void insertar(int vec[], int promedio)
{
    for (int i = 8; i > 0; i--)
    {
        vec[i] = vec[i - 1];
    }
    vec[0] = promedio;
}

void ordenar(int vec[])
{
    int aux;
    for (int i = 0; i < 7; i++)
    {
        for (int j = i + 1; j < 8; j++)
        {
            if (vec[i] > vec[j])
            {
                aux = vec[i];
                vec[i] = vec[j];
                vec[j] = aux;
            }
        }
    }
}
/**
1. Cargar una matriz de n*n de números enteros. Mostrar:
    a) la sumatoria de los elementos de la 2º fila.
    b) el mayor elemento de la segunda columna.
    c) el promedio de todos los múltiplos de 5 en la matriz.
    d) la sumatoria de la diagonal principal de la matriz.
**/

#include <stdio.h>

void cargar(int matriz[][100], int filas, int columnas);
void mostrar(int matriz[][100], int filas, int columnas);
void sumar_fila(int matriz[][100], int filas, int columnas, int fila_a_sumar);
void mayor_elemento_columna(int matriz[][100], int filas, int columnas, int columna);
void promedio_de_multiplos(int matriz[][100], int filas, int columnas, int multiplo);
void suma_diagonal(int matriz[][100], int filas, int columnas);

int main()
{
    int matriz[100][100];
    int filas, columnas;

    printf("Ingrese cantidad de filas:\n");
    scanf("%d", &filas);
    printf("Ingrese cantidad de columnas:\n");
    scanf("%d", &columnas);
    cargar(matriz, filas, columnas);
    mostrar(matriz, filas, columnas);
    sumar_fila(matriz, filas, columnas, 2 - 1);
    mayor_elemento_columna(matriz, filas, columnas, 2 - 1);
    promedio_de_multiplos(matriz, filas, columnas, 5);
    return 0;
}

void cargar(int matriz[][100], int filas, int columnas)
{
    int i, j, num;
    for (i = 0; i < filas; i++)
    {
        for (j = 0; j < columnas; j++)
        {
            printf("Ingrese cantidad de fila %d column %d:\n", i, j);
            scanf("%d", &num);
            matriz[i][j] = num;
        }
    }
}
void mostrar(int matriz[][100], int filas, int columnas)
{
    int i, j, num;
    for (i = 0; i < filas; i++)
    {
        printf("\n\n");
        for (j = 0; j < columnas; j++)
        {
            printf("%d\t", matriz[i][j]);
        }
    }
    printf("\n\n");
}

void sumar_fila(int matriz[][100], int filas, int columnas, int fila_a_sumar)
{
    int j, sum = 0;
    printf("\n");
    for (j = 0; j < columnas; j++)
    {
        sum += matriz[fila_a_sumar][j];
    }
    printf("La suma de la fila %d es %d \n", fila_a_sumar, sum);
}

void mayor_elemento_columna(int matriz[][100], int filas, int columnas, int columna)
{
    int j, max = matriz[columna][0];
    printf("\n");
    for (j = 0; j < filas; j++)
    {
        if (max < matriz[j][columna])
        {
            max = matriz[j][columna];
        }
    }
    printf("La suma de la columna %d es %d\n", columna, max);
}

void promedio_de_multiplos(int matriz[][100], int filas, int columnas, int multiplo)
{
    int i, j, num = 0, cantidad_multiplo = 0;
    for (i = 0; i < filas; i++)
    {
        for (j = 0; j < columnas; j++)
        {
            if (matriz[i][j] %  multiplo == 0)
            {
                num += matriz[i][j];
                cantidad_multiplo += 1;
            }
        }
    }
    printf("El promedio de los multiplos de %d es %d\n", multiplo, num / cantidad_multiplo);
}
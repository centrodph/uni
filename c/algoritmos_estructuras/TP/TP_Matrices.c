#include <stdlib.h>
#include <stdio.h>

void CargarMatriz(int matriz[][10], int filas, int columnas)
{
    int i, j;
    for (i=0; i<filas; i++)
    {
        for (j=0; j<columnas; j++)
        {
            printf("ingrese un numero\n");
            scanf("%d", &matriz[i][j]);
        }
    }
}

void MostrarMatriz(int matriz[][10], int filas, int columnas)
{
    int i, j;
    for (i=0; i<filas; i++)
    {
        for (j=0; j<columnas; j++)
        {
            printf("%d\t", matriz[i][j]);
        }
        printf("\n");
    }
}

void ProbarAntisimetria(int matriz[10][10], int dim)
{
    int i, j, ctrl, pos, anti_pos;
    ctrl = 1; // ¿cuenta como flag si el programa corre completo?

    for (i=0; i<dim; i++)
    {
        for (j=i+1; j<dim; j++)
        {
            pos = matriz[i][j];
            anti_pos = matriz[j][i];
            if (pos != -anti_pos)
            {
                ctrl = 0;
            }
        }
    }

    if (ctrl == 0)
    {
        printf("La matriz no es antisimetrica");
    }
    else
    {
        printf("La matriz es antisimetrica");
    }
}

int main()
{
    int dim, matriz[10][10];
    printf("Ingrese la cantidad de filas/columnas\n");
    scanf("%d", &dim);

    CargarMatriz(matriz, dim, dim);
    MostrarMatriz(matriz, dim, dim);
    ProbarAntisimetria(matriz, dim);

    return 0;
}
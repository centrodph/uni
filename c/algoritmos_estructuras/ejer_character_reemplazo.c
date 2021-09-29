#include <stdio.h>
#include <stdlib.h>
//Leer un texto carácter a carácter, terminado en PUNTO.
//Mostrar el texto con un blanco y eliminar las palabras de 1 letra.

int main()
{
    int contadorletras = 0;
    char letra1;
    char c;

    printf("Ingrese el texto, termina con punto.\n");
    printf("Su frase es: ");
    c = getchar();

    while (c != '.')
    {
        contadorletras = 0;
        while (c != ' ' && c != '.')
        {
            contadorletras++;
            if (contadorletras == 1)
            {
                letra1 = c;
            }
            else if (contadorletras == 2)
            {
                putchar(letra1);
                putchar(c);
            }
            else
            {
                putchar(c);
            }
            c = getchar();
        }

        if (contadorletras == 1)
        {
            putchar(22);
        }
        else
        {
            putchar(c);
        }
        c = getchar();
        // putchar(c);
    }
}
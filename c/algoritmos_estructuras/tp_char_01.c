#include <stdio.h>
#include <stdlib.h>

/**
 * Leer un texto carácter a carácter, terminado en PUNTO. Mostrar cuántas palabras
 * tienen más de 3 letras.
 **/

int main()
{
    int cantidad_palabras = 0;
    int cantidad_letras_palabra = 0;
    char c;

    printf("Por favor ingrese la frase: \n");
    c = getchar();

    putchar(c);
    while (c != '.')
    {

        while (c == ' ')
        {
            c = getchar();
            putchar(c);
            cantidad_letras_palabra = 0;
        }
        while (c != ' ' && c != '.')
        {
            c = getchar();
            putchar(c);
            cantidad_letras_palabra += 1;
        }
        if (cantidad_letras_palabra > 3)
        {
            cantidad_palabras += 1;
        }
    }
    printf("\n\ncantidad de palabras con mas de 3 letras es %d \n", cantidad_palabras);
    return 0;
}
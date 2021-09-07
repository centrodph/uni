#include <stdio.h>
#include <stdlib.h>

/**
 *Ingresar un texto carácter a carácter y determinar e informar cuantas palabras 
 * capicúas hay de 2 o 3 letras. 
 **/

int main()
{
    int cantidad_palabras = 0;
    char palabra[10];
    int cantidad_letras_palabra = 0;
    char c;

    printf("Por favor ingrese la frase: \n");
    c = getchar();
    while (c != '.')
    {

        while (c == ' ')
        {
            c = getchar();
        }
        cantidad_letras_palabra = 0;
        while (c != ' ' && c != '.')
        {
            palabra[cantidad_letras_palabra] = c;
            cantidad_letras_palabra += 1;

            c = getchar();
        }
        if (cantidad_letras_palabra > 2 &&
            palabra[0] == palabra[cantidad_letras_palabra - 1] &&
            palabra[1] == palabra[cantidad_letras_palabra - 2])
        {
            cantidad_palabras += 1;
        }
    }
    printf("\n\ncantidad de palabras con mas capicua es %d \n", cantidad_palabras);
    return 0;
}
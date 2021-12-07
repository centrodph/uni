

#include <stdio.h>
#include <stdlib.h>
/*
Ingresar un texto caracter a caracter terminado en punto y calcular
cuántas palabras terminan en vocal.

Ejemplo: "Hoy Alfredo rinde su ultimo final".

Respuesta: 4 palabras terminan en vocal

Los estudiantes pueden utilizar el editor para responder
*/

int main()
{
    int cantidad_palabras = 0;
    char c;
    char last_char = ' ';
    printf("Por favor ingrese la frase: \n");
    c = getchar();

    putchar(c);
    while (c != '.')
    {
        while (c == ' ' && c != '.')
        {
            c = getchar();
        }
        while (c != ' ' && c != '.')
        {         
            c = getchar();
            putchar(c);
        }
        if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u')
        {
            cantidad_palabras = cantidad_palabras + 1;
        }
    }
    printf("\n\ncantidad_palabras %d \n", cantidad_palabras);
    return 0;
}

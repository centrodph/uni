#include <stdio.h>
#include <stdlib.h>

// a) contar  espacioas en blanco
// b) contar las palabras que empiezan con u

int main()
{
    int espacios = 0;
    int empieza_u = 0;

    char c;

    printf("Por favor ingrese la frase: \n");
    c = getchar();

    putchar(c);
    while (c != '.')
    {
        while (c == ' ')
        {
            espacios += 1;
            c = getchar();
            putchar(c);
        }
        if (c == 'u')
        {
            empieza_u += 1;
        }
        while (c != ' ' && c != '.')
        {
            c = getchar();
            putchar(c);
        }
    }
    printf("cantidad de espacios %d: \n", espacios);
    printf("cantidad de palabras con u %d: \n", empieza_u);
    return 0;
}
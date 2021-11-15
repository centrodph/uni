#include <stdlib.h>
#include <stdio.h>

int main(){
    int c, prim, aux = ' ';
    int cont_a1, cont_a2;
    int cont_b1 = 0;

    printf("Ingrese una frase terminada en punto\n");
    c = getchar();
    prim = c;

    while (c != '.')
    {
        while (c != ' ' && c != '.')
        {
            if (c == 'a' && aux == ' ')
            {
                while (c != ' ' && c != '.')
                {
                    if (aux != ' ')
                    {
                        putchar(c);
                    }
                    else
                    {
                        putchar(prim);
                    }
                    aux = c;
                    c = getchar();
                }

                if (aux == 's')
                {
                    cont_b1++;
                }
            }


            if (c != '.' && c != ' ')
            {
                if (aux != ' ')
                {
                    putchar(c);
                }
                else
                {
                    putchar(prim);
                }
                aux = c;
                c = getchar();
            }
        }

        cont_a1 = 0;

        while (c == ' ' && cont_a1 < 3)
        {
            cont_a1++;
            putchar(c);
            aux = c;
            c = getchar();
        }

        if (cont_a1 < 3)
        {
            for (cont_a2=cont_a1; cont_a2<3; cont_a2++)
            {
                printf(" ");
            }
        }
        else
        {
            while (c == ' ')
            {
                aux = c;
                c = getchar();
            }
        }
    }

    printf("\nLa cantidad de palabras que empiezan por 'a' y terminan en 's' es: %d", cont_b1);


    return 0;
}

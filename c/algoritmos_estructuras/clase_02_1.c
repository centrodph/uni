#include <stdio.h>


int main() {
    int mivector[100];
    int longitud = 0;
    int numero;

    printf("ingresar numero: ");
    scanf("%d", &numero);
    while (numero != -1) {
        mivector[longitud] = numero;
        longitud++;
        printf("ingresar numero: ");
        scanf("%d", &numero);
    }
    
    printf("\nse pusieron %d elementos en el array\n", longitud);
    return 0;
}

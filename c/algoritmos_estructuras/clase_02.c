#include <stdio.h>


void mifuncion(int, int);

int otra_funcion(int*);

int main() {
    int numero = 5;
    mifuncion(5465, 666);

    otra_funcion(&numero);

    printf("el numero despues de la funcion %d \n", numero);
    return 0;
}

int otra_funcion(int* numero) {
    *numero = *numero + 1;
    return numero;
}

void mifuncion(int numero, int otronumero){
    printf("El numero es %d - %d \n", numero, otronumero);
}
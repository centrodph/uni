# include<stdio.h>
# include<stdlib.h>

/**
 * Calcular el índice de masa corporal ingresando el peso de una persona en kilos 
 * y su estatura en metros. Este índice se obtiene realizando el cociente 
 * entre el peso y el cuadrado de la estatura.
 **/
int main() {
    float peso_kg, altura_mts;
    printf("Ingrese su peso: ");
    scanf("%f", &peso_kg);
    printf("Ingrese su altura: ");
    scanf("%f", &altura_mts);

    printf("Su bmi es %f \n", peso_kg / (altura_mts * altura_mts));
    return 0;
}
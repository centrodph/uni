# include<stdio.h>
# include<stdlib.h>

int main() {
    int max_dia = 0;
    float max_cotizacion = 0;
    int dia;
    float cotizacion;
    int c = 1;

    while(c < 31) {
        printf("Ingresar dia: ");
        scanf("%d", &dia);
        printf("Ingresar cotizacion: ");
        scanf("%f", &cotizacion);

        if (cotizacion > max_cotizacion) {
            max_dia = dia;
            max_cotizacion = cotizacion;
        }
        c++;
    }
    printf("El dia de mayor cotizacion fue %d con valor de %f", max_dia, max_cotizacion);
    return 0;
}
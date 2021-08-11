#include <stdio.h>
#include <stdlib.h>

int main(void)    
{
    // este es un comentario
    /**
    comment multi line
    */
  printf("Example!\n");

  // o int numero = 8;
  int numero = 8;
  int numero2 = 2;
  float otronumero = 2.555;
  char c;
  int counttest;

  printf("Mi numero es: %d %d %d\n", numero, numero, 5);

  printf("Otro formato es: %d %c\n", numero, 'P');
  

  printf("Ingrese un numero:\n");
  scanf("%d", &numero); // Comillas simples para una caracter y comillas dobles string


  if ((numero % numero2 == 0 ) && (numero > 0)){
    printf("el numero es par\n");
  } else {
    printf("el numero es impar\n");
  }

  scanf("%d", &counttest);
  while(counttest < 5) {
    counttest++;
  }
  printf("despues del loop %d\n", counttest);


  int i;
  for (i = 0; i < 10; i++) {
    printf("for %d\n", i);
  }





  // return system("pause");
  // return system("read -p 'Press Enter to continue...' var");
}
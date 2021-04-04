print("""

Ingresar un número. Si es positivo, calcular su raíz cuadrada, si es
negativo mostrar su cuadrado y si es cero mostrar “Error. Ha ingresado un valor
nulo”.

""")

numero = int(input("Ingresar un número: "))

print()

if numero > 0:
  print("%s es positivo y su raiz cuadrada es: %s" %(numero, numero ** (1/2)))
elif  numero < 0:
  print("%s es negativo y su cuadrado es: %s" %(numero, numero ** 2))
else :
  print("Error. Ha ingresado un valor nulo")
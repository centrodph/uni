print("""

 Ingresar numeros positivos hasta que se ingrese un cero.
 Se pide calcular la cantidad de numeros primos ingresados.

""")

num = int(input("Ingresar un número: "))
primos = 0

# validar
while num < 0:
    num = int(input("Ingresar un número: "))

while num != 0:
    mitad = num // 2 + 1
    cantidad_divisores = 0
    for i in range(1, mitad, 1):
        if num % i == 0:
            cantidad_divisores += 1
    if cantidad_divisores == 1 or cantidad_divisores == 0:
        primos += 1
    num = int(input("Ingrese un número: "))
    while num < 0:
        num = int(input("Ingrese un número: "))

print('cantidad de numeros primos', primos)

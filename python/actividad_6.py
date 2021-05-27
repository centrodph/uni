print('''
En base a los conceptos vistos en el módulo, debés realizar el siguiente ejercicio: 
Dos números son amigos si cada uno de ellos es igual a la suma de los divisores del otro.
Por ejemplo, 220 y 284 son amigos ya que:
La suma de divisores de 284 es 1 + 2 + 4 + 71 + 142 = 220
La suma de divisores de 220 es:
1 + 2 + 4 + 5 + 10 + 11 + 20 +22 + 44 + 55 + 110 = 284
Construir un algoritmo usando funciones y luego codificarlo en Python para 
que dados dos números determine si son amigos.
''')


def calcular_suma_divisores(num: int):
    medio = (num // 2) + 1
    suma = 0
    for i in range(medio, 0, -1):
        if num % i == 0:
            suma += i
    return suma


num_1 = int(input("Ingrese el primer numero: "))
while num_1 < 0:
    num_1 = int(input("Ingrese el primer numero: "))

num_2 = int(input("Ingrese el segundo numero: "))
while num_2 < 0:
    num_2 = int(input("Ingrese el segundo numero: "))

suma_1 = calcular_suma_divisores(num_1)
suma_2 = calcular_suma_divisores(num_2)

if suma_1 == num_2 and suma_2 == num_1:
    print("Numeros amigos")
else:
    print("No son numeros amigos")

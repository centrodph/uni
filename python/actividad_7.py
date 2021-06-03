print('''
En base a los conceptos vistos en el módulo, debés realizar el siguiente ejercicio: 

Cargar un arreglo con 12 números enteros. Mostrarlo y calcular:

El elemento máximo y mínimo.
Calcular el promedio de los elementos ubicados en posiciones pares.
Calcular la sumatoria de los elementos pares en posiciones impares.
Calcular la cantidad de numeros primos.
''')

numeros = []


def calcular_maximo(nums):
    max = nums[0]
    for i in range(1, len(nums)):
        if max < nums[i]:
            max = nums[i]
    return max


def calcular_min(nums):
    min = nums[0]
    for i in range(1, len(nums)):
        if min > nums[i]:
            min = nums[i]
    return min


def calcular_sumatoria(nums):
    sum = 0
    for i in range(len(nums)):
        sum += nums[i]
    return sum

def calcular_sumatoria_pares(nums):
    sum = 0
    for i in range(len(nums)):
        if nums[i] % 2 == 0:
            sum += nums[i]
    return sum    


def calcular_primos(nums):
    primos = 0
    for i in range(len(nums)):
        num = nums[i]
        mitad = num // 2 + 1
        cantidad_divisores = 0
        for j in range(1, mitad, 1):
            if num % j == 0:
                cantidad_divisores += 1
        if cantidad_divisores == 1 or cantidad_divisores == 0:
            primos += 1


for i in range(12):
    num_1 = int(input("Ingrese el primer numero: "))
    numeros.append(num_1)

suma = calcular_sumatoria(numeros)

print("Maximo", calcular_maximo(numeros))
print("Minimo", calcular_min(numeros))
print("Suma", calcular_sumatoria(numeros))
print("Promedio", suma / len(numeros))
print("Sumatoria pares", calcular_sumatoria_pares(numeros))
print("Numeros primos", calcular_primos(numeros))

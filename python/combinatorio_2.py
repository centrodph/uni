print('''
Ingresar 2 numeros positivos y calcular el numero combinatorio

(n,k) = n! / ((n-k)! * k!)

''')


def calcular_factorial(num: int):
    fac = 1
    for i in range(num, 1, -1):
        fac *= i
    return fac


def obtener_numero():
    num = int(input("ingrese numero: "))
    while num < 0:
        num = int(input("ingrese numero: "))
    return num


num_1 = obtener_numero()
num_2 = obtener_numero()
while num_2 > num_1:
    num_2 = obtener_numero()


print("El combinatorio ", calcular_factorial(num_1) /
      (calcular_factorial(num_1 - num_2) * calcular_factorial(num_2)))

print('''
5! = 5*4*3*2*1
3! =3*2*1
0! = 1
FACTORIAL NO ESTA DEFINIDO PARA LOS NEGATIVOS
Leer 5 número y determinar el factorial de cada uno de ellos
''')


def calcular_factorial(num: int):    
    fac = 1
    if num == 0:
        return 1
    for i in range(num, 1, -1):
        fac *= i
    return fac

for i in range(5):
    num = int(input("ingrese numero: "))
    while num < 0:
        num = int(input("ingrese numero: "))
    print("El factorial es ", calcular_factorial(num))

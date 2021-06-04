print('''
Cargar un arreglo con los 12 primeros números pares leídos.
Se pide:
Mostrarlo invertido.
Buscar el máximo, y cambiar todas las apariciones por 0
Ordenar el arreglo de mayor a menor y mostrarlo.
El programa debe estar modularizado.


Generar otro arreglo con las posiciones del mínimo
Eliminar del nuevo arreglo las posiciones que sean impares
''')

def carga(a):
    while len(a) < 5:
        num = int(input("Ingrese un numero: "))
        if num % 2 == 0:
            a.append(num)

def mostrar_invertido(a):
    for i in range(len(a) -1, -1, -1):
        print(a[i], end=" ")

def buscar_maximo(a):
    max = a[0]
    for i in range(len(a)):
        if max < a[i]:
            max = a[i]
    return max
def buscar_minimo(a):
    min = a[0]
    for i in range(len(a)):
        if min > a[i]:
            min = a[i]
    return min

def reemplazar_numero(num, arr):
    i= 0
    while i < len(arr):
        if num == arr[i]:
            arr[i] = 10
        i += 1
def mostrar(a):
    for i in range(len(a)):
        print(a[i], end=" ")

def posiciones_minimo(a, p, min):
    for i in range(len(a)):
        if a[i] == min:
            p.append(i)

def eliminar_posiciones_impares(a):
    for i in range(len(a) -1 , -1, -1):
        if i % 2 != 0:
            a.pop(i)
    print('eliminar impares', a)

a = []
p = []
carga(a)
print("invertido")
mostrar_invertido(a)
maximo = buscar_maximo(a)
reemplazar_numero(maximo, a)
a.sort(reverse=True)
print('')
print('')
print("comun")
mostrar(a)
print('')
print('')
minimo = buscar_minimo(a)
print('minimo', minimo)
print('')
posiciones_minimo(a, p, minimo)
print(p)
print('')
eliminar_posiciones_impares(p)
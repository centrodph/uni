print('''
Cargar un arreglo con los 12 primeros números pares leídos.
Se pide:
Mostrarlo invertido.
Buscar el máximo, y cambiar todas las apariciones por 0
Ordenar el arreglo de mayor a menor y mostrarlo.
El programa debe estar modularizado
''')

def carga(a):
    while len(a) < 13:
        num = int(input("Ingrese un numero: "))
        if num % 2 == 0:
            a.append(num)

def mostrar_invertido(a):
    for i in range(len(a) -1, 0, -1):
        print(a[i], end=" ")

def buscar_maximo(a):
    max = a[0]
    for i in range(len(a)):
        if max < a[i]:
            max = a[i]
    return max

def reemplazar_numero(num, arr):
    i= 0
    while i < len(arr):
        if num == arr[i]:
            arr[i] = 0
        i += 1
def mostrar(a):
    for i in range(len(a)):
        print(a[i], end=" ")
a = []
carga(a)
print("invertido")
mostrar_invertido(a)
maximo = buscar_maximo(a)
reemplazar_numero(maximo, a)
a.sort(reverse=True)
print("comun")
mostrar(a)
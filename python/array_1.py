from multiprocessing.dummy import Array


print('''

Se leen edades de todos los integrantes de un curso.
Mostrar las edades mayores al promedio del curso.

''')



edades = []
total = 0

def calcular_promedio(total, cantidad):
    return total / cantidad
def obtener_numero():
    num = int(input("ingrese edad. 0 para terminar: "))
    while num < 0:
        num = int(input("ingrese edad. 0 para terminar: "))
    return num


num_1 = obtener_numero()
while num_1 != 0:
    total += num_1
    edades.append(num_1)
    num_1 = obtener_numero()

promedio = calcular_promedio(total, len(edades))


print("El promedio es  ", promedio)
for e in edades:
    if e > promedio:
        print("Es mayor que es promedio", e)


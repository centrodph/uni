print('''
Ingresar nombre y sueldos n personas, se pide mostrat los sueldos de menor a mayor 
y a quien corresponde cada sueldos

ENTRADA:
Juan 	500
Maria 	600
Luis 	100
Eduar  	20
Jose	150

SALIDA:
Eduar 	20
Luis 	100
Jose	150	
Juan	500	
Maria	600
''')


def carga(sueldos, personas):
    cant = int(input("Ingrese la cantidad de personas: "))
    while cant < 0:
        cant = int(input("Ingrese sueldo: "))
    for i in range(cant):
        nom = input("Ingrese nombre: ")
        num = int(input("Ingrese sueldo: "))
        while num < 0:
            num = int(input("Ingrese sueldo: "))
        sueldos.append(num)
        personas.append(nom)


def ordenar(sueldos, personas):
    for i in range(len(sueldos) - 1):
        for j in range(i + 1, len(sueldos)):
            if sueldos[j] < sueldos[i]:
                nom = personas[j]
                sue = sueldos[j]
                personas[j] = personas[i]
                sueldos[j] = sueldos[i]
                personas[i] = nom
                sueldos[i] = sue


def mostrar(sueldos, personas):
    for i in range(len(sueldos)):
        print("Nombre: ", personas[i], "Sueldo: ", sueldos[i])


sueldos = []
personas = []
carga(sueldos, personas)
print("    -----     ")
mostrar(sueldos, personas)
print("    -----     ")
ordenar(sueldos, personas)
mostrar(sueldos, personas)
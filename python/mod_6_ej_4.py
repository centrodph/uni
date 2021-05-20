print('''
. Diseñar un programa que permita ingresar las dimensiones de un ambiente
rectangular y calcular utilizando funciones:
a) La superficie del piso.
b) La superficie de las paredes.
c) El perímetro del ambiente.
d) El costo de alfombrar el ambiente si el metro cuadrado de una alfombra cuesta $104.
e) El costo pintar el ambiente sabiendo que un litro rinde 6 metros cuadrados y el litro
cuesta $83
''')


def calcular_superficie_piso(largo, ancho):
    return largo * ancho


def calcular_superficie_paredes(largo, ancho, alto):
    return (2 * largo * alto) + (2 * ancho * alto)


def calcular_perimetro(largo, ancho):
    return largo * 2 + ancho * 2


largo = int(input("Ingrese el largo: "))
while largo < 0:
    largo = int(input("Ingrese el largo: "))

ancho = int(input("Ingrese el ancho: "))
while ancho < 0:
    ancho = int(input("Ingrese el ancho: "))

alto = int(input("Ingrese el alto: "))
while alto < 0:
    alto = int(input("Ingrese el alto: "))


print("La superficie del piso.", calcular_superficie_piso(largo, ancho))
print("La superficie de las paredes.",
      calcular_superficie_paredes(largo, ancho, alto))
print("El perímetro del ambiente.", calcular_perimetro(largo, ancho))
print("El costo de alfombrar", calcular_superficie_piso(largo, ancho) * 104)
print("El costo pintar ", (calcular_superficie_paredes(largo, ancho, alto) / 6) * 83)

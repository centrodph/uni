print("""

Hallar la longitud de la hipotenusa de un triángulo dada la medida de
sus catetos

""")

cateto_1 = float(input("Ingrese la medida del cateto 1: "))
cateto_2 = float(input("Ingrese la medida del cateto 2: "))

print()

print("La hipotenusa es: %s" %( ((cateto_1 ** 2) + (cateto_2 ** 2)) ** (1 / 2)))

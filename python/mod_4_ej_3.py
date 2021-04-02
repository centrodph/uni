print("""

Convertir longitudes de millas a Km. y de pulgadas a cm., si:
1 milla = 1.60935 Km.
1 pulgada = 2.534 cm

""")

millas = float(input("Ingrese millas: "))
pulgadas = float(input("Ingrese pulgadas: "))

print()

print("%s millas equivale a %s kilometros" %( millas, millas * 1.60935))
print("%s pulgadas equivale a %s centimetros" %( pulgadas, pulgadas * 2.534))

print("""

Calcular el importe que debe pagar una persona compra una heladera
de pesos X y por pagar en efectivo le hacen el 10\% de descuento ¿Cuánto
abona?

""")

precio_heladera = float(input("Ingrese el precio de la heladera: "))

print()

print("Debera abonar $%s" % (precio_heladera * 0.9))

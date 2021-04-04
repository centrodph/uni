print("""

 Ingresar dos números y mostrar con el mensaje correspondiente:

1. La suma.
2. La diferencia.
3. El producto.
4. El resultado de elevar el primero al segundo.

""")

num_1 = int(input("Ingresar un número: "))
num_2 = int(input("Ingresar un número: "))

print()

print("La suma entre %s y %s es: %s" %(num_1, num_2, (num_1 + num_2)))
print("La diferencia entre %s y %s es: %s" %(num_1, num_2, (num_1 - num_2)))
print("El producto entre %s y %s es: %s" %(num_1, num_2, (num_1 * num_2)))
print("Resultado de elevar %s al %s es: %s" %(num_1, num_2, (num_1 ** num_2)))

print("""

Ingresar la medida de un ángulo y determinar si es agudo, obtuso, recto,
nulo o llano. Si el valor ingresado es mayor a 180º mostrar la leyenda “ángulo
no válido” e ingresar un nuevo valor

""")


def showAngulo():
    angulo = int(input("Ingresar la medida del ángulo: "))
    if angulo == 90:
        print("El angulo es recto")
    elif angulo == 180:
        print("El angulo es llano")
    elif angulo == 0:
        print("El angulo es nulo")
    elif angulo > 90 and angulo < 180:
        print("El angulo es obtuso")
    elif angulo < 90 and angulo > 0:
        print("El angulo es agudo")
    else:
        print("ángulo no válido")
        showAngulo()
showAngulo()
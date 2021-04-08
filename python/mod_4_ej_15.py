print("""

Ingresar la medida de un ángulo y determinar si es agudo, obtuso, recto,
nulo o llano. Si el valor ingresado es mayor a 180º mostrar la leyenda “ángulo
no válido” e ingresar un nuevo valor

""")


def mostrarAngulo():
    angulo = int(input("Ingresar la medida del ángulo: "))
    if angulo > 180 or angulo < 0:
        print("ángulo no válido")
        mostrarAngulo()
    elif angulo > 90:
        print("El angulo es obtuso")
    elif angulo == 90:
        print("El angulo es recto")
    elif angulo == 180:
        print("El angulo es llano")
    elif angulo == 0:
        print("El angulo es nulo")
    else:
        print("El angulo es agudo")
    
mostrarAngulo()
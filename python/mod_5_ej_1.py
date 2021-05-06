print('''

Se ingresan 100 números enteros positivos, por cada número ingresado se le solicita
al operador que seleccione la operación a realizar: si el operador ingresa 1, el
programa debe devolver el factorial del numero ingresado; si el operador ingresa
2 el programa debe solicitarle al operador la potencia a la cual quiere elevar el
número ingresado y debe mostrar el resultado y para cualquier otro valor de
operación el programa debe informar si el numero ingresado es par, impar o nulo.

''')

limit = 100

for i in range(100):
    # ingreso numero
    num = int(input("ingrese un numero positivo: "))
    while num < 0:
        num = int(input("ingrese un numero positivo: "))

    # operacion
    option = int(input('''
    ingrese una opcion:
    1 para calcular el factorial
    2 calcule la potencia
    3 saber si es par impar o nulo
    '''))
    while option != 1 and option != 2 and option != 3:
        option = int(input('''
        ingrese una opcion:
        1 para calcular el factorial
        2 calcule la potencia
        3 saber si es par impar o nulo
        '''))

    # calculos
    if option == 1:
        print('calculo factorial')

    elif option == 2:
        print('calculo potencia')
        potencia = int(input("ingrese un numero positivo"))
        print("%d elevado a la %d es : " % (num, potencia ), num ** potencia)
    else:
        if num % 2 == 0:
            print("El numero  %d es par " % num)
        elif num == 0:
            print("El numero es nulo")
        else:
            print("El numero  %d es impar " % num)

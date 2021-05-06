print("""

Una empresa encuesta personas, para ello ingresa su edad, sexo (M o F) y la cantidad de hijos que tiene. 

El ingreso de datos se corta al leer la edad en cero.
Se pide mostrar:
La cantidad de personas encuestadas de cada sexo, y determinar cuál es la mayor población de encuestados
La cantidad de hombres con al menos 2 hijos.
El porcentaje de mujeres mayores a 30 años sobre el grupo de mujers
La edad de la persona que tiene menos hijos.
""")


cantidad_total = 0
cantidad_hombres_con_dos_hijos_o_mas = 0
cantidad_mujeres = 0
cantidad_mujeres_mayores_de_30 = 0
edad_menos_hijos = 0
menos_hijos = -1

edad = int(input("Ingrese su edad: "))
while edad < 0:
    edad = int(input("Ingrese su edad: "))

while edad != 0:
    # sexo
    sexo = input("Ingrese su sexo (M o F): ")
    while sexo != "M" and sexo != "F":
        sexo = input("Ingrese su sexo (M o F): ")
    #cantidad de hijos
    hijos = int(input("Ingrese cantidad de hijos: "))
    while hijos < 0:
        hijos = int(input("Ingrese cantidad de hijos: "))


    # calulos
    cantidad_total += 1
    if sexo == "M":
        cantidad_mujeres += 1
        if edad > 30:
            cantidad_mujeres_mayores_de_30 += 1
    else:
        if hijos >= 2:
            cantidad_hombres_con_dos_hijos_o_mas += 1
    if (hijos > 0) and (menos_hijos == -1  or hijos < menos_hijos):
        edad_menos_hijos = edad
        menos_hijos = hijos


    # reingreso edad
    edad = int(input("Ingrese su edad: "))
    while edad < 0:
        edad = int(input("Ingrese su edad: "))

if cantidad_total > 0:
    print('cantidad de mujeres: ', cantidad_mujeres)
    print('cantidad de hombres: ', cantidad_total - cantidad_mujeres)
    print('cantidad de hombres con al menos 2 hijos: ',
        cantidad_hombres_con_dos_hijos_o_mas)
    if cantidad_mujeres > 0:
        print('porcentaje de mujeres: ', (cantidad_mujeres_mayores_de_30 * 100) / cantidad_mujeres )
    else:
        print('no hay mujeres en la encuenta')
    print('edad_menos_hijos: ', edad_menos_hijos)

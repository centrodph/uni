print("""

Ingresar las edades de dos personas. Si una de ellas es mayor de edad
y la otra menor de edad, calcular y mostrar su promedio. En caso contrario
mostrar las dos edades.

""")

edad_1 = int(input("Ingresar edad persona 1: "))
edad_2 = int(input("Ingresar edad persona 2: "))
edad_limite = 18

def es_mayor_de_edad(edad: int):
  return edad >= edad_limite

if es_mayor_de_edad(edad_1) or es_mayor_de_edad(edad_2):
  print("El promedio es: %s" %((edad_1 + edad_2) / 2))
else :
  print("Las edades ingresadas son: - Edad 1: %s - Edad 2: %s" %(edad_1, edad_2))
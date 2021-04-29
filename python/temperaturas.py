print('''
Se pide ingresar temperaturas hasta leer la temperatura cero. 
indicar la temperatura maxima y minima
''')

num = int(input("ingresar temperatura:"))
max = num
min = num

while num != 0:
    if max < num:
        max = num
    if min > num:
        min = num
    num = int(input("ingresar temperatura:"))

if max != 0:
    print("temperatura maxima", max)
    print("temperatura minima", min)
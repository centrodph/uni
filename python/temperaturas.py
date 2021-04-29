print('''
Se pide ingresar temperaturas hasta leer la temperatura cero. 
indicar la temperatura maxima y minima
''')

max = 0
min = 0
num = int(input("ingresar temperatura:"))
while num != 0:
    if max == 0 or max < num:
        max = num
    if min == 0 or min > num:
        min = num
    num = int(input("ingresar temperatura:"))

if max != 0:
    print("temperatura maxima", max)
    print("temperatura minima", min)
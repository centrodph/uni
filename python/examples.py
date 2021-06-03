a=[]

b=int (input("Ingrese un numero"))

while b > 0:

   if b%2==0 and b%5!=0:

      a.append(b)

   b=int (input("Ingrese un numero")) 

a.sort()      

print(a)  


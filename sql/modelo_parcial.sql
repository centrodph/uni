


-- 1
/**

Cerradura (Cod_cerradura, ce_nombre, precio, ce_stock)
Pieza (Cod_pieza, pi_nombre, Cod_proveedor, costo, pi_stock)
Composicion (Cod_cerradura, Cod_pieza, cant)
Proveedor (Cod_proveedor, Razon_social, Tel, e_mail)

a) Obtener las cerraduras (códigos de cerraduras, nombres y precios) que NO contienen la pieza cuyo
nombre es “Pestillo p32”.

A <- Pieza |X| Composicion
     Pieza.Cod_pieza = Composicion.Cod_pieza
B <- σ(A)   
     A.pi_nombre = "Pestillo p32"
C <- Cerradura |X| B
     B.Cod_cerradura = Cerradura.Cod_cerradura
D <- π(c)
     Cod_cerradura
     ce_nombre
     precio
     ce_stock
π(Cerradura - D)
    Cod_cerradura
    ce_nombre
    precio

**/


-- CLIENTE (Nrocli, Nyape, Domicilio, Localidad, Saldocli)
-- FACTURA (Nrofactura, Cliente, Fecha, Total)
-- DETALLE (Nrofactura, Renglón, Articulo, Cantidad, Preciouni)
-- ARTICULO ( Nroartic, Descripcion, Rubro, Stock, Pto_reposicion, precio)
-- RUBRO(Cod_rubro, Descripcion)

-- 1. Hallar todos los datos de los artículos del rubro 1 y ordenarlos de manera decreciente por precio.

SELECT * from ARTICULO WHERE ARTICULO.rubro = 1 Order by ARTICULO.precio desc


-- 2. Averiguar todos los datos de los clientes que vivan en Capital o en Carapachay y no sean deudores.
-- 3. Listar los datos de los artículos cuya descripción comienza con cuaderno.
-- 4. Listar los artículos que tienen un stock mayor o igual a 100 unidades pero menor o igual a 150 .
-- 5. Mostrar los datos de los artículos del rubro 1 y agregar una columna con el precio incrementado un 25 %. Llamar a la columna calculada “Incremento”.
-- 6. Listar todas las fechas de este año en que se hicieron facturas a consumidores finales (cliente = null).
---   Eliminar las fechas repetidas.
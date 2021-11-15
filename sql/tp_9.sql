/**
CLIENTE (Nrocli, Nyape, Domicilio, Localidad, Saldocli)

FACTURA (Nrofactura, Cliente, Fecha, Total)

DETALLE (Nrofactura, Renglón, Artículo, Cantidad, Preciouni)

ARTICULO (Nroartic, Descripción, Rubro, Stock, Pto_reposicion, precio)

RUBRO (Cod_rubro, Descripcion) 
**/


-- Listar todos los datos de los clientes que NUNCA 
-- compraron durante este año. Ordenar el resultado alfabéticamente por nombre y apellido.
SELECT *
FROM CLIENTE c
WHERE c.NROCLI NOT IN (
SELECT DISTINCT f.CLIENTE
FROM FACTURA f
WHERE YEAR(f.FECHA) = 2021
)

-- Listar todos los datos de los clientes que nunca compraron el artículo con código 4030.
SELECT *
FROM CLIENTE c
WHERE c.NROCLI NOT IN (
SELECT DISTINCT f.CLIENTE
FROM FACTURA f
WHERE f.NROFACTURA IN (
    SELECT DISTINCT d.NROFACTURA
    FROM DETALLE d
    WHERE d.ARTICULO = 4030
) and f.CLIENTE IS NOT NULL
)

-- Listar los datos de las facturas de este año en que se vendieron artículos del rubro clavos (descripción).
SELECT DISTINCT f.*
FROM FACTURA f
    INNER JOIN DETALLE d ON f.NROFACTURA = d.NROFACTURA
WHERE d.ARTICULO IN (
SELECT a.NROARTIC
    from ARTICULO a
    WHERE a.RUBRO IN (
SELECT r.COD_RUBRO
    FROM RUBRO r
    WHERE r.DESCRIPCION = 'Clavos'))
    and YEAR(f.FECHA) = 2021

-- Listar los datos de las facturas de este año en que NO se vendieron artículos del rubro Herramientas eléctricas (descripción).
SELECT f.*
FROM FACTURA f
WHERE f.NROFACTURA IN (
          Select d.nrofactura
    FROM Detalle d
    WHERE d.ARTICULO in (
            SELECT a.NROARTIC
    from ARTICULO a
    WHERE a.RUBRO IN (
                SELECT r.COD_RUBRO
    FROM RUBRO r
    WHERE r.DESCRIPCION = 'Clavos')))
    and YEAR(f.FECHA) = 2021



-- Realizar un listado completo de facturación 
-- que incluya las facturas a consumidores finales (nrocli = NULL) y los clientes que aún no tienen facturación.
-- (Solo las tablas factura y cliente).
SELECT *
FROM FACTURA f
    LEFT JOIN CLIENTE c on f.CLIENTE = c.NROCLI





/**
CLIENTE (Nrocli, Nyape, Domicilio, Localidad, Saldocli)

FACTURA (Nrofactura, Cliente, Fecha, Total)

DETALLE (Nrofactura, Renglón, Artículo, Cantidad, Preciouni)

ARTICULO (Nroartic, Descripción, Rubro, Stock, Pto_reposicion, precio)

RUBRO (Cod_rubro, Descripcion) 
**/


--  Mostrar los datos de los rubros cuyo precio promedio de sus artículos supere los $800 y el rubro tenga más de 2 artículos.

SELECT count(a.NROARTIC) as cant, r.COD_RUBRO, r.DESCRIPCION, avg(a.PRECIO) as prom
FROM ARTICULO a
    INNER JOIN RUBRO r ON r.COD_RUBRO=a.RUBRO
GROUP BY r.COD_RUBRO, r.DESCRIPCION
HAVING avg(a.PRECIO) > 800 and count(a.NROARTIC) > 2


SELECT *
FROM ARTICULO a INNER JOIN RUBRO r ON r.COD_RUBRO=a.RUBRO






--  Mostrar la cantidad de facturas de cada uno de los clientes que hayan comprado los artículos 4000 o 4010 y los datos de dichos clientes.
SELECT count(f.NROFACTURA)
FROM FACTURA f


SELECT c.NROCLI, c.NYAPE, count(distinct ff.NROFACTURA)
FROM FACTURA ff FULL JOIN CLIENTE c ON c.NROCLI = ff.CLIENTE
    INNER JOIN DETALLE d on d.NROFACTURA = ff.NROFACTURA
WHERE d.ARTICULO IN (4000, 4010)
GROUP BY c.NROCLI, c.NYAPE


--  Mostrar los datos de los clientes que compraron artículos del rubro 1 y que tienen más de 2 facturas, mostrar también dicha cantidad


SELECT c.NROCLI, c.NYAPE, c.LOCALIDAD, count(distinct ff.NROFACTURA)
FROM FACTURA ff FULL JOIN CLIENTE c ON c.NROCLI = ff.CLIENTE
    INNER JOIN DETALLE d on d.NROFACTURA = ff.NROFACTURA
    INNER JOIN ARTICULO a on d.ARTICULO = a.NROARTIC
    INNER JOIN RUBRO r on r.COD_RUBRO = a.RUBRO
WHERE r.COD_RUBRO = 1
GROUP BY c.NROCLI, c.NYAPE, c.LOCALIDAD
HAVING count(distinct ff.NROFACTURA) > 2



-- Sumar 2 unidades a la cantidad comprada del artículo con código 4040 en la factura nro. 1005.
UPDATE DETALLE 
SET CANTIDAD = CANTIDAD + 2
WHERE ARTICULO=4040 and NROFACTURA=1005


-- Dar de baja los articulos que nunca se vendieron

SELECT * FROM ARTICULO WHERE NROARTIC NOT IN(
    SELECT NROARTIC FROM DETALLE 
)

DELETE ARTICULO WHERE NROARTIC NOT IN(
    SELECT NROARTIC FROM DETALLE 
)

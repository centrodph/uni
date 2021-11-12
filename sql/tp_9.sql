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
-- Listar los nros. De facturas que tienen el articulo 4000 o el articulo 4010 o el articulo 4020
SELECT DISTINCT FACTURA.NROFACTURA
from FACTURA
    INNER JOIN DETALLE ON  FACTURA.NROFACTURA = DETALLE.NROFACTURA
    INNER JOIN ARTICULO ON DETALLE.ARTICULO = ARTICULO.NROARTIC
WHERE ARTICULO.NROARTIC IN (4000, 4010, 4020);
-- WHERE ARTICULO.NROARTIC = 4000 or ARTICULO.NROARTIC =  4010 or ARTICULO.NROARTIC =   4020

SELECT DISTINCT DETALLE.NROFACTURA
from DETALLE
    INNER JOIN ARTICULO ON DETALLE.ARTICULO = ARTICULO.NROARTIC
WHERE ARTICULO.NROARTIC IN (4000, 4010, 4020);



-- lista facturas que no tengas articulo 400    
SELECT *
from FACTURA
WHERE FACTURA.NROFACTURA not IN (
SELECT DISTINCT DETALLE.NROFACTURA
from DETALLE
WHERE DETALLE.ARTICULO = 4000
)


-- listar todos los clientes que NUNCA compraron durante este año
-- ordenar el resultado alfabeticamente por nombre y apellido
SELECT *
from CLIENTE c
WHERE c.NROCLI  NOT IN (
SELECT f.CLIENTE
from FACTURA f
WHERE YEAR(f.FECHA) = 2021
)
ORDER BY c.NYAPE ASC



-- not exist
SELECT *
FROM Cliente c1
WHERE NOT EXISTS (SELECT *
FROM Cliente c INNER JOIN Factura f ON (f.CLIENTE = c.NROCLI)
WHERE YEAR(f.FECHA) = 2021
    AND c1.NROCLI = c.NROCLI  -- CONDICIÓN DE JUNTA ENTRE QUERY Y SUBQUERY
                    )



-- full join

SELECT *
FROM FACTURA f FULL JOIN CLIENTE c ON (f.CLIENTE = c.NROCLI)



-- funciones de agregacion o columna
SELECT
    max(a.PRECIO) Maximo,
    min(a.PRECIO) Minimo,
    avg(a.PRECIO) Promedio,
    count(a.NROARTIC), -- no cuenta null
    sum(a.PRECIO)
FROM ARTICULO a

-- cantidad de facturas
SELECT count(f.NROFACTURA), count(f.CLIENTE)
from FACTURA f
SELECT f.CLIENTE
from FACTURA f


SELECT count(distinct d.NROFACTURA )
FROM DETALLE d

--  Mostrar los valores entre el máximo y el mínimo de los articulos
SELECT * FROM ARTICULO a 
WHERE 
    a.PRECIO < (SELECT MAX(b.PRECIO) FROM ARTICULO b) 
AND 
    a.PRECIO > (SELECT MIN(b.PRECIO) FROM ARTICULO b)


-- group by
SELECT a.RUBRO, max(a.PRECIO)
FROM ARTICULO a
GROUP BY a.RUBRO



-- Se requiere el valor promedio de las canciones por Genero.
-- SELECT g.Name, g.GenreId, avg(t.UnitPrice) promedio,
-- FROM TRACK t  INNER JOIN GENRE g ON (g.GenreId = t.GenreId)
-- GROUP BY g.Name, g.GenreId









-- 1. Listar todos los datos de los clientes que NUNCA compraron durante 
-- este año. Ordenar el resultado alfabéticamente por nombre y apellido.

-- Paso 1) Buscar el afirmativo
-- Listar todos los datos de los clientes que SI compraron durante 
-- este año. Ordenar el resultado alfabéticamente por nombre y apellido.
SELECT distinct c.*
FROM Factura f inner join Cliente c on (f.CLIENTE = c.NROCLI)
WHERE year(f.FECHA) = 2021

-- Paso 2) Buscar el conjunto al que le voy a restar
SELECT *
FROM Cliente 

-- Restar
SELECT NROCLI
FROM Cliente 
WHERE NROCLI NOT IN (SELECT c.NROCLI
                    FROM Factura f inner join Cliente c on (f.CLIENTE = c.NROCLI)
                    WHERE year(f.FECHA) = 2021)
Order by 1

-- Distintos INNER
-- Listado de facturas y sus correspondientes clientes
SELECT *
FROM Factura f INNER JOIN Cliente c ON (f.CLIENTE = c.NROCLI)

-- Listado de facturas y sus correspondientes clientes, incluso las facturas que quieren cliente
SELECT *
FROM Factura f LEFT JOIN Cliente c ON (f.CLIENTE = c.NROCLI)

SELECT *
FROM Factura f RIGHT JOIN Cliente c ON (f.CLIENTE = c.NROCLI)

SELECT *
FROM Factura f FULL JOIN Cliente c ON (f.CLIENTE = c.NROCLI) 

-- TEMA NUEVO
-- Funciones de Agregación o columna
SELECT max(a.PRECIO) as "Maximo", min(a.PRECIO) as "Minimo", avg(a.PRECIO) as "Promedio",
    count(a.NROARTIC), sum(a.PRECIO)
FROM ARTICULO a

-- count
-- no cuenta nulos

-- Cantidad de facturas vs Cantidad de facturas (con clientes)
SELECT count(f.NROFACTURA), count(f.CLIENTE)
FROM Factura f

-- Ojo con contar mal
SELECT count(d.NROFACTURA), count(distinct d.NROFACTURA)
FROM Detalle d


-- Mostrar los valores entre el máximo y el mínimo
-- de los articulos

Select precio
From Articulo 
Where precio < (Select max(precio) from Articulo)
And precio > (Select min(precio) from Articulo)




-- Buscar el máximo valor de articulo por rubro
Select a.rubro, max(a.precio), sum(a.precio), avg(a.PRECIO)
From Articulo a
Group by a.rubro


-- El motor busca los codigos de rubros distintos y con eso conforma los grupos
-- 
Select distinct a.rubro
From articulo a


-- Se requiere el valor promedio de las canciones por Genero.
SELECT g.name, g.GenreId, avg(t.unitprice) Promedio
FROM Track t inner join Genre g ON (t.genreid = g.GenreId)
Group by g.GenreId, g.Name

-- SELECT 
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY

-- El total facturado de este año por cliente (nombre y apellido), pero
-- solo los que facturaron mas de 200
SELECT c.FirstName, c.LastName, sum(i.total)
FROM Invoice i INNER JOIN Customer c ON (i.CustomerId = c.CustomerId)
-- WHERE sum(i.total) > 200 -- es para condiciones a nivel  de registros
WHERE year(i.InvoiceDate) = 2021
GROUP BY c.FirstName, c.LastName
HAVING sum(i.Total) > 200

-- El total facturado de este año por cliente (id de cliente, nombre y apellido), pero
-- solo los que tiene mas 2 facturas
SELECT c.FirstName, c.LastName, c.CustomerId, sum(i.Total)
FROM Invoice i INNER JOIN Customer c ON (i.CustomerId = c.CustomerId)
WHERE year(i.InvoiceDate) = 2021
GROUP BY c.FirstName, c.LastName, c.CustomerId
HAVING count(i.InvoiceId) > 2


-- Listado de artistas (nombre) con su cantidad de canciones, y cantidad de albumes
SELECT a.Name, count(distinct am.AlbumId), count(t.TrackId)
FROM Artist a LEFT JOIN Album am on (a.ArtistId = am.AlbumId)
           INNER JOIN Track t ON (am.AlbumId = t.AlbumId)
--WHERE 
GROUP BY a.Name, a.ArtistId


Select a.ArtistId, am.AlbumId, t.TrackId
FROM Artist a LEFT JOIN Album am on (a.ArtistId = am.AlbumId)
           INNER JOIN Track t ON (am.AlbumId = t.AlbumId)
--WHERE 









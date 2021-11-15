







-- Practica 9 
-- 1) Listar todos los datos de los clientes que NUNCA compraron durante este año. Ordenar el resultado alfabéticamente por nombre y apellido.
-- 2) Listar todos los datos de los clientes que nunca compraron el artículo con código 4030.

SELECT *
   FROM CLIENTE c1 
   WHERE NOT EXISTS(SELECT *
					FROM CLIENTE c inner join FACTURA f on (f.cliente = c.NROCLI)
					inner join DETALLE d on (d.nrofactura = f.nrofactura)
					WHERE d.Articulo = 4030
					AND c1.NROCLI = c.NROCLI)


SELECT *
FROM CLIENTE c
WHERE c.NROCLI NOT IN (
            SELECT DISTINCT f.CLIENTE
            FROM FACTURA f
            WHERE f.NROFACTURA IN (SELECT DISTINCT d.NROFACTURA
                                FROM DETALLE d
                                WHERE d.ARTICULO = 4030
                                )
            )


SELECT *
FROM CLIENTE
WHERE NROCLI NOT IN (
                  SELECT CLIENTE
                  FROM DETALLE INNER JOIN FACTURA ON (DETALLE.NROFACTURA = FACTURA.NROFACTURA)
                      inner join cliente on (factura.cliente = cliente.NROCLI)
                  WHERE ARTICULO = 4030);


-- 3) Listar los datos de las facturas de este año en que se vendieron artículos del rubro clavo (descripción).

        SELECT f.*
				FROM FACTURA f inner join DETALLE d on (d.nrofactura = f.nrofactura)
								inner join ARTICULO a on (a.Nroartic = d.Articulo)
								inner join RUBRO r on (a.Rubro = r.Cod_rubro)
				WHERE r.Descripcion = 'Clavos'    
        AND year(f.fecha) = 2021

SELECT *
FROM FACTURA
WHERE YEAR(FECHA) = 2021 
AND NROFACTURA IN( SELECT NROFACTURA
            FROM DETALLE
            WHERE ARTICULO IN (SELECT NROARTIC
                      FROM ARTICULO  
                      WHERE RUBRO IN (SELECT COD_RUBRO
                                      FROM RUBRO
                                      WHERE DESCRIPCION = 'Clavos')
                                  )
                      )

SELECT DISTINCT f.*
FROM FACTURA f INNER JOIN DETALLE d ON f.NROFACTURA = d.NROFACTURA
WHERE d.ARTICULO IN (SELECT a.NROARTIC
            from ARTICULO a
            WHERE a.RUBRO IN (SELECT r.COD_RUBRO
                      FROM RUBRO r
                      WHERE r.DESCRIPCION = 'Clavos'))
and YEAR(f.FECHA) = 2021


-- 4) Listar los datos de las facturas de este año en que NO se vendieron artículos del rubro electrodomésticos (descripción).

SELECT *
FROM FACTURA f1 
WHERE YEAR(f1.FECHA)=2021
AND NOT EXISTS (SELECT *
				FROM FACTURA f inner join DETALLE d on (d.nrofactura = f.nrofactura)
                inner join ARTICULO a on (a.Nroartic = d.Articulo)
								inner join RUBRO r on (a.Rubro = r.Cod_rubro)
				WHERE year(f.fecha) = 2021
				AND  r.Descripcion = ''
				AND f1.nrofactura = f.nrofactura)

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
                WHERE r.DESCRIPCION = 'Herramienta Eléctrica')))
and YEAR(f.FECHA) = 2021
  

      
Select *
From rubro 



-- 5) Realizar un listado completo de facturación que incluya las facturas a consumidores finales (nrocli = NULL) y los clientes que aún no tienen facturación.
--(Solo las tablas factura y cliente).





-- Practica 10 :



--  Mostrar el mejor precio de cada rubro, la cantidad de artículos del rubro, el código de rubro y la descripción del rubro.

SELECT max(a.precio), count(a.nroartic), r.codrubro, r.descripcion
FROM Articulo a inner join Rubro r ON (a.RUBRO = r.COD_RUBRO)
Group by a.rubro, r.DESCRIPCION

-- tambien puede ser asi
SELECT max(a.precio), count(a.nroartic), r.codrubro, r.descripcion
FROM Articulo a inner join Rubro r ON (a.RUBRO = r.COD_RUBRO)
Group by r.cod_rubro, r.descripcion


--  Mostrar los datos de los rubros cuyo precio promedio de sus artículos supere los $800 y el rubro tenga más de 2 artículos.

SELECT r.cod_rubro, r.descripcion, avg(a.precio)
FROM ARTICULO a inner join RUBRO r on (a.Rubro = r.cod_rubro)
GROUP BY r.cod_rubro, r.descripcion
HAVING count(a.nroartic) > 2 AND avg(a.precio) > 800  

SELECT count(a.NROARTIC) as cant, r.COD_RUBRO, r.DESCRIPCION, avg(a.PRECIO) as prom
FROM ARTICULO a   INNER JOIN RUBRO r ON r.COD_RUBRO=a.RUBRO
GROUP BY r.COD_RUBRO, r.DESCRIPCION
HAVING avg(a.PRECIO) > 800 and count(a.NROARTIC) > 2

SELECt r.COD_RUBRO, r.DESCRIPCION
FROM ARTICULO a INNER JOIN RUBRO r ON (a.rubro = r.COD_RUBRO)
GROUP BY r.COD_RUBRO, r.DESCRIPCION
HAVING AVG(a.Precio) > 800 AND COUNT(a.NROARTIC) > 2


--  Mostrar la cantidad de facturas de cada uno de los clientes que hayan comprado los artículos 4000 o 4010 y los datos de dichos clientes.

SELECT count(distinct f.Nrofactura), c.NROCLI,c.nyape,c.domicilio,c.localidad,c.saldoCli
FROM CLIENTE c  inner join FACTURA f on (f.cliente = c.NROCLI)
				inner join DETALLE d on (f.nrofactura = d.nrofactura)
WHERE d.articulo = 4000 OR d.articulo= 4010
GROUP BY /*f.nrofactura, */c.NROCLI,c.nyape,c.domicilio,c.localidad,c.saldoCli

SELECT c.NROCLI, c.NYAPE, c.DOMICILIO, c.LOCALIDAD, c.SALDOCLI, COUNT(distinct f.NROFACTURA) AS CantFacturas
FROM FACTURA f INNER JOIN CLIENTE c ON (f.CLIENTE = c.NROCLI)
             INNER JOIN DETALLE d ON (f.NROFACTURA = d.NROFACTURA)
WHERE d.ARTICULO = 4000 OR d.ARTICULO = 4010
GROUP BY /*f.NROFACTURA, */c.NROCLI, c.NYAPE, c.DOMICILIO, c.LOCALIDAD, c.SALDOCLI;

SELECT c.NROCLI, c.NYAPE, count(distinct ff.NROFACTURA) 
FROM FACTURA ff INNER JOIN CLIENTE c ON c.NROCLI = ff.CLIENTE 
    INNER JOIN DETALLE d on d.NROFACTURA = ff.NROFACTURA
WHERE d.ARTICULO IN (4000, 4010)
GROUP BY c.NROCLI, c.NYAPE

--  Mostrar los datos de los clientes que compraron artículos del rubro 1 y que tienen más de 2 facturas, mostrar también dicha cantidad.

SELECT c.NROCLI, c.NYAPE, count( ff.NROFACTURA), count(distinct ff.NROFACTURA)
FROM FACTURA ff FULL JOIN CLIENTE c ON c.NROCLI = ff.CLIENTE
    INNER JOIN DETALLE d on d.NROFACTURA = ff.NROFACTURA
    INNER JOIN ARTICULO a on d.ARTICULO = a.NROARTIC
    INNER JOIN RUBRO r on r.COD_RUBRO = a.RUBRO
WHERE r.COD_RUBRO = 1
GROUP BY c.NROCLI, c.NYAPE
HAVING count( distinct ff.NROFACTURA) > 2

SELECT c.NROCLI, c.NYAPE, c.DOMICILIO, c.LOCALIDAD, c.SALDOCLI, count(distinct f.nrofactura)
FROM FACTURA f INNER JOIN CLIENTE c ON (f.CLIENTE = c.NROCLI)
             INNER JOIN DETALLE d ON (f.NROFACTURA = d.NROFACTURA)
			 INNER JOIN ARTICULO a ON (a.Nroartic = d.articulo)
WHERE a.rubro = 1
GROUP BY c.NROCLI, c.NYAPE, c.DOMICILIO, c.LOCALIDAD, c.SALDOCLI
HAVING COUNT(distinct f.nrofactura) > 2

SELECT c.nrocli, c.nyape, c.domicilio, c.localidad, c.saldocli, COUNT(DISTINCT f.NROFACTURA) AS CantidadFacturas
FROM CLIENTE c INNER JOIN FACTURA f ON (c.nrocli = f.CLIENTE)
				INNER JOIN DETALLE d ON (d.NROFACTURA = f.NROFACTURA)
                INNER JOIN ARTICULO a ON (d.ARTICULO = a.NROARTIC)
WHERE a.RUBRO = 1
GROUP BY c.nrocli, c.nyape, c.domicilio, c.localidad, c.saldocli
HAVING COUNT(DISTINCT f.NROFACTURA) > 2  

-- Realizar un listado completo de facturación que incluya las facturas a 
-- consumidores finales (nrocli = NULL) y los clientes que aún no tienen facturación.


SELECT *
FROM Factura f full join Cliente c on (f.CLIENTE = c.NROCLI)











--------------------------------------------------------------------------------------
-- Insert : Ingresar un nuevo registro en una articulo

-- con las columnas
INSERT INTO ARTICULO (NROARTIC, DESCRIPCION, RUBRO, STOCK, PTO_REPOSICION, PRECIO)
VALUES ('5000','Moladora 2',4,123,555,3000.00);

-- sin las columnas (debo saber el orden)
INSERT INTO ARTICULO 

VALUES ('5000','Moladora 2',4,123,555,3000.00);

-- con menos columnas
INSERT INTO ARTICULO (NROARTIC, DESCRIPCION, RUBRO, PRECIO)
VALUES ('5000','Moladora 2',4,3000.00);


-- Insert multiple
INSERT INTO ARTICULO (NROARTIC, DESCRIPCION, RUBRO, PRECIO)
VALUES ('5001','Moladora 2',4,3000.00), ('5002','Moladora 2',4,3000.00), ('5003','Moladora 2',4,3000.00);

Select * from articulo where descripcion = 'Moladora 2';


-- DELETE

-- DELETE FROM [TABLA]
-- WHERE [condiciones]

-- Borrar los articulos con descripción 'Moladora 2'

DELETE FROM ARTICULO
WHERE DESCRIPCION = 'Moladora 2'

-- Eliminar/Borrar los articulos del rubro "Herramienta Eléctrica"

    SELECT *
    FROM ARTICULO
    WHERE RUBRO IN (SELECT COD_RUBRO
                    FROM RUBRO
                    WHERE DESCRIPCION = 'Herramienta Eléctrica')


    DELETE FROM ARTICULO
    WHERE RUBRO IN (SELECT COD_RUBRO
                    FROM RUBRO
                    WHERE DESCRIPCION = 'Herramienta Eléctrica')

--    insert into articulo (NROARTIC,DESCRIPCION,RUBRO,STOCK,PTO_REPOSICION,PRECIO)
-- values (4040,'Moladora',4,123,555,3000.00), 
-- (4080,'Soldador',4,623,999,900.00);


-- Borrar los clientes que no hayan comprado articulos 4030 este año
        SELECT *
        FROM Cliente 
        WHERE NROCLI NOT IN (SELECT f.CLIENTE
                            FROM Factura f inner join Detalle d on (f.NROFACTURA = d.NROFACTURA)
                            WHERE d.ARTICULO = 4030
                            AND year(f.FECHA) = 2021
                            )


        DELETE FROM Cliente 
        WHERE NROCLI NOT IN (SELECT f.CLIENTE
                            FROM Factura f inner join Detalle d on (f.NROFACTURA = d.NROFACTURA)
                            WHERE d.ARTICULO = 4030
                            AND year(f.FECHA) = 2021
                            )


-- UPDATE : Modificar valores de las columnas de uno o mas registros
-- campo = columna = atributo

/* UPDATE tabla
SET campo1 = X1, campo2 = x2, ..... campoN = xn
WHERE condición */

-- Modificar el precio actual del articulo 4030, en 20 

UPDATE ARTICULO 
SET precio = 20 
WHERE NROARTIC = 4030 

Select *
From ARTICULO
Where NROARTIC = 4030

-- Aumentar en un 20% los articulos del rubro con codigo 4
UPDATE ARTICULO
SET precio = precio * '1.2'
WHERE RUBRO = 4

SELECT *
From ARTICULO
Where RUBRO = 4

-- Aumentar en un 20% los articulos del rubro con codigo 4, y modificar su punto de reposición
-- incrementandolo en 100.
UPDATE ARTICULO
SET precio = precio * '1.2', PTO_REPOSICION = PTO_REPOSICION + 100
WHERE RUBRO = 4


-- Aumentar el total en un 10% de las facturas donde se vendieron articulos con codigo 4030

    SELECT *
    FROM factura
    WHERE NROFACTURA in (SELECT NROFACTURA
                        from DETALLE 
                        WHERE ARTICULO = 4030)


    UPDATE FACTURA
        SET total = total * 1.10
    WHERE NROFACTURA in (SELECT NROFACTURA
                        from DETALLE 
                        WHERE ARTICULO = 4030)     

-- CLIENTE (Nrocli, Nyape, Domicilio, Localidad, Saldocli)
-- FACTURA (Nrofactura, Cliente, Fecha, Total)
-- DETALLE (Nrofactura, Renglón, Artículo, Cantidad, Preciouni)
-- ARTICULO (Nroartic, Descripción, Rubro, Stock, Pto_reposicion, precio)
-- RUBRO(Cod_rubro, Descripcion)
-- Sumar 2 unidades a la cantidad comprada del artículo con código 4040 en la factura nro. 1005.    
SELECT * FROM DETALLE

    UPDATE detalle
        SET Cantidad = Cantidad +2
    WHERE ARTICULO = 4040 and Nrofactura = 1005

-- Dar de baja a los artículos que nunca se vendieron.
SELECT *
FROM ARTICULO
WHERE NroArtic NOT IN (SELECT DISTINCT Articulo
						FROM DETALLE)


DELETE FROM ARTICULO
WHERE NroArtic NOT IN (SELECT DISTINCT Articulo
						FROM DETALLE)


-- i) Listar las cerraduras (Cod_cerradura, ce_nombre, precio, ce_stock) que contienen más de 10 piezas diferentes 
-- del proveedor con código p148 y el valor promedio de las piezas de cada una de esas cerraduras.

SELECT c.Cod_cerradura, c.ce_nombre, c.precio, c.ce_stock, avg(p.costo)
FROM Cerradura cer inner join Composicion com ON (cer.Cod_cerradura = com.Cod_cerradura)
					inner join Pieza p (com.Cod_pieza = p.Cod_pieza)
WHERE p.Cod_proveedor = 'p148' 
GROUP BY c.Cod_cerradura, c.ce_nombre, c.precio, c.ce_stock
HAVING count(distinct p.Cod_pieza) > 10


SELECT c.Cod_cerradura, c.ce_nombre, c.precio, c.ce_stock, AVG(pie.Costo) AS ValorPromedio
FROM CERRADURA c INNER JOIN COMPOSICION comp ON (c.Cod_cerradura = comp.Cod_cerradura)
    INNER JOIN PIEZA pie ON (pie.Cod_pieza = comp.Cod_pieza)
WHERE pie.Cod_proveedor = 'p148'
GROUP BY c.Cod_cerradura, c.ce_nombre, c.precio, c.ce_stock
HAVING COUNT(DISTINCT comp.cod_pieza) > 10



-- iii) Listar las cerraduras ( Cod_cerradura, ce_nombre, precio, ce_stock) que NO contienen piezas del proveedor arg432 (código).            





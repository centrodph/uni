

-- ej 9.	
-- Mostrar el nombre de los empleados, su comisión y 
-- un cartel que diga ¨Sin comisión¨ para aquellos empleados que tienen su comisión en nulo.
select first_name, decode(commission, null, 'Sin comision', commission)
from employee
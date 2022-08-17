-- ej 9.	
-- Mostrar el nombre de los empleados, su comisión y 
-- un cartel que diga ¨Sin comisión¨ para aquellos empleados que tienen su comisión en nulo.
select first_name, decode(commission, null, 'Sin comision', commission)
from employee;


select first_name, hire_date 
from employee 
where EXTRACT(YEAR FROM TO_DATE(hire_date, 'dd/mm/yy')) = 2006;


select first_name, hire_date 
from employee 
where hire_date between to_date('01/01/06', 'dd/mm/yy') and to_date('31/12/06', 'dd/mm/yy');

select * from department;

insert into department
(department_id, name, location_id)
values
(33, 'Ptest', 122);

delete from department 
where department_id = 33;


update department
set name = 'actualizado'
where department_id = 20;



savepoint 1;
commit;
rollback;



-- bloques anonimos
declare
    /*
    declaraciones
    */
begin
    /*
    ejecucion
    */
    null;
    exception
    /*
    manejo de excepciones
    */
end;


declare
    v_nombre     varchar2(15);
    v_edad       number(2);
    v_fecha      date;
    v_encontre   boolean;
    v_precio     number(6,2); -- 9999,99 4 enteros y 2 decimales
begin 
    v_nombre := 'Ale';
    dbms_output.put_line('Nombre: '||v_nombre);
end;
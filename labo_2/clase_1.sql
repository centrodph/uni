SELECT first_name, last_name, name 
FROM 
    employee e,
    department d
WHERE 
    d.department_id = e.department_id
    AND e.department_id = 10
ORDER BY first_name


SELECT DISTINCT(name) FROM department

/*
Test
*/

-- test


SELECT DISTINCT manager_id , salary
from employee
order by manager_id, salary






SELECT * 
from  product
where 
        -- product_id between 100860 and 100870
        -- description  like 'A%'
        upper(description) like upper('_e%')
        -- product_id = 100860
        --  product_id > 100860




-- concatenar
select first_name ||' '|| last_name ||' '|| salary
from employee


-- valores nulos
SELECT * 
FROM employee
where commission is not null

-- variables de sustitucion
select * 
from employee
where department_id = :depto


-- funciones de fila simple
select 
    initcap(first_name) 
from employee

select 
    substr(description, 1, 5)
from product

select trim('                         hola mundo   ')
from dual


select lpad('hola', 10, '-')
from dual

select rpad('hola', 10, '*')
from dual

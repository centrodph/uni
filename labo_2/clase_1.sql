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


select round(254.15123123, 2)
from dual

select trunc(254.12312)
from dual

SELECT sysdate
from 

select user
from dual


select first_name, last_name, salary, nvl(commission, 0), salary + nvl(commission, 0) as salary_total
from employee




select 
    to_char(250.25), 
    to_char(sysdate, 'dd-mm-yyyy hh24:mi:ss'),
    to_char(sysdate, 'yy')
from dual



select to_number('855,25')
from dual



select to_date('01/01/2020', 'dd/mm/yyyy')
from dual


select department_id, name, decode(location_id, 122, 'loc 1222',
                                            124, 'Mar del plata',
                                            123, 'dsds',
                                            'Otra localidad')
from department d





-- funciones de GROUP
select 
            department_id, 
            count(employee_id), 
            round(avg(salary), 2),
            max(salary),
            min(salary)
from employee
group by department_id



select 
            department_id, 
            count(employee_id), 
            round(avg(salary), 2),
            max(salary),
            min(salary)
from employee
group by department_id
having count(employee_id) > 3


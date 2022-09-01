

-- clase 4

/**
excepciones pre definidas

no_data_found
too_many_rows
dup_val_on_index
value_error
zero_divide


no predefinidas

-2291  --   existe padre
-2292  --   existen hijos


del -19999 a 0

excepciones del usuario

del -49000 a -20000


**/


declare 
    v_dep_name department.name%type;
begin
    select name
    into v_dep_name
    from department
    where department_id = 10;

    dbms_output.put_line(v_dep_name);
exception
    when no_data_found then
        dbms_output.put_line('no existe departament');
end;


-- provocar error
declare 
    v_dep_name department.name%type;
    e_fk exception;
    pragma exception_init(e_fk,-2291);
begin
    select name
    into v_dep_name
    from department
    where department_id = 10;

    insert 
    into department
    (department_id, name, location_id)
    values
    (99, 'Prueba', 111);

    dbms_output.put_line(v_dep_name);
exception
    when no_data_found then
        dbms_output.put_line('no existe departament');
    when e_fk then
        dbms_output.put_line('no existe localidad indicada');
end;

-- provocar error
declare 
    v_dep_name department.name%type;
    e_fk exception;
    pragma exception_init(e_fk,-2291);
begin
    select name
    into v_dep_name
    from department
    where department_id = 10;

    dbms_output.put_line(8/0);

    insert 
    into department
    (department_id, name, location_id)
    values
    (99, 'Prueba', 111);

    dbms_output.put_line(v_dep_name);
exception
    when no_data_found then
        dbms_output.put_line('no existe departament');
    when e_fk then
        dbms_output.put_line('no existe localidad indicada');
    when others then
            dbms_output.put_line('error inesperado '|| sqlerrm);
            dbms_output.put_line('error code '|| sqlcode);
end;




-- provocar error propio
declare 
    v_dep_name department.name%type;
    e_fk exception;
    pragma exception_init(e_fk,-2291);
begin
    raise_application_error(-20001, 'error propio');

    dbms_output.put_line(v_dep_name);
exception
    when no_data_found then
        dbms_output.put_line('no existe departament');
    when e_fk then
        dbms_output.put_line('no existe localidad indicada');
    when others then
            dbms_output.put_line('error inesperado '|| sqlerrm);
            dbms_output.put_line('error code '|| sqlcode);
end;







-- provocar error propio
declare 
    v_nombre varchar2(5);
begin
    v_nombre := 'Martin';

    dbms_output.put_line('nombre '||v_nombre);
exception
    when value_error then
        raise_application_error(-20001, 'el nombre ingresa es demasiado largo');
end;



--- cursores
/*
    explicitos
        -declarar
           -- cursor
           -- registro
        -abrir
        -recorrer
        -cerrar
    implicitos
        -vienen dados


    los cursores tiene atributos
    %found
    %notfound
    %rowcount
    %isopen
    %isclose
*/


-- ej recorer cursor


declare
    v_nombre varchar2(10);
    cursor c_cli is
    select customer_id, name 
    from customer
    where salesperson_id = 7789;

    r_cli c_cli%rowtype;

begin
    open c_cli;
    loop
        fetch c_cli into r_cli;
        exit when c_cli%notfound;

        dbms_output.put_line(r_cli.customer_id||' '||r_cli.name||' rowcount: '||c_cli%rowcount);

    end loop;
    close c_cli;
    dbms_output.put_line('work');
end;



declare

    cursor c_cli is
    select customer_id, name 
    from customer
    where salesperson_id = 7789;

begin
    for r_cli in c_cli loop
        dbms_output.put_line(r_cli.customer_id||' '||r_cli.name||' rowcount: '||c_cli%rowcount);
    end loop;
    dbms_output.put_line('work');
end;





-- implicitos
begin
    update employee
    set commission = 20
    where department_id = 33;

    if sql%rowcount > 0 then
        dbms_output.put_line('se modificaron: '||sql%rowcount || ' filas');
    else
        dbms_output.put_line('no existen empleados en el departamento indicado');
    end if;
end;



-- store procedure
CREATE OR REPLACE PROCEDURE suma (num1 IN number, num2 IN number, v_total OUT number)
IS
-- declarativa
begin
    v_total := num1 + num2;

end;


declare 
    v_num1 number(8) := 5;
    v_num2 number(8) := 20;
    v_total number(8) := 0;
begin
    suma(v_num1, v_num2, v_total);
    dbms_output.put_line('total '||v_total);
end;


CREATE OR REPLACE PROCEDURE alCubo (num IN OUT number)
IS
-- declarativa
begin
    num := num * num;
end;

declare 
    v_num1 number(8) := 5;
    v_num2 number(8) := 20;
    v_total number(8) := 0;
begin
    alCubo(v_num1);
    dbms_output.put_line('total '||v_num1);
end;


-- validar estatus de estore procedure

select status from all_objects where object_name = 'ALCUBO';





create or replace procedure "INSERT_PRODUCT"
(p_id IN product.product_id%type,
p_nombre in product.description%type)
is
begin
    insert into product values(p_id,p_nombre);
    dbms_output.put_line('executed');
exception
    when dup_val_on_index then
        dbms_output.put_line('clave duplicada '||sqlerrm);
end;


begin
    insert_product(1055, 'test nuevo product');
end;

select * from product where product_id=1055;



create or replace procedure "PR_UPDATE_ID_DEPTO"
(p_id IN product.product_id%type)
is
begin
    update department set name = 'FINANZAS'
    where department_id = p_id;
    if sql%rowcount = 0 then
        dbms_output.put_line('no actualizo departments');
    else
        dbms_output.put_line('actualizo '|| sql%rowcount);
    end if;    
    dbms_output.put_line('executed');
end;


begin
    PR_UPDATE_ID_DEPTO(30);
end;






-- hacer un procdure
-- cree depto, pasan un nombre, y opcional localidad
-- si no tengo localidad pongo la localidad 122
-- y id tiene que ser calculado en base al max

CREATE OR REPLACE procedure "PR_ALTA_DEP"
(pi_nombre IN VARCHAR2,
pi_loc_id IN number default 122) 
is
    l_max_id department.department_id%type;
begin
    select max(department_id)
    into l_max_id
    from department;

    insert into department
    (department_id, name, location_id)
    values
    (l_max_id+1, pi_nombre, pi_loc_id);
end;



begin
    PR_ALTA_DEP('tetsstst');
end;


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

        dbms_output.put_line(r_cli.customer_id||' '||r_cli.name);

    end loop;
    dbms_output.put_line('work');
end;
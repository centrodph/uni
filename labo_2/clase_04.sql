

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












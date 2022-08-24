declare
    v_nombre employee.first_name%type;
begin
    select first_name
        into v_nombre
        from employee
        where employee_id=7369;

    dbms_output.put_line('nombre: '||v_nombre);
end;
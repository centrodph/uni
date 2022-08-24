-- select into es solo para 1 fila
-- si es mas de 1 o ninguna genera una excepcion




declare
    v_nombre employee.first_name%type;
    v_salary employee.salary%type;
begin
    select 
            first_name, salary
        into 
            v_nombre, v_salary
        from employee
        where employee_id = 736;

    dbms_output.put_line('nombre: '||v_nombre||' salario: '||v_salary);
exception
    when no_data_found then
        dbms_output.put_line('No existe el empleado');
end;
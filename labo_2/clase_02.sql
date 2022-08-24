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






declare
    v_nombre employee.first_name%type;
    v_salary employee.salary%type;
begin
    select 
            first_name, salary
        into 
            v_nombre, v_salary
        from employee
        where department_id = 10;

    dbms_output.put_line('nombre: '||v_nombre||' salario: '||v_salary);
exception
    when no_data_found then
        dbms_output.put_line('No existe el empleado');
    when too_many_rows then
        dbms_output.put_line('Existe  mas de un empleado');
end;


declare
    v_nombre employee.first_name%type;
    v_salary employee.salary%type;
begin 
    begin
        select 
                first_name, salary
            into 
                v_nombre, v_salary
            from employee
            where employee_id = 736;
    exception
        when no_data_found then
        dbms_output.put_line('Exception !');
    end;

    dbms_output.put_line('fin programa');
end;


-- CONDICIONALES
IF <condicion> then
    xxxx;
end if;

IF <condicion> then
    xxxx;
else
    yyyyy;    
end if;


IF <condicion> then
    xxxx;
elsif <condicion 2> then
    yyyyy;
elsif <condicion 3> then
    adasda;    
end if;




declare
    v_edad number(2);
begin
    v_edad := 20;

    if v_edad < 18 then
        dbms_output.put_line('Secundario');
    else
        dbms_output.put_line('Universidad');
    end if;
end;




-- LOOPS

loop
    xxxx;
    exit when <condition>
end loop;

while <condicion> loop
    xxx;
end loop;


for i in [reverse]1..5 loop
    xxx
    xxx
end loop;    



begin
    for i in 1..5 loop
        dbms_output.put_line('posicion:='||i);
    end loop;
end;

begin
    for i in reverse 1..5 loop
        dbms_output.put_line('posicion:='||i);
    end loop;
end;
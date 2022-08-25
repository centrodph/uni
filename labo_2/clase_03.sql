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



-- ej, ingresar un numero por pantalla y mostrar los multiplos de 2 menores al numero ingresado
declare
    v_tope number(2);
    v_multiple number(3);
begin
    v_tope := :ingrese_valor_maximo;
    v_multiple := 2;

    while v_multiple <= v_tope loop
        dbms_output.put_line(v_multiple);
        v_multiple := v_multiple + 2;
    end loop;

    dbms_output.put_line('fin');
end;


----------------------

variables 
    -  Escalares -> varchar2, date, number
    -  Compuestas -> Record, collections

atributo 
    %TYPE
        tipo de dato columna de tabla

    %ROWTYPE   
        tipo de dato que tiene el registro de tabla












declare
    type tr_emp is record(
        emp_id employee.employee_id%type,
        nombre employee.first_name%type,
        apellido employee.last_name%type,
        salario employee.salary%type
    );

    type tt_emp is table of tr_emp index by binary_integer;

    t_emp tt_emp;
begin

    t_emp(1).emp_id := 8;
    t_emp(1).nombre := 'EXAMPLE';

    t_emp(2).emp_id := 12;
    t_emp(2).nombre := 'PEPE';

    for i in 1..2 loop
        dbms_output.put_line('id: '||t_emp(i).emp_id);
        dbms_output.put_line('nombre: '||t_emp(i).nombre);
    end loop;

    dbms_output.put_line('-'||'fin'||'-');

end;




---- atributos

/*

ej

2
3
5
8
50
51

    table.count => 6
    table.exists(5) =>true/false
    .first  => index del primer registro
    .last   =>  index del ultimo
    .next(8)   => 50
    .prior(51)  => 50
    .delete(5)  => borra el registro con index index
    .trim    => borra la tabla

*/

declare
    type tr_emp is record(
        emp_id employee.employee_id%type,
        nombre employee.first_name%type,
        apellido employee.last_name%type,
        salario employee.salary%type
    );

    type tt_emp is table of tr_emp index by binary_integer;

    t_emp tt_emp;
    l_idx binary_integer;
begin

    t_emp(3).emp_id := 8;
    t_emp(3).nombre := 'EXAMPLE';

    t_emp(5).emp_id := 12;
    t_emp(5).nombre := 'PEPE';

    t_emp(28).emp_id := 23;
    t_emp(28).nombre := 'gperru test';

    l_idx := t_emp.first;

    while l_idx <= t_emp.last loop
        dbms_output.put_line('id: '||t_emp(l_idx).emp_id||'  nombre: '||t_emp(l_idx).nombre);
        l_idx := t_emp.next(l_idx);
    end loop;

    dbms_output.put_line('-'||'fin'||'-');

end;




-- ej, ingresar un numero por pantalla y mostrar los POTENCIAS de 2 menores al numero ingresado
declare
    v_tope number(2);
    v_multiple number(3);
begin
    v_tope := :ingrese_valor_maximo;
    v_multiple := 2;

    while v_multiple <= v_tope loop
        dbms_output.put_line(v_multiple);
        v_multiple := v_multiple * 2;
    end loop;

    dbms_output.put_line('fin');
end;
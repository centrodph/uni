


--- cursores con parametros


-- id department, muestre los empleados

create or replace procedure listo_emp
    (p_depto in department.department_id%type) is
    cursor c_emp is
        select first_name || ', ' || last_name as nombre
        from employee
        where department_id = p_depto;
    
    v_i number :=0;
    v_x varchar2(1);
    begin
        select 'x' into v_x from department where department_id = p_depto;
        for r_emp in c_emp loop
            dbms_output.put_line(r_emp.nombre);
            v_i := v_i +1;
        end loop;

        if v_i = 0 then
            dbms_output.put_line('departamento sin empleados');
        end if;
    exception
        when no_data_found then
            dbms_output.put_line('departamento no existe');
end listo_emp;

declare
    v_num  number(2) :=1;
begin
    listo_emp(v_num);
end;







---- cursores anidados o encadenados

-- todos los empleados de cada departamento
create or replace procedure lista_emple_por_depto
is
    cursor c_dep is select department_id id, name from department order by department_id;
    cursor c_emp (p_id_dep number) is select employee_id id, first_name nombre, last_name apellido from employee where department_id = p_id_dep;
    v_i number :=0;
begin
    for r_dep in c_dep loop
        dbms_output.put_line('Deparamento: '||r_dep.name||' - '||r_dep.id);
        for r_emp in c_emp (r_dep.id) loop
            dbms_output.put_line('Empleado: '||r_emp.nombre||' - '||r_emp.apellido);
            v_i := v_i +1;
        end loop;
        if v_i = 0 then
            dbms_output.put_line('departamento sin empleados');
        end if;
        v_i:=0;
    end loop;
end lista_emple_por_depto;

declare
    v_num  number(2) :=1;
begin
    lista_emple_por_depto();
end;


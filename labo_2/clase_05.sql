


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


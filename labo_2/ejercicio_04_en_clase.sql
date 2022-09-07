/**

hacer un Procedimiento que muestre por pantalla
todos los clientes de un vendedor
en código de vendedor se recibe como paramentro en el procedimiento
para cada cliente mostrar
nombre , limite de crédito, leyenda(crédito)

Leyenda crédito
<= 4000 "BAJO"
4001 y 8500 "MEDIO"
>8501 "ALTO"
**/
create or replace procedure list_clientes_ven(vendedor_id in employee.employee_id%type) is
        cursor c_cus is
        select name as cu_name, credit_limit as cu_limit
        from customer
        where salesperson_id = vendedor_id;
    v_i number :=0;
    v_x varchar2(1);
    v_leyend varchar2(20);
    begin
        dbms_output.put_line('vendedor '||vendedor_id||' --------------------------------------------------');
        for r_cus in c_cus loop
            if r_cus.cu_limit <=  4000 then
                v_leyend :='BAJO';
            elsif r_cus.cu_limit <=  8500 then
                v_leyend :='MEDIO';
            else
                v_leyend :='ALTO';
            end if;
            dbms_output.put_line('Customer: '||r_cus.cu_name||' Limit: '||r_cus.cu_limit||' Level: '||v_leyend);
            v_i := v_i +1;
        end loop;

        if v_i = 0 then
            select 'x' into v_x from employee where employee_id = vendedor_id;
            dbms_output.put_line('vendedor sin clientes');
        end if;
    exception
        when no_data_found then
            dbms_output.put_line('vendedor no existe');
end list_clientes_ven;

declare
    v_num  number(4) :=7844;
begin
    list_clientes_ven(v_num);
    list_clientes_ven(7521);
end;
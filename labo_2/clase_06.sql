create or replace 
    function valida_cliente(nombre IN customer.name%type)
    return customer.customer_id%type is
    v_cli_id customer.customer_id%type;
begin
      select customer_id
        into v_cli_id
        from CUSTOMER
       where customer.name = nombre;
    return v_cli_id;
exception
        when no_data_found then
            raise_application_error(-20001, 'empleado no encontrado');
end;


declare
    cli_id customer.customer_id%type;
    e_cli_no_ex exception;
    pragma exception_init(e_cli_no_ex, -20001);
begin
    cli_id := valida_cliente('Ale');
exception
    when     e_cli_no_ex then
        dbms_output.put_line('Empleado not found');
end;



/**

Crear un procedimiento para dar de alta un departamento
Recibe por parametros el nombre y el id de localidad.
Devuelve por parametro en id de nuevo departamento creado.
Para generar el nuevo id, se le suma 1 al maximo existente en la tabla
Contemplar todos los errores posibles.
Nunca cancelar

**/
create or replace procedure 
    alta_dep (nombre IN department.name%type, id_loc IN department.location_id%type, id_dep OUT department.department_id%type ) is
    
    max_id department.department_id%type;
    e_fk exception;
    pragma exception_init(e_fk, -2291);
begin

    select nvl(max(department_id), 0)+1 into max_id from department;
    id_dep := max_id;
    insert into department 
    (department_id, name, location_id)
    values
    (id_dep, nombre, id_loc);
    dbms_output.put_line('Insertado correctamente');
exception    
    when e_fk then
        dbms_output.put_line('localidad no encontrada');
    when others then
        dbms_output.put_line('error inesperado '||sqlerrm);    
end;


declare
    id_dep department.department_id%type;
begin
    alta_dep('xx1', 11, id_dep);

    dbms_output.put_line('id_dep>'||id_dep);
end;






/**
    crear un proc lista productos
    
    por cada producto 
        product_id
        description
        fecha de la ultima venta

        historial precios
            f_desde
            f_hasta
            p_min
            p_lista

            ordenado por vigencia
    en caso que nunca se haya vendido informarlo en reemplazo de la fecha
**/
create or replace procedure 
    lista_prod_test is
    cursor c_productos is select product_id, description from product;
    cursor c_precios (p_product_id product.product_id%type) is select start_date, end_date, LIST_PRICE, MIN_PRICE 
         from price 
        where price.product_id=p_product_id 
        order by start_date;
    v_last_sell varchar2(10);
    begin
    for item_product in c_productos loop
        
        select nvl(to_char(max(sales_order.ORDER_DATE)), 'No vendido') into v_last_sell 
         from item, sales_order 
        where item.product_id = item_product.product_id
          and item.order_id = sales_order.order_id;
        
        dbms_output.put_line('------------------------------------');
        dbms_output.put_line('producto: '||item_product.product_id||' - '||item_product.description||'--'||v_last_sell);

        for item_history in c_precios (item_product.product_id) loop            
            dbms_output.put_line('++ '||item_history.start_date||' - '||item_history.end_date||' - '||item_history.LIST_PRICE||item_history.MIN_PRICE);
        end loop;
    end loop;
    dbms_output.put_line('works');
    end;

begin
    lista_prod_test();
end;







create or replace
procedure pr_modifica_vendedor
    (pi_cliente in customer.customer_id%type,
    pi_vendedor in employee.employee_id%type) is

    e_fk exception;
    pragma exception_init(e_fk, -2291);
begin
    update customer
    set salesperson_id=pi_vendedor
    where customer.customer_id=pi_cliente;

    if sql%rowcount = 1 then
        dbms_output.put_line('cliente modificado');
    else
        dbms_output.put_line('client no existe');
    end if;
exception
    when e_fk then    
        dbms_output.put_line('vendedor no existe');
    when others then    
        dbms_output.put_line('error inesperado'||sqlerrm);        
end;
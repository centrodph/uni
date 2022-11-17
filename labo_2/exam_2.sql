
create or replace package PA_CLIENTES as

PROCEDURE pr_baja_cliente (pi_id_cliente customer.customer_id%type);
PROCEDURE pr_baja_cliente (pi_name_cliente customer.name%type);
PROCEDURE pr_listar (pi_id_cliente customer.customer_id%type);
end;



create or replace package body "PA_CLIENTES" is

    e_emp_noex exception;
    e_emp_dupl exception;
    e_emp_otro exception;
    pragma exception_init(e_emp_noex,-20001);
    pragma exception_init(e_emp_dupl,-20002);
    pragma exception_init(e_emp_otro,-20003);


    /**
    crear tabla
    **/
    type tr_customer is record(
        p_customer_id customer.customer_id%type,
        p_customer_name customer.name%type,
        p_customer_ventas EMPLOYEE.first_name%type,
        p_cantidad_ordenes number
    );
    type tt_customers is table of tr_customer index by binary_integer;
    t_customers tt_customers;


/***************************************************/
-- Función privada que retorne el id de un cliente. Recibira por parámetro el nombre del cliente y devolver el ID. En caso de no poder hallar el dato provocar una excepción propia.
function fu_cli_id(pi_name_cliente customer.name%type)
                 return  customer.customer_id%type is
  v_customer_id customer.customer_id%type;
begin
    select customer_id into v_customer_id from CUSTOMER where upper(name) = upper(pi_name_cliente);
    return v_customer_id;

  exception
    when no_data_found then
      raise_application_error(-20001,'customer no existe');
    when too_many_rows then  
      raise_application_error(-20002,'mas de un customer');
    when others then
      raise_application_error(-20003,'error inesperado '||sqlerrm);        
  end;                 

-- funcion para borrar
function fu_delete_cli_id(pi_id_cliente customer.customer_id%type) 
    return number is
begin
        delete from  customer where customer_id = pi_id_cliente;
        
        if sql%rowcount = 1 then  
            dbms_output.put_line('Customer eliminado correctamente');
        else
            dbms_output.put_line('Customer no encontrado');
        end if;
        return sql%rowcount;
  end; 
/***************************************************/


PROCEDURE pr_baja_cliente (pi_id_cliente customer.customer_id%type)
is
    v_count number;
begin
   v_count := fu_delete_cli_id(pi_id_cliente);
end;
/**********************************************/
PROCEDURE pr_baja_cliente (pi_name_cliente  customer.name%type) 
is
  v_cli_id customer.customer_id%type;
  v_count number;
begin
    v_cli_id := fu_cli_id(pi_name_cliente);
    v_count := fu_delete_cli_id(v_cli_id);
exception
  when e_emp_noex then
    dbms_output.put_line('customer no existe');
  when e_emp_dupl then
    dbms_output.put_line('customer con nombre duplicado');
  when e_emp_otro then
    dbms_output.put_line('error inesperado el buscar el customer '||sqlerrm);

 end;
 /****************************************************/ 

/***************************************************/


PROCEDURE pr_listar (pi_id_cliente customer.customer_id%type)
is
    tr_cli tr_customer;
     cursor c_orders  is
        select order_id, total, order_date from SALES_ORDER where customer_id = pi_id_cliente order by order_id DESC;

    cursor c_order_items  (p_order_id SALES_ORDER.order_id%type) is
        select i.item_id, p.description, i.actual_price, i.quantity, i.total from item i, product p where order_id = p_order_id and i.product_id = p.product_id;
begin
    -- select * into tr_cli from t_customers where p_customer_id = pi_id_cliente;
    select c.customer_id, c.name, e.first_name, count(s.order_id)
     into tr_cli
    from customer c, employee e, SALES_ORDER s
    where e.employee_id = salesperson_id and c.customer_id = s.customer_id and c.customer_id = pi_id_cliente
    group by c.customer_id, c.name, e.first_name
    order by count(s.order_id) DESC;
    

    dbms_output.put_line  ('CLIENTE '|| tr_cli.p_customer_name || '  VENDEDOR  '||tr_cli.p_customer_ventas || ' CANTIDAD ORDENES  '||tr_cli.p_cantidad_ordenes);
    dbms_output.put_line (' ---------------------------------------------------------------------------------------- ');
    
    for v_o in c_orders loop        
        dbms_output.put_line  ('orderid '|| v_o.order_id || '  fecha  '||v_o.order_date || ' total  '||v_o.total);
        dbms_output.put_line (' -- ');
        dbms_output.put_line (' Ítem_id   producto (desc) precio  cant  Total ');
        for v_i in c_order_items (v_o.order_id) loop
            dbms_output.put_line  (v_i.item_id||'  '||v_i.description||'   '||v_i.quantity||'   '||v_i.actual_price||'  '||v_i.total);
        end loop;      
     dbms_output.put_line ('---');
   end loop;
end;
/**********************************************/

/*one time only*/
begin
    dbms_output.put_line('Primera vez');
    select c.customer_id, c.name, e.first_name, count(s.order_id) 
    bulk collect into t_customers
    from customer c, employee e, SALES_ORDER s
    where e.employee_id = salesperson_id and c.customer_id = s.customer_id group by c.customer_id, c.name, e.first_name
    order by count(s.order_id) DESC;

end;


begin
    PA_CLIENTES.pr_listar(100);
end;



/*
    CLASE 9
*/

create or replace package P_ORDENES as
procedure p_id_orden (
   p_id_cliente in sales_order.customer_id%type,
   P_fecha_entrega in sales_order.ship_date%type,
   p_id_orden out sales_order.order_id%type
);

procedure pr_alta_order (
   p_id_cliente in sales_order.customer_id%type,
   p_id_orden out sales_order.order_id%type
);

end P_ORDENES;
/******SPEC*********/


create or replace package body P_ORDENES as
    procedure p_id_orden (
    p_id_cliente in sales_order.customer_id%type,
    P_fecha_entrega in sales_order.ship_date%type,
    p_id_orden out sales_order.order_id%type
    ) is

        v_order_id sales_order.order_id%type;
    begin

        select order_id
        into v_order_id
        from sales_order
        where customer_id = p_id_cliente and ship_date = P_fecha_entrega;


        p_id_orden := v_order_id;
        dbms_output.put_line('ORDER_ID: '|| v_order_id);

        exception
            when no_data_found then
                dbms_output.put_line('No existe ordenes para ese id y fecha');
            when too_many_rows then
                dbms_output.put_line('devuelve mas de una fila');


        
    end p_id_orden;


    procedure pr_alta_order (
    p_id_cliente in sales_order.customer_id%type,
    p_id_orden out sales_order.order_id%type
    ) is
        l_max_id sales_order.order_id%type;
    begin

        select max(order_id) + 1 into l_max_id from sales_order;

        insert into sales_order (
            order_id,
            order_date,
            ship_date,
            customer_id,
            total
        ) values (
            l_max_id,
            sysdate,
            sysdate+7,
            p_id_cliente,
            0
        );

        p_id_orden := l_max_id;

    end pr_alta_order;



end P_ORDENES;



declare
    v_order_id sales_order.order_id%type;
begin
    -- P_ORDENES.p_id_orden(101, to_date('03/21/2010'), v_order_id);
    P_ORDENES.pr_alta_order(104, v_order_id);

    dbms_output.put_line(v_order_id);
end;
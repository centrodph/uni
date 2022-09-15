
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
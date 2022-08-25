declare
    v_date_input varchar2(10) := :INGRESE_EDAD;
    v_date date := to_date(v_date_input, 'dd/mm/yyyy');
    v_age number(3) := (sysdate - v_date) / 365;

begin

if v_age <= 2 then
    dbms_output.put_line('bebe');
elsif v_age <=5 then
    dbms_output.put_line('jardín');
elsif v_age <=12 then
    dbms_output.put_line('primaria');
elsif v_age <=17 then
    dbms_output.put_line('secundaria');
elsif v_age <=25 then
    dbms_output.put_line('universidad');
else    
    dbms_output.put_line('trabajo');
end if;
    dbms_output.put_line('works='||v_date_input);
    dbms_output.put_line('age='||v_age);
end;
-- packages

CREATE OR REPLACE PACKAGE DEMO is
    G_iva number :=21; -- variable global
    procedure Anual_comision; -- prcedimiento global
    procedure Informe (Fecha IN Date default sysdate); -- proc publico
    end;

create or replace package body demo is
    -- cursor privado c_emp
    cursor c_emp is select * from employee order by last_name;

    -- private function
    function iva_de (n in number) return number is
        begin
            return ( n * G_iva, 2);
        end;

    procedure Anual_comision is 
        begin
            for emp_recg in c_emp loop
                if iva_de (emp_reg.salary) then
                    --condition
                end if;
                -- update emp
        end Anual_comision;

    procedure Informe (Fecha IN Date default sysdate) is
        begin
            null;
        end Informe;
end;
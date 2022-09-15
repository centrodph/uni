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

    select max(department_id)+1 into max_id from department;
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
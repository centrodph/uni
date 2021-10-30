select 
    *
from 
    CLIENTE inner join FACTURA on CLIENTE.NROCLI = FACTURA.CLIENTE
WHERE
    year (FACTURA.FECHA) = 2021;
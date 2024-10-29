SELECT c.nombre,c.apellido,c.DNI,c.telefono,c.direccion
FROM Cliente c
INNER JOIN Factura f ON c.idCliente = f.idCliente
WHERE (f.fecha BETWEEN '1/1/2017' AND '31/12/2017')

EXCEPT

SELECT c.nombre,c.apellido,c.DNI,c.telefono,c.direccion
FROM Cliente c
INNER JOIN Factura f ON c.idCliente = f.idCliente
WHERE (f.fecha < '1/1/2017' AND f.fecha > '31/12/2017')
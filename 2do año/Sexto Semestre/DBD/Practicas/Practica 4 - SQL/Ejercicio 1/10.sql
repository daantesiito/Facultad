SELECT c.DNI, c.apellido, c.nombre
FROM Cliente c
INNER JOIN Factura f ON c.idCliente = f.idCliente
GROUP BY c.DNI, c.apellido, c.nombre
HAVING SUM(f.total) > 1000000
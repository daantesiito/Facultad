SELECT f.nroTicket, f.total, f.fecha, f.hora, (SELECT DNI FROM Cliente c WHERE c.idCliente = f.idCliente) as DNI_Cliente
FROM Factura f
INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
INNER JOIN Producto p ON d.idProducto = p.idProducto
WHERE p.nombreP = 'prod38' OR
(SELECT f.nroTicket
FROM Factura f
WHERE (f.fecha BETWEEN '1/1/2019' AND '31/12/2019'))
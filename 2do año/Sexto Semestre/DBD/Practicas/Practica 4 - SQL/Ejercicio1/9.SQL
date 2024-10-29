SELECT f.nroTicket, f.total, f.fecha, f.hora
FROM Factura f
INNER JOIN Cliente c ON f.idCliente = c.idCliente
WHERE c.nombre = 'Jorge Perez' 

AND NOT EXISTS

(SELECT p.idProducto
FROM Producto p
INNER JOIN Detalle d ON p.idProducto = d.idProducto
WHERE (f.nroTicket = d.nroTicket) AND (p.nombreP = 'Producto Z'))
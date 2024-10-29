SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p
INNER JOIN Detalle d ON p.idProducto = d.idProducto
INNER JOIN Factura f ON d.nroTicket = f.nroTicket
INNER JOIN Cliente c ON f.idCliente = c.idCliente
WHERE c.DNI = '45789456' 

EXCEPT

SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto P
INNER JOIN Detalle d ON p.idProducto = d.idProducto
INNER JOIN Factura f ON d.nroTicket = f.nroTicket
INNER JOIN Cliente c ON f.idCliente = c.idCliente
WHERE c.apellido = 'Garcia'
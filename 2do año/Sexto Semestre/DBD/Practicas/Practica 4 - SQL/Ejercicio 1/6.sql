SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c
INNER JOIN Factura f ON c.idCliente = f.idCliente
INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
INNER JOIN Producto p ON d.idProducto = p.idProducto
WHERE p.nombreP = 'Producto A' 

AND 

EXISTS (
    SELECT c.idCliente
    FROM Cliente c
    INNER JOIN Factura f ON c.idCliente = f.idCliente
    INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
    INNER JOIN Producto p ON d.idProducto = p.idProducto
    WHERE p.nombreP = 'Producto B'
) 

AND 

NOT EXISTS (
    SELECT c.idCliente
    FROM Cliente c
    INNER JOIN Factura f ON c.idCliente = f.idCliente
    INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
    INNER JOIN Producto p ON d.idProducto = p.idProducto
    WHERE p.nombreP = 'Producto C'
)

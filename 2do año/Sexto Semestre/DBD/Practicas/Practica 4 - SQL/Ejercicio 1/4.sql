SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p
WHERE p.idProducto NOT IN (
    SELECT p.idProducto
    FROM Producto p
    INNER JOIN Detalle d ON p.idProducto = d.idProducto
    INNER JOIN Factura f ON d.nroTicket = f.nroTicket
    INNER JOIN Cliente c ON f.idCliente = c.idCliente
    WHERE c.telefono LIKE '221%'
)
ORDER BY p.nombreP
SELECT p.nombreP, P.descripcion, P.precio, COALESCE(SUM(d.cantidad), 0) as suma_vendidos
FROM Producto p
LEFT JOIN Detalle d ON p.idProducto = d.idProducto
GROUP BY p.idProducto
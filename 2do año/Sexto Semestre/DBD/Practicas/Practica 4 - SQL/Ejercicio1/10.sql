SELECT c.DNI, c.apellido, c.nombre
FROM Cliente c
WHERE 
	(SELECT sum(f.total) as sumaTotal
	FROM Factura f
	WHERE c.idCliente = f.idCliente)
	> 10000000

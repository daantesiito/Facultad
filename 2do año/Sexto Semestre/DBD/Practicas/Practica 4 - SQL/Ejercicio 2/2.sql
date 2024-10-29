SELECT p.DNI, p.nombre, p.apellido, p.fnac, (SELECT l.nombreL FROM Localidad l WHERE p.codigoPostal = l.codigoPostal) as Nombre_Localidad
FROM Podador p
INNER JOIN Poda po ON p.DNI = po.DNI
WHERE po.codPoda IN
	(SELECT po.codPoda
	FROM Poda po
	WHERE po.fecha BETWEEN '2023-01-01' AND '2023-12-31')


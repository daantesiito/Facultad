SELECT p.DNI,p.Nombre,p.Apellido,p.Domicilio,p.Telefono
FROM Paciente p
INNER JOIN Turno t ON p.DNI = t.DNI
WHERE t.Nombre = "OSDE" 
AND p.DNI IN(
	SELECT p.DNI
	FROM Paciente p
	INNER JOIN Turno t ON p.DNI = t.DNI
	WHERE t.Nombre = "IOMA"
	)

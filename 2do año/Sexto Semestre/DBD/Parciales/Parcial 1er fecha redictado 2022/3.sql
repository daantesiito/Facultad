SELECT p.DNI,p.Nombre,p.Apellido,p.Domicilio,p.Telefono
FROM Paciente p
INNER JOIN Turno t ON p.DNI = t.DNI
WHERE t.fecha BETWEEN "01-01-2021" AND "31-12-2021" 
AND p.DNI NOT IN(
	SELECT p.DNI
	FROM Paciente p
	INNER JOIN Turno t ON p.DNI = t.DNI
	WHERE t.fecha BETWEEN "01-01-2019" AND "31-12-2019"
)
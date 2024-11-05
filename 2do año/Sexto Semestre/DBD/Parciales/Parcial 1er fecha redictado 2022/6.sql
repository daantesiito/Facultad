SELECT p.DNI,p.Nombre,p.Apellido,p.Telefono,p.Domicilio
FROM Paciente p
INNER JOIN Turno t ON p.DNI = t.DNI
WHERE t.fecha BETWEEN "01-01-2020" AND "31-12-2020"
GROUP BY p.DNI,p.Nombre,p.Apellido,p.Telefono,p.Domicilio
HAVING COUNT(p.DNI) > 5
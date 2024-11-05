SELECT e.Matricula, e.Nombre, e.Apellido, COUNT(t.Matricula) as Cantidad
FROM Especialista e 
INNER JOIN Turno t ON e.Matricula = t.Matricula
WHERE t.fecha BETWEEN "01-01-2022" AND "31-12-2022"
GROUP BY e.Matricula,e.Nombre,e.Apellido
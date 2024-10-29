SELECT a.especie, a.años, a.calle, a.nro
FROM Arbol a
INNER JOIN Poda po ON a.nroArbol = po.nroArbol
INNER JOIN Podador p ON po.DNI = p.DNI
WHERE (p.nombre = 'Juan' AND p.apellido = 'Perez' OR 
	  p.nombre = 'Jose' AND p.apellido = 'Garcia')
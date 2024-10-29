SELECT p.DNI, p.nombre, p.apellido, p.fnac, p.codigoPostal
FROM Podador p
WHERE p.apellido LIKE '%ata' 
AND p.DNI IN
    (SELECT p.DNI
    FROM Podador p
    INNER JOIN Poda po ON p.DNI = po.DNI
    WHERE po.DNI = p.DNI AND po.fecha BETWEEN '2024-01-01' AND '2024-12-31') 
ORDER BY p.apellido, p.nombre
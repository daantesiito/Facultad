SELECT a.especie, a.años, a.calle, a.nro, a.codigoPostal
FROM Arbol a
WHERE a.nroArbol NOT IN
(SELECT a.nroArbol
FROM Arbol a
INNER JOIN Poda po ON a.nroArbol = po.nroArbol
WHERE a.nroArbol = po.nroArbol)
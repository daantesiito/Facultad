SELECT a.especie, a.años, a.calle, a.nro
FROM Arbol a
INNER JOIN Poda po ON a.nroArbol = po.nroArbol
WHERE po.fecha BETWEEN '2022-01-01' AND '2022-12-31'

AND a.nroArbol NOT IN

(SELECT a.nroArbol
FROM Poda po
INNER JOIN Arbol a ON po.nroArbol = a.nroArbol
WHERE po.fecha BETWEEN '2023-01-01' AND '2023-12-31')
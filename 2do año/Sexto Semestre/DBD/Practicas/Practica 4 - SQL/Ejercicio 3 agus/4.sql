SELECT j.DNI, j.nombre, j.apellido
FROM Jugador j
INNER JOIN Ciudad ciu ON j.codigoCiudad = ciu.codigoCiudad
WHERE ciu.nombre = "Cordoba"
GROUP BY j.DNI, j.nombre, j.apellido
HAVING j.edad > "29"


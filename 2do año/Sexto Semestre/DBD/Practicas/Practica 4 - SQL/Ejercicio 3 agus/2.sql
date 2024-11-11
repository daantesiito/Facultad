SELECT club.nombre
FROM Club
INNER JOIN ClubJugador cj ON club.codigoClub = cj.codigoClub
WHERE cj.DNI NOT IN (
	SELECT j.DNI
	FROM Ciudad ciu
	INNER JOIN Jugador j ON ciu.codigoCiudad = j.codigoCiudad
	WHERE ciu.nombre = "Berisso"
	)
	
	
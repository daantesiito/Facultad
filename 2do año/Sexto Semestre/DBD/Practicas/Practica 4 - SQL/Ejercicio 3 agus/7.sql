SELECT club.nombre
FROM Club
WHERE club.codigoClub NOT IN (
	SELECT cj.codigoClub
	FROM ClubJugador cj
	INNER JOIN Jugador j ON cj.DNI = j.DNI
	INNER JOIN Ciudad ciu ON j.codigoCiudad = ciu.codigoCiudad
	WHERE ciu.nombre = 'Mar del Plata'
	)
	
	
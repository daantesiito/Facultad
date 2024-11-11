SELECT Club.nombre, Club.anioFundacion
FROM Club
WHERE Club.codigoClub NOT IN
	(SELECT Club.codigoClub
	FROM Club
	INNER JOIN Estadio e ON Club.codigoClub = e.codigoClub)
	
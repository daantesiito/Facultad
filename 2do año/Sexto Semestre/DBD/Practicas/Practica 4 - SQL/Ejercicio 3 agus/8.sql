SELECT j.nombre, j.apellido
FROM Jugador j
WHERE NOT EXISTS ( SELECT *
				FROM Club
				WHERE NOT EXISTS ( SELECT *
								FROM ClubJugador cj
								WHERE cj.DNI = j.DNI AND
									cj.codigoClub = club.codigoClub))
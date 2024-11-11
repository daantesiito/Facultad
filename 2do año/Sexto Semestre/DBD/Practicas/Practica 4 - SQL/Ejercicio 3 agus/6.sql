SELECT j.DNI, j.nombre, j.apellido, j.edad, COUNT(cj.codigoClub) AS cant_Equipos
FROM Jugador j
JOIN ClubJugador cj ON j.DNI = cj.DNI
GROUP BY j.DNI, j.nombre, j.apellido, j.edad;


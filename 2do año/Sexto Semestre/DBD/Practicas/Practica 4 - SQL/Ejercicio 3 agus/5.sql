SELECT club.nombre, AVG(j.edad) as edad_promedio
FROM Club
INNER JOIN ClubJugador cj ON club.codigoClub = cj.codigoClub
INNER JOIN Jugador j ON cj.DNI = j.DNI
GROUP BY club.nombre



SELECT j.DNI, j.nombre, j.apellido
FROM Jugador j
INNER JOIN ClubJugador cj ON j.DNI = cj.DNI
INNER JOIN Club ON club.codigoClub = cj.codigoClub
WHERE club.nombre = "Gimnasia y Esgrima La Plata"



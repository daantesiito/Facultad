SELECT a.DNI, a.pasaporte, a.nombre, a.apellido, a.fnac, a.telefono, l.nombreL
FROM Artista a
INNER JOIN Localidad l ON a.codigoPostalVive = l.codigoPostal
INNER JOIN Artista_Obra ao ON a.idArtista = ao.idArtista
WHERE ao.fechaI = 2022
GROUP BY a.DNI, a.pasaporte, a.nombre, a.apellido, a.fnac, a.telefono, l.nombreL
HAVING COUNT (ao.idArtista) > 2
ORDER BY a.apellido, a.nombre


SELECT a.DNI, a.pasaporte, a.nombre, a.apellido, a.fnac, a.telefono, l.nombreL
FROM Artista a
INNER JOIN Localidad l ON a.codigoPostalVive = l.codigoPostal
INNER JOIN Artista_Obra ao ON a.idArtista = ao.idArtista
INNER JOIN Obra o ON ao.nroObra = o.nroObra
WHERE o.fechaCrea < '1890'


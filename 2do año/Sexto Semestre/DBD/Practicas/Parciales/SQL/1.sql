SELECT o.idTipo, o.fechaCrea, o.nombreO, o.calle, o.nro, l.nombreL
FROM Obra o
INNER JOIN Localidad l ON o.codigoPostal = l.codigoPostal
INNER JOIN Artista_Obra ao ON o.nroObra = ao.nroObra
INNER JOIN Artista a ON ao.idArtista = a.idArtista
WHERE a.dni = "2222222" 
					AND a.pasaporte IN (
									SELECT a.pasaporte
									FROM Artista a
									WHERE a.pasaporte = "AR123456" 
									)
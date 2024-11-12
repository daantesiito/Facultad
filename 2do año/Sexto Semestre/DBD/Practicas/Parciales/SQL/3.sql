SELECT o.idTipo, o.fechaCrea, o.nombreO, o.calle, o.nro, l.nombreL
FROM Obra o
INNER JOIN Localidad l ON o.codigoPostal = l.codigoPostal
WHERE NOT EXISTS(
			SELECT ao.nroObra
			FROM Artista_Obra ao
)

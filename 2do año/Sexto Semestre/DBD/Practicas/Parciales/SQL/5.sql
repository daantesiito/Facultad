SELECT o.idTipo, o.fechaCrea, o.nombreO
FROM Obra o
WHERE NOT EXISTS (
	SELECT *
	FROM Artista a
	WHERE NOT EXISTS(
		SELECT *
		FROM Artista_Obra ao
		WHERE ao.idArtista = a.idArtista AND
			  ao.nroObra = o.nroObra))
			  
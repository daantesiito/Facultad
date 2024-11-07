SELECT p.DNI,p.Nombre,p.Apellido,p.Telefono,p.Domicilio
FROM Paciente p
WHERE NOT EXIST (SELECT *
	FROM Especialista e
	WHERE NOT EXIST ( SELECT *
		FROM Turno t
		WHERE p.DNI = t.DNI AND
		e.Matricula = t.Matricula
		)
	)

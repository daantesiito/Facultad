SELECT nombre,apellido,DNI,telefono,direccion
FROM Cliente c
WHERE c.apellido LIKE '%Pe%'
ORDER BY c.DNI
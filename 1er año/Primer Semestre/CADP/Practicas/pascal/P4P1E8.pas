program P4P1E8;
const
	dimF = 400;
type
	str20= string[20];
	alumnos= record
		nroins: integer;
		DNI: integer;
		apellido: str20;
		nombre: str20;
		nacimiento: integer;
	end;
	vector = array [1..dimF] of alumnos;

procedure 

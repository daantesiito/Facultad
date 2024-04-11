program ej2;
const
	valoralto = 9999;
type
	alumno = record
		codigo: integer;
		apellido: string;
		nombre: string;
		cursadas: integer;
		finales: integer;
	end;
	
	materia = record
		codigoAlum: integer;
		nombreMateria: string;
		cursada: boolean;
		finall: boolean;
	end;
	
	archivo_alumnos = file of alumno;
	
	archivo_materias = file of materia;

procedure leer(var materias: archivo_materias; var mat: materia);
begin
	if (not EOF(materias)) then
		read(materias,mat)
	else
		mat.codigoAlum:= valoralto;
end;
	
procedure modificarAlumnos(var alumnos: archivo_alumnos; var materias: archivo_materias);
var
	alum: alumno;
	mat: materia;
	nombre_fisico: string;
	codActual: integer;
begin
	writeln('Ingrese el nombre del archivo de alumnos (maestro): ');
	readln(nombre_fisico);
	assign(alumnos,nombre_fisico);
	writeln('Ingrese el nombre del archivo de materias (detalle): ');
	readln(nombre_fisico);
	assign(materias,nombre_fisico);
	reset(alumnos);
	reset(materias);
	read(alumnos, alum);
	leer(materias, mat);
	codActual:= 0;
	while (mat.codigoAlum <> valoralto) do begin
		codActual:= mat.codigoAlum;
		while (codActual = mat.codigoAlum) do begin
			if (mat.cursada = True) then begin
				if (mat.finall = True) then
					alum.finales:= alum.finales + 1
				else
					alum.cursadas:= alum.cursadas + 1;
			end;
			leer(materias,mat);
		end;
		while (alum.codigo <> codActual) do
			read(alumnos, alum);
		seek(alumnos,filepos(alumnos)-1);
		write(alumnos,alum);
		if (not (EOF(alumnos))) then
			read(alumnos,alum);
	end;
	close(alumnos);
	close(materias);
end;

procedure listarAlumnos(var alumnos: archivo_alumnos);
var
	alum: alumno;
	alumnosListadostxt: Text;
	nombre_fisico: string;
begin
	writeln('Ingrese el nombre del nuevo archivo txt de alumnos listados: ');
	readln(nombre_fisico);
	assign(alumnosListadostxt,nombre_fisico);
	assign(alumnos,'alumnos');
	reset(alumnos);
	rewrite(alumnosListadostxt);
	while not EOF(alumnos) do begin
		read(alumnos,alum);
		if (alum.finales > alum.cursadas) then begin
			writeln(alumnosListadostxt,' codigo: ', alum.codigo,' apellido: ',alum.apellido,' nombre: ',alum.nombre,' cursadas: ',alum.cursadas,' finales: ',alum.finales);
		end;
	end;
	writeln('Archivo txt con alumnos con mayor cantidad de finales que cursadas creado!');
	close(alumnos);
	close(alumnosListadostxt);
end;

var
	alumnos: archivo_alumnos;
	materias: archivo_materias;
begin
	modificarAlumnos(alumnos,materias);
	listarAlumnos(alumnos);
end.

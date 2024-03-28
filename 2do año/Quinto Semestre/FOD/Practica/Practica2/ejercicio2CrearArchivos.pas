program ejercicio2HacerArchivoBinario;
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
	

procedure LeerAlumnos(var alum: alumno);
begin
	writeln('Ingrese el codigo del alumno: ');
	readln(alum.codigo);
	if (alum.codigo <> 0) then begin
		writeln('Ingrese el apellido del alumno: ');
		readln(alum.apellido);
		writeln('Ingrese el nombre del alumno: ');
		readln(alum.nombre);
		writeln('Ingrese las cursadas del alumno: ');
		readln(alum.cursadas);
		writeln('Ingrese los finales del alumno: ');
		readln(alum.finales);
	end;
end;

procedure LeerMaterias(var mat: materia);
var
	cursada: integer;
	finall: integer;
begin
	writeln('Ingrese el codigo del alumno: ');
	readln(mat.codigoAlum);
	if (mat.codigoAlum <> 0) then begin
		writeln('Ingrese el nombre de la materia: ');
		readln(mat.nombreMateria);
		writeln('Ingrese 1 si aprobo la materia, de lo contrario 2: ');
		readln(cursada);
		if (cursada = 1) then
			mat.cursada:= True
		else
			mat.cursada:= False;
		writeln('Ingrese 1 si aprobo el final, de lo contrario 2: ');
		readln(finall);
		if (finall = 1) then
			mat.finall:= True
		else
			mat.finall:= False;
	end;
end;

var
	alumnos: archivo_alumnos;
	materias: archivo_materias;
	nombre_fisico: string;
	mat: materia;
	alum: alumno;
	opcion: integer;
	alumnostxt: Text;
begin
	writeln('Ingrese 1 para hacer un archivo de alumnos, 2 para hacer un archivo de materias, 3 para pasar binario a txt.');
	readln(opcion);
	case opcion of
		1:
		begin
			writeln('Ingrese el nombre del archivo de alumnos a crear: ');
			readln(nombre_fisico);
			assign(alumnos,nombre_fisico);
			rewrite(alumnos);
			LeerAlumnos(alum);
			while (alum.codigo <> 0) do begin
				write(alumnos,alum);
				LeerAlumnos(alum);
			end;
			writeln('Archivo creado exitosamente!');
			close(alumnos);
		end;
		2:
		begin
			writeln('Ingrese el nombre del archivo de materias a crear: ');
			readln(nombre_fisico);
			assign(materias,nombre_fisico);
			rewrite(materias);
			LeerMaterias(mat);
			while (mat.codigoAlum <> 0) do begin
				write(materias,mat);
				LeerMaterias(mat);
			end;
			writeln('Archivo creado exitosamente!');
			close(materias);
		end;
		3:
		begin
			writeln('Ingrese el nombre del archivo txt nuevo: ');
			readln(nombre_fisico);
			assign(alumnostxt,nombre_fisico);
			assign(alumnos,'alumnos');
			rewrite(alumnostxt);
			reset(alumnos);
			while not EOF(alumnos) do begin
				read(alumnos,alum);
				writeln(alumnostxt,' codigo: ', alum.codigo,' apellido: ',alum.apellido,' nombre: ',alum.nombre,' cursadas: ',alum.cursadas,' finales: ',alum.finales);
			end;
			writeln('Archivo txt creado exitosamente!');
			close(alumnos);
			close(alumnostxt);
		end;
	end;
end.

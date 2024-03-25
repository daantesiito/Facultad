program p3prac4;

type

	finall = record
		codalumno: integer;
		codmateria: integer;
		nota: integer;
	end;
	
	{listanotas = ^nodo2;
	nodo2 = record
		dato: integer;
		sig: listanotas;
	end;}
	
	vector = array [1..30] of finall;
	
	alumno = record
		codigo: integer;
		notasaprobadas: vector;
	end;

	arbolalumnos = ^nodo;
	nodo = record
		dato: alumno;
		HI: arbolalumnos;
		HD: arbolalumnos;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato: alumno;
		HI: arbol2;
		HD: arbol2;
	end;
	
procedure leerfinal (var f: finall);
begin
	writeln('ingrese la nota');
	readln(f.nota);
	if f.nota <> -1 then begin
		writeln('ingrese el codigo del alumno');
		read(f.codalumno);
		writeln('ingrese el codigo de la materia');
		read(f.codmateria);
	end;
end;

{procedure agregaradelante (l: listanotas; nota: integer);
var
	nuevo: listanotas;
begin
	new(nuevo);
	nuevo^.dato:= nota;
	nuevo^.sig:= l;
	l:= nuevo;
end;}

procedure agregararbol1 (var a: arbolalumnos; alumno: integer; nota: integer);
begin
	if (a = nil) or (alumno = a^.dato.codigo) then begin
		if a = nil then begin		
			new(a);
			a^.dato.codigo:= alumno;
			if (nota >= 4) and (nota <= 10) then
				a^.dato.notasaprobadas[a^.dato.codigo].nota:= nota;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (nota <= 10) and (nota >= 4) then
				a^.dato.notasaprobadas[a^.dato.codigo].nota:= nota;
	end
	else if alumno <= a^.dato.codigo then
		agregararbol1(a^.HI,alumno,nota)
	else
		agregararbol1(a^.HD,alumno,nota);
end;

procedure agregararbol2(var a: arbol2; codigoal,nota,codigoma: integer);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.codigo:= codigoal;
		a^.dato.notasaprobadas[a^.dato.codigo].codalumno:= codigoal;
		a^.dato.notasaprobadas[a^.dato.codigo].codmateria:= codigoma;
		a^.dato.notasaprobadas[a^.dato.codigo].nota:= nota;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (codigoal >= a^.dato.codigo) then
			agregararbol2(a^.HI,codigoal,nota,codigoma)
		else
			agregararbol2(a^.HD,codigoal,nota,codigoma);
end;

procedure crearestructuras (var a: arbolalumnos; var a2: arbol2); 
var
	f: finall;
begin
	leerfinal(f);
	while f.nota <> -1 do begin
		agregararbol1(a,f.codalumno,f.nota);
		agregararbol2(a2,f.codalumno,f.nota,f.codmateria);
		leerfinal(f);
	end;
end;

procedure informararbol1(a: arbolalumnos);
begin
	if (a <> nil) then begin
		informararbol1(a^.HI);
		writeln('Codigo: ');
		writeln(a^.dato.codigo);
		writeln('');
		if (a^.dato.notasaprobadas[a^.dato.codigo].nota = 0) then
			writeln('Parcial Desaprobado')
		else
			writeln('Nota: ');
			writeln(a^.dato.notasaprobadas[a^.dato.codigo].nota);
		informararbol1(a^.HD);
	end;
end;

procedure informararbol2(a: arbol2);
begin
	if (a <> nil) then begin
		informararbol2(a^.HI);
		writeln('Nota: ');
		writeln(a^.dato.notasaprobadas[a^.dato.codigo].nota);
		writeln('CodMateria: ');
		writeln(a^.dato.notasaprobadas[a^.dato.codigo].codmateria);
		writeln('CodAlumno: ');
		writeln(a^.dato.notasaprobadas[a^.dato.codigo].codalumno);
		writeln('-----------------------------------');
		informararbol2(a^.HD);
	end;
end;

procedure promediosmayores(a: arbolalumnos; calumno: integer);
var
	i,notaTotal,finalesTotal: integer;
	promedio: real;
begin
	if (a <> nil) then begin
		if (a^.dato.notasaprobadas[a^.dato.codigo].codalumno > calumno) then begin
			writeln('a');
			notaTotal:= 0;
			finalesTotal:= 0;
			promedio:= 0;
			if (a^.dato.notasaprobadas[a^.dato.codigo].nota <= 10) and (a^.dato.notasaprobadas[a^.dato.codigo].nota >= 4) then
				writeln('Codigo mayor: ', a^.dato.notasaprobadas[a^.dato.codigo].codalumno);
			for i:= 1 to 30 do begin
				if (a^.dato.notasaprobadas[a^.dato.codigo].nota <= 10) and (a^.dato.notasaprobadas[a^.dato.codigo].nota >= 4) then begin
					notaTotal:= notaTotal + a^.dato.notasaprobadas[a^.dato.codigo].nota;
					finalesTotal:= finalesTotal + 1;
				end;
			end;
			promedio:= notaTotal / finalesTotal;
			writeln('El promedio del alumno es de: ', promedio:1:2);
			promediosmayores(a^.HI, calumno);
			promediosmayores(a^.HD, calumno);
		end
		else
			promediosmayores(a^.HI, calumno);
	end;
end;

var
	a: arbolalumnos;
	a2: arbol2;
	calumno: integer;
BEGIN
	crearestructuras(a,a2);
	{informararbol1(a);
	informararbol2(a2);}
	writeln('Ingrese un codigo de alumno: ');
	readln(calumno);
	promediosmayores(a,calumno);
END.

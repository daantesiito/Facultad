// El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
// con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
// 2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
// establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
// implementar un programa que procese la información y determine:
// ● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
// ● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
// El programa debe utilizar:
// a) Un módulo para la lectura de la información de la escuela.
// b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
// de alumnos y la cantidad de docentes

program P3E3;
type
	escuela = record
		CUE : integer;
		nombreEst : string;
		cantDoc : real;
		cantAl : real;
		localidad : string[20];
end;

procedure leer(var esc : escuela);
	begin
		writeln('Ingrese el codigo unico de establecimiento: ');
		readln(esc.CUE);
		writeln('Ingrese el nombre del establecimiento: ');
		readln(esc.nombreEst);
		writeln('Ingrese la cantidad de docentes: '); 
		readln(esc.cantDoc);
		writeln('Ingrese la cantidad de alumnos: ');
		readln(esc.cantAl);
		writeln('Ingrese la localidad: ');
		readln(esc.localidad);
	end;
	
var
	e: escuela;
	i, contlp: integer;
	rel, max2, max1: real;
	cmax2, cmax1: integer;

begin
	contlp := 0;
	max1 := -999;
	max2 := -999;
	cmax1 := -999;
	cmax2 := -999;
	for i:= 1 to 5 do begin
		leer(e);
		rel:= (e.cantAl / e.cantDoc);
		if rel > 23.435 then begin
			if e.localidad = 'La Plata' then begin;
				contlp := contlp + 1;
				end;
			end;
		if rel > max1 then begin
			max2 := max1;
			max1 := rel;
			cmax2 := cmax1;
			cmax1 := e.CUE;
			end;
		end;
	writeln('Cantidad de escuelas con mayor promedio de alumnos por docentes de La Plata: ', contlp);
	writeln('CUE de la escuela con mejor relacion entre docentes y alumnos: ', cmax1);
	writeln('CUE de la segunda escuela con mejor relacion entre docentes y alumnos: ', cmax2);
end.

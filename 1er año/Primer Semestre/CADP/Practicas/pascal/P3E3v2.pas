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
	cont1, contesc: integer;

begin
	cont1 := 0;
	contesc := 0;
	leer(e);
	while (e.CUE < 2400) do;
		begin
		if (e.cantAl / e.cantDoc) > 23.435 then;
			cont1 := cont1 + 1;
		contesc := contesc + 1;
		leer(e);
		end;
	writeln('Cantidad de escuelas con mayor promedio de alumnos por docentes: ', cont1);
end.


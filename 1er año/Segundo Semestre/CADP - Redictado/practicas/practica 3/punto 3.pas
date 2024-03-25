program punto3;

type
	rangoCUE = 1..2400;
	
	info = record
		CUE: rangoCUE;
		nombre_est: string;
		cant_doc: integer;
		cant_alum: integer;
		localidad: string;
	end;
	
procedure CargarInfo(var i: info);
begin
	writeln('Ingresa el CUE (insertar progresivamente): ');
	readln(i.CUE);
	writeln('Ingresa el nombre del establecimiento: ');
	readln(i.nombre_est);
	writeln('Ingresa la cantidad de docentes: ');
	readln(i.cant_doc);
	writeln('Ingresa la cantidad de Alumnos: ');
	readln(i.cant_alum);
	writeln('Ingresa la localidad: ');
	readln(i.localidad);
end;

procedure CalcularRelacion(var i: info);
var
	cant: integer;
	max, min, promedio: real;
begin
	max:= 0;
	min:= 100;
	cant:= 0;
	CargarInfo(i);
	while i.CUE <> 2400 do begin
		promedio:= (i.cant_alum / i.cant_doc);
		writeln(promedio:1:2);
		if (promedio > 23.435) then begin
			cant:= (cant + 1);
		end;
		if promedio > max then begin
			max:= promedio;
		end;
		if promedio < min then begin
			min:= promedio;
		end;
		CargarInfo(i);
	end;
	writeln('Escuela con mayor rango: ', max:1:2, ' Escuela con menor rango: ', min:1:2);
	writeln('Cantidad de escuelas con mayor promedio: ', cant);
end;

var
	i: info;

begin
	CalcularRelacion(i);
end.


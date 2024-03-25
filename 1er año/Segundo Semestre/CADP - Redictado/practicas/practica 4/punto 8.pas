program punto8;

type
	info = record
		NRO_insc: integer;
		DNI: integer;
		apellido: string;
		nombre: string;
		nacimiento: integer;
	end;

	vector = array[1..400] of info;

procedure inicializar(var v : vector);
var
 i : integer;
begin
 for i:= 1 to 400 do
	v[i] := 0;
end;

procedure CargarInfo(var inf: info);
begin
	writeln('Ingresa el numero de inscripcion: ');
	readln(inf.NRO_insc);
	writeln('Ingrese su DNI: ');
	readln(inf.DNI);
	writeln('Ingrese su apellido: ');
	readln(inf.apellido);
	writeln('Ingrese su nombre: ');
	readln(inf.nombre);
	writeln('Ingrese su nacimiento: ');
	readln(inf.nacimiento);
end;


procedure DNIpar(var inf: info; v: vector);
var
	dig, contpar: integer;
begin
	contpar:= 0;
	dig:= (inf.DNI mod 10);
	if (dig DIV 2) = 0 then begin
		contpar:= contpar + 1;
	end;
	inf.DNI:= inf.DNI DIV 10;
end;

function Porcentaje(v: vector): integer;
var
	inf: info;
begin
	DNIpar(inf, v)
	Porcentaje:= (400 / contpar);
end;

procedure Alumnos_mayores(inf: info; v: vector);
var
	i: integer;
	max1, max2: integer;
begin
	max1:= 0;
	max2:= 0;
	i:= 0;
	for i:= 1 to 400 do begin
		DNIpar(inf,v);
		if v[i].nacimiento > max2 then begin
			max2:= v[i].nacimiento;
			if v[i].nacimiento > max1 then begin
				max2:= max1;
				max1:= v[i].nacimiento;
			end;
		end;
	end;
	writeln('El alumno mas mayor es: ', max1, ' y el segundo mas mayor es: ', max2);
end;

{Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}


var
	inf: info;
	v: vector;
begin
	CargarInfo(inf);
	cargarvector(v, inf);
	Alumnos_mayores(inf,v);
	writeln('Cantidad de ')
end.

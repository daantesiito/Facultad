program parcial;
const
	maxEv = 10;
type
	eval = 1..maxEv;
	
	vectorEvaluaciones = array[eval] of integer;
	
	alumno = record
		DNI: integer;
		nombre: string;
		apellido: string;
		anoingreso: integer;
		nota: eval;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: alumno;
		sig: lista;
	end;

procedure LeerAlumno(var a: alumno);
begin
	readln(a.DNI);
	readln(a.nombre);
	readln(a.apellido);
	readln(a.anoingreso);
	readln(a.nota);
end;

procedure AgregarAdelante(var l:lista; a: alumno);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= a;
	aux^.sig:= l;
	l:= aux;
end;

procedure CargarVector(v: vectorEvaluaciones);
var
	i: eval;
begin
	for i:= 1 to maxEv do begin
		readln(v[i]);
	end;
end;

procedure CargarLista(var l: lista);
var
	a: alumno;
begin
	l:= nil;
	repeat
		LeerAlumno(a);
		AgregarAdelante(l,a);
	until (a.DNI = 33016244);
end;

procedure procesar(var l: lista; a: alumno);
var
	cantAlumnos, presentes, aprobadas: integer;
begin
	l:= nil;
	cantAlumnos:= 0;
	CargarLista(l);
	while l <> nil do begin
		contar_autoev(v,presentes,aprobadas);
		if (presentes >= 8) and (aprobadas >= 4) then 
			writeln('El DNI: ', l^.dato.DNI ,'esta habilitado para rendir.')
		if  cumpleCondicion(l^.dato.anoingreso,presentes) then
			cantAlumnos:= cantAlumnos + 1;
		if ((sumaDigitos(l^.dato.DNI) MOD 2) = 0) then
			writeln('El alumno: 'l^.dato.nombre,' ', l^.dato.apellido, 'tiene un dni que con la suma de sus digitos da par.')
	end;
	writeln('El porcentaje de alumnos que asistieron a todas las autoevaluaciones es: ', porcentaje);
end;

procedure contar_autoev(v: vector; var presentes, aprobadas: integer);
var
	i: integer;
begin
	presentes:= 0;
	aprobadas:= 0;
	for i:= 1 to maxEv do begin
		if v[i] >= 0 then begin
			presentes:= presentes + 1;
			if v[i] >= 6 then
				aprobadas:= aprobadas + 1;
		end;
	end;
end;

function cumpleCondicion(ingreso, presentes: integer): boolean;
begin
	if (ingreso = 2020) and (presentes = maxEv) then
		cumpleCondicion:= true;
end;

function porcentaje(num1, num2: integer): real;
begin
	porcentaje:= ((num1 * 100) / num2);
end;

function sumaDigitos(num: integer): integer;
var
	dig, suma: integer;
begin
	suma:= 0;
	while num <> 0 do begin
		dig:= num MOD 10;
		sumaDigitos:= suma + dig;
		num:= num DIV 10;
	end;
end;

var
	l: lista;
begin
	CargarVector(v);
	CargarLista(l);
	procesar(l);
end.

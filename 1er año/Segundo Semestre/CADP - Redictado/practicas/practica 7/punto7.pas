program punto7;
type
	materias = 1..24;
	
	alumno = record
		num: integer;
		apellido: string;
		nombre: string;
		mail: string;
		ano_ing: integer;
		ano_term: integer;
		notas: materias;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: alumno;
		sig: lista;
	end;
	
	vectorNotas = array [materias] of integer;
	
procedure LeerAlumno(var a: alumno);
begin
	readln(a.num);
	readln(a.apellido);
	readln(a.nombre);
	readln(a.mail);
	readln(a.ano_ing);
	readln(a.ano_term);
	readln(a.notas);
end;

procedure AgregarOrdenado(var l: lista; a: alumno);
var
	act, ant, aux: lista;
begin
	new(aux);
	aux^.dato:= a;
	act:= l;
	ant:= l;
	if (l <> nil) and (a.notas > act^.dato.notas) then begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= aux
	else
		ant^.sig:= aux;
	aux^.sig:= act;
end;

procedure CargarLista(l: lista);
var
	a: alumno;
begin
	LeerAlumno(a);
	while (l <> nil) and (a.num <> -1) do begin
		AgregarOrdenado(l,a);
		LeerAlumno(a);
	end;
end;

procedure InicializarVector(var v: vectorNotas);
var
	i: integer;
begin
	for i := 1 to 24 do begin
		v[i]:= 0;
	end;
end;

function promedioNotas(v: vectorNotas; l: lista): real;
var
	sumarNotas, i: integer;
begin
	sumarNotas:= 0;
	for i:= 1 to 24 do begin
		sumarNotas:= sumarNotas + l^.dato.notas;
	end;
	promedioNotas:= (sumarNotas / 24);
end;

function NUM_ALUMpares(num: integer): boolean;
var
	dig: integer;
begin
	while (num <> 0) do begin
		dig:= num MOD 10;
		if ((dig MOD 2) = 1) then
			NUM_ALUMpares:= False;
			Exit;
		num:= num DIV 10;
	end;
	NUM_ALUMpares:= True;
end;

procedure procesar(l: lista; v: vectorNotas);
var
	max1, max2, anosRecibido, ingresantes2012: integer;
	max1i, max2i: string;
begin
	max1:= 0;
	max2:= 0;
	max1i:= '';
	max2i:= '';
	ingresantes2012:= 0;
	while l <> nil do begin
		promedioNotas(v,l);
		if (l^.dato.ano_ing = 2012) and (NUM_ALUMpares(l^.dato.num) = True) then
			ingresantes2012:= ingresantes2012 + 1;
		anosRecibido:= (l^.dato.ano_term - l^.dato.ano_ing);
		if (anosRecibido > max1) then begin
			max2:= max1;
			max1:= anosRecibido;
			max2i:= max1i;
			max1i:= l^.dato.nombre;
		end
		else if (anosRecibido > max2) then begin
			max2:= anosRecibido;
			max2i:= l^.dato.nombre;
		end;
	end;
	writeln('La cantidad de alumnos ingresantes en 2012 con numero de alumno compuesto por solo pares es: ', ingresantes2012);
	writeln('El alumno que mas rapido se recibio fue: ', max1i, ' y el segundo mas rapid fue: ', max2i);
end;

var
	l: lista;
	v: vectorNotas;
begin
	l:= nil;
	InicializarVector(v);
	CargarLista(l);
	procesar(l,v);
end.

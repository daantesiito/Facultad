program parcial2020;
type
	empleados = record
		DNI: integer;
		apellido: string;
		nombre: string;
		cat: char;
		sueldo: integer;
		antiguedad: integer;
		montos_de_premios: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: empleados;
		sig: lista;
	end;	
	
	vectorCategorias = array[1..5] of integer;

procedure IniciarlizarVector(var v: vectorCategorias);
var
	i: integer;
begin
	for i:= 1 to 5 do begin
		v[i]:= 0;
	end;
end;

procedure LeerEmpleados(var e: empleados);
begin
	readln(e.DNI);
	readln(e.apellido);
	readln(e.nombre);
	readln(e.cat);
	readln(e.sueldo);
	readln(e.antiguedad);
	readln(e.montos_de_premios);
end;

procedure InsertarOrdenado(var l: lista; e: empleados);
var
	aux, ant, act: lista;
begin
	new(aux);
	aux^.dato:= e;
	act:= l;
	ant:= l;
	while (act <> nil) and (e.DNI > act^.dato.DNI) do begin
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
	e: empleados;
begin
	LeerEmpleados(e);
	while (l <> nil) and (e.DNI <> -1) do begin
		InsertarOrdenado(l,e);
		LeerEmpleados(e);
	end;
end;

function sueldoaCobrar(num: integer; a: char): integer;
var
	e: empleados;
begin
	for i:= 1 to 5 do begin
		if a <= 3 then
			sueldoaCobrar:= (num + e.montos_de_premios);
		end;
		else if a >= 4 then
			sueldoaCobrar:= (num + e.montos_de_premios + 1000 * e.antiguedad);
		end;
	end;
end;

procedure procesar(var l: lista);
begin
	while (l <> nil) do begin
		writeln('El DNI: ', l^.dato.DNI,' cobraria: ', sueldoaCobrar(l^.dato.sueldo,l^.dato.cat))
		if l^.dato.cat = 'A' then
			v[1]:= v[1] + 1
		if l^.dato.cat = 'B' then
			v[1]:= v[1] + 1
		if l^.dato.cat = 'C' then
			v[1]:= v[1] + 1
		if l^.dato.cat = 'D' then
			v[1]:= v[1] + 1
		if l^.dato.cat = 'E' then
			v[1]:= v[1] + 1
		l:= l^.sig;
	end;
end;


var
	l: lista;
	v: vectorCategorias;
	e: empleados;
begin
	IniciarlizarVector(v);
	CargarLista(l);
	procesar();
end.

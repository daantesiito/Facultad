program examen8nov;
type
	empleados = record
		DNI: integer;
		apellidoYnombre: string;
		condicion: string;
		area: 1..4;
		antiguedad: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: empleados;
		sig: lista;
	end;
	
	vectorArea = array [1..4] of integer;
	
procedure LeerEmpleados(var e: empleados);
begin
	readln(e.DNI);
	readln(e.apellidoYnombre);
	readln(e.condicion);
	readln(e.area);
	readln(e.antiguedad);
end;

procedure AgregarAdelante(var l: lista; e: empleados);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= e;
	aux^.sig:= l;
	l:= aux;
end;

procedure AgregarOrdenado(var l: lista; e: empleados);
var
	aux, act, ant: lista;
begin
	new(aux);
	aux^.dato:= e;
	ant:= l;
	act:= l;
	if (act <> nil) and (l^.dato.apellidoYnombre < e.apellidoYnombre) then begin
		ant:= act;
		act:= act^.sig;
	end;
	if act = ant then
		l:= aux
	else
		ant^.sig:= aux;
	aux^.sig:= act;
end;

procedure InicializarVector(var v: vectorArea);
var
	i: integer;
begin
	for i:= 1 to 4 do begin
		v[i]:= 0;
	end;
end;

function DNIiguales(num: integer): boolean;
var
	dig, pares, impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while num <> 0 do begin
		dig:= num MOD 10;
		if ((dig MOD 2) = 0) then
			pares:= pares + 1
		else
			impares:= impares + 1;
		num:= num DIV 10;
	end;
	if (pares = impares) then
		DNIiguales:= True
	else
		DNIiguales:= False;
end;

procedure CargarLista(l: lista);
var
	e: empleados;
begin
	repeat
		LeerEmpleados(e);
		if (DNIiguales(e.DNI) = True) and (e.condicion = 'temporal') then 
			AgregarOrdenado(l,e);
		AgregarAdelante(l,e);
	until (e.DNI = 33444555);
end;

procedure DNIminimos(area, antiguedad, DNI: integer; var mini1, var mini2: integer);
var
	min1, min2: integer;
begin
	min1:= -1;
	mini1:= -1; 
	min2:= -1;
	mini2:= -1;
	if (area = 2) and (antiguedad < min1) then begin
			min2:= min1;
			min1:= antiguedad;
			mini2:= mini1;
			mini1:= DNI;
		end
		else if (antiguedad < min2) then begin
				min2:= antiguedad;
				mini2:= DNI;
			end;
end;

procedure procesarTodo(l: lista; v: vectorArea);
var
	i, mini1, mini2: integer;
begin
	while l <> nil do begin
		// a
		if (l^.dato.condicion = 'permanente') then 
			v[l^.dato.area]:= v[l^.dato.area] + 1;
		// b
		DNIminimos(l^.dato.area, l^.dato.antiguedad, l^.dato.DNI, mini1, mini2);
	end;
	writeln('DNI minimo 1: ', mini1, 'DNI minimo 2: ', mini2);
	for i:= 1 to 4 do begin
		writeln('Cantidad de empleados en el area: ', i , ' son de: ', v[i]);
	end;
end;

var
	l: lista;
	v: vectorArea;
begin
	l:= nil;
	InicializarVector(v);
	CargarLista(l);
	procesarTodo(l,v);
end.

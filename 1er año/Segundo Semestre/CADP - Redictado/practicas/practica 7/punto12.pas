program punto12;
type
	clientes = record
		nombre: string;
		DNI: integer;
		edad: integer;
		subscripcion: 1..4;
	end;
	vectorPrecios = array [1..4] of integer;
	vectorSubscripciones = array [1..4] of integer;
	
	lista = ^nodo;
	nodo = record
		dato: clientes;
		sig: lista;
	end;
	
procedure LeerClientes(var c: clientes);
begin
	readln(c.nombre);
	readln(c.DNI);
	readln(c.edad);
	readln(c.subscripcion);
end;

procedure AgregarAdelante(var l: lista; c: clientes);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= c;
	aux^.sig:= l;
	l:= aux;
end;

procedure InicializarVectorSubs(var v: vectorSubscripciones);
var
	i: integer;
begin
	for i:= 1 to 4 do begin
		v[i]:= 0;
	end;
end;

procedure InicializarVectorPrecios(var v: vectorPrecios);
var
	i: integer;
begin
	for i:= 1 to 4 do begin
		readln(v[i]);
	end;
end;

procedure CargarLista(l: lista; c: clientes);
begin
	LeerClientes(c);
	while c.DNI <> 0 do begin
		AgregarAdelante(l,c);
		LeerClientes(c);
	end;
end;

procedure subsmax(var maxi1: integer; var maxi2: integer; vs: vectorSubscripciones);
var
	i, max1, max2: integer;
begin
	i:=0;
	max1:=0;
	max2:=0;
	for i:= 1 to 4 do begin
		if vs[i] > max1 then begin
			max2:= max1;
			max1:= vs[i];
			maxi2:= maxi1;
			maxi1:= i;
		end;
		else if vs[i] > max2 then begin
				max2:= vs[i];
				maxi2:= i;
			end;
	end;
end;

procedure AgregarOrdenado(var l: lista; c: clientes);
var
	aux, ant, act: lista;
begin
	new(aux);
	aux^.dato:= c;
	ant:= l;
	act:= l;
	while (act <> nil) and (l^.dato.DNI > c.DNI) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then
		l:= aux;
	else
		ant^.sig:= aux;
	aux^.sig:= act;
end;

procedure procesarTodo(l: lista ; vp: vectorPrecios; vs: vectorSubscripciones);
var
	maxi1, maxi2: integer;
begin
	maxi1:= 0;
	maxi2:=0;
	CargarLista(l,c)
	while l <> nil do begin
		// a
		GananciaTotal:= GananciaTotal + vp[l^.dato.subscripcion];
		// b
		vs[l^.dato.subscripcion]:= vs[l^.dato.subscripcion] + 1
		if (l^.dato.edad > 40) and ((l^.dato.subscripcion = 3) or (l^.dato.subscripcion = 4)) then
			AgregarOrdenado(l,c);
		l:= l^.sig;
	end;
	writeln('Ganancias totales de Fortacos es de: ', GananciasTotales);
	subsmax(maxi1,maxi2,vs);
end;

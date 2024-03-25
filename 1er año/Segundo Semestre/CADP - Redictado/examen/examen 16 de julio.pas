program examen2022tema2;
type
	compra = record
		monto: integer;
		mes: integer;
		kg: integer;
		nombre: string;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: compra;
		sig: lista;
	end;
	
	vectorMeses = array[1..12] of integer;
	
procedure LeerCompras(var c: compra);
begin
	readln(c.monto);
	readln(c.mes);
	readln(c.kg);
	readln(c.nombre);
end;

procedure InicializarVector(var v: vectorMeses);
var
	i: integer;
begin
	for i:= 1 to 12 do begin
		v[i]:= 0;
	end;
end;

procedure AgregarOrdenado(var l: lista; c: compra);
var
	aux, ant, act: lista;
begin
	new(aux);
	aux^.dato:= c;
	ant:= l;
	act:= l;
	if (act <> nil) and (l^.dato.nombre < c.nombre) then begin
		ant:= act;
		act:= act^.sig;
	end;
	if act = ant then
		l:= aux
	else
		ant^.sig:= aux;
	aux^.sig:= act;
end;

procedure CargarLista(l: lista; c: compra);
begin
	repeat
		LeerCompras(c);
		AgregarOrdenado(l,c);
	until (c.kg = 100);
end;

procedure MinMeses(v: vectorMeses; var min1: integer; var min2: integer);
var
	i: integer;
begin
	for i:= 1 to 12 do begin
			if v[i] < min1 then begin
				min2:= min1;
				min1:= v[i];
			end
			else if v[i] < min2 then
				min2:= v[i];
		end;
end;

procedure procesarTodo(l: lista; v: vectorMeses; c: compra);
var
	min1, min2: integer;
	nombreActual: string;
	montoTotal: integer;
begin
	while l <> nil do begin
		v[l^.dato.mes]:= v[l^.dato.mes] + 1;
		//
		montoTotal:= 0;
		nombreActual:= c.nombre;
		while (c.nombre = nombreActual) do begin
			montoTotal:= montoTotal + c.monto;
			if (montoTotal > 45000) then
				writeln('El frigorifico: ', c.nombre, ' supero los 45000 pesos de monto total facturado.');
		end; 
	end;
	MinMeses(v,min1,min2);
	writeln('Los dos meses en el que menos compras se realizaron son los meses: ', min1, ' y ', min2)
end;



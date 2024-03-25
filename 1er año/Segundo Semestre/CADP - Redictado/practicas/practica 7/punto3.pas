program punto3;
type
	viaje = record
		num: integer;
		codigo: integer;
		origen: string;
		destino: string;
		km: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: viaje;
		sig: lista;
	end;
	
procedure LeerViajes(var v: viaje);
begin
	readln(v.num);
	readln(v.codigo);
	readln(v.origen);
	readln(v.destino);
	readln(v.km);
end;

procedure AgregarOrdenado(var l: lista; v: viaje);
var
	aux, ant, act: lista;
begin
	new(aux);
	aux^.dato: v;
	ant: l;
	act: l;
	while act <> nil and (l^.dato.codigo > v.codigo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= aux;
	else
		ant^.sig:= aux;
	aux^.sig:= act
end; 

procedure CargarLista(l: lista);
var
	
begin
	LeerViajes(v);
	while l <> nil do begin
		AgregarOrdenado(l,v);
		LeerViajes(v);
	end;
end;

procedure CalcularMax(l: lista,var maxi1,maxi2,max1,max2: integer;);
begin
	if l^.dato.km > max1 then begin
		max2:= max1;
		max1:= l^.dato.km;
		maxi2:= maxi1;
		maxi1:= l^.dato.codigo;
	end;
	else
		if l^.dato.km > max2 then begin
			max2:= l^.dato.km;
			maxi2:= l^.dato.codigo;
		end;
end;

procedure ProcesarTodo(l: lista);
var
	cantKM, CodigoAutoActual, maxi1, maxi2, max1, max2: integer;
begin
	maxi1:=-1;
    maxi2:=-1;
    max1:=-1;
    max2:=-1;
	cantKM:= 0;
	CodigoAutoActual:= l^.dato.codigo
	while l <> nil do begin
		while (l^.dato.codigo = CodigoAutoActual) do begin
			if l^.dato.km > 5 then
				AgregarOrdenado(l,v);
			cantKM:=cantKM+L^.datos.klrecorrido;
			l:=l^.sig;  
		end;
		CalcularMax(l,maxi1,maxi2,max1,max2)
	end;
end;

var
	l: lista;
	v: viaje;
begin
	l:= nil;
	CargarLista(l,v);
	ProcesarTodo(l);
end.

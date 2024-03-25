program parcial2018;
type
	provincias = 1..23;
	estancias = record
		cod_est: integer;
		localidad: string;
		cod_prov: provincias;
		cant_cab: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: estancias;
		sig: lista;
	end;
	
procedure LeerEstancias(var e: estancias);
begin
	writeln('Inserte codigo de estancia: ');
	readln(e.cod_est);
	writeln('Inserte localidad: ');
	readln(e.localidad);
	writeln('Inserte codigo de provincia: ');
	readln(e.cod_prov);
	writeln('Inserte cantidad de cabezas de ganado: ');
	readln(e.cant_cab);
end;

procedure AgregarAdelante(var l: lista; e: estancias);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= e;
	aux^.sig:= l;
	l:= aux;
end;

procedure CargarLista(l: lista; e: estancias);
begin
	LeerEstancias(e);
	while (e.cod_est <> 0) do begin
		AgregarAdelante(l,e);
		LeerEstancias(e);
	end;
end;

function EstaElCod(num: integer): boolean;
begin
	if num = 234 then
		EstaElCod:= True
end;

procedure MaxCabezas(cabezas,codprov: integer; var max1,max2,maxi1,maxi2: integer);
begin
	if cabezas > max1 then begin
		max2:= max1;
		max1:= cabezas;
		maxi2:= maxi1;
		maxi1:= codprov;
	end
	else if cabezas > max2 then begin
			max2:= cabezas;
			maxi2:= codprov;
		end;
end;

procedure procesarTodo(l: lista);
var
	max1, max2, maxi1, maxi2: integer;
begin
	max1:= 0;
	max2:= 0;
	maxi1:= 0;
	maxi2:= 0;
	while (l <> nil) do begin
		if EstaElCod(l^.dato.cod_est) then
			writeln('Esta cargada la estancia numero 234.');
		MaxCabezas(l^.dato.cant_cab,l^.dato.cod_prov,max1,max2,maxi1,maxi2);
		l:= l^.sig;
	end;
	writeln('Las dos provincias con mas cantidad de cabezas de ganado son: ', maxi1, ' con una cantidad de: ', max1, ' y ', maxi2, ' con una cantidad de: ', max2);
end;

var
	l: lista;
	e: estancias;
begin
	l:= nil;
	CargarLista(l,e);
	procesarTodo(l);
end.

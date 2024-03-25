program punto5;
type
	camion = record
		patente: string;
		ano_fab: integer;
		peso: real;
	end;
	
	vectorCamiones = array [1..100] of camion;
	
	viaje = record
		cod_via: integer;
		cod_cam: 1..100;
		km_rec: integer;
		destino: string;
		ano_via: integer;
		DNI: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: viaje;
		sig: lista;
	end;
	
procedure LeerViaje(var v: viaje);
begin
	readln(v.cod_via);
	readln(v.cod_cam);
	readln(v.km_rec);
	readln(v.destino);
	readln(v.ano_via);
	readln(v.DNI);
end;

procedure InicializarVector(var v: vectorCamiones);
var
	i: integer;
begin
	for i:= 1 to 100 do begin
		readln(v[i]);
	end;
end;

procedure AgregarAdelante(var l: lista; v: viaje);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= v;
	aux^.sig:= l;
	l:= aux;
end;

procedure CargarLista(l: lista);
var
	v: viaje;
begin
	LeerViaje(v);
	while (v.cod_via <> -1) do begin
		AgregarAdelante(l,v);
		LeerViaje(v);
	end;
end;

procedure DNIimpar(num: integer; cod: integer);
var
	dig: integer;
	cumple: boolean;
begin
	cumple:= True;
	while (num <> 0) and (cumple = True) do begin
		dig:= num MOD 10;
		if ((dig MOD 2) = 0) then begin
			cumple:= False;
		end;
		num:= num DIV 10;
	end;
	if (cumple = True) then
		writeln(cod);
end;

procedure procesar(l: lista; v: vectorCamiones);
var
	maxrec, minrec, contViajesp2: integer;
	maxpat, minpat: string;
begin
	maxrec:= 0;
	minrec:= -1;
	maxpat:= '';
	minpat:= '';
	contViajesp2:= 0;
	while l <> nil do begin
		if (l^.dato.km_rec > maxrec) then begin
			maxrec:= l^.dato.km_rec;
			maxpat:= v[l^.dato.cod_cam].patente;
		end
		else if (l^.dato.km_rec < minrec) then begin
			minrec:= l^.dato.km_rec;
			minpat:= v[l^.dato.cod_cam].patente;
		end;
		if (v[l^.dato.cod_cam].peso > 30.5) and ((l^.dato.ano_via - v[l^.dato.cod_cam].ano_fab) > 5) then
			contViajesp2:= (contViajesp2 + 1);
		DNIimpar(l^.dato.DNI, l^.dato.cod_cam);
	end;
	writeln('El camion con mas km recorridos es: ', maxpat, ' y el que menos km recorridos tiene es: ', minpat);
end;

var
	l: lista;
	v: vectorCamiones;
begin
	l:= nil;
	InicializarVector(v); // se dispone
	CargarLista(l);
	procesar(l,v);
end.

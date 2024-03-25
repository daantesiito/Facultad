program p2prac5;
type
	autos = record
		patente: integer;
		ano: integer;
		marca: string;
		modelo: string;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: autos;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodo2;
	nodo2 = record
		dato: autos;
		sig: lista;
	end;
	
	autosmarca = record
		marca: string;
		autos: lista;
	end;
	
	arbol2 = ^nodo3;
	nodo3 = record
		dato: autosmarca;
		HI: arbol2;
		HD: arbol2;
	end;
	
	lista2 = ^nodo5;
	nodo5 = record
		dato: autos;
		sig: lista2;
	end;
	
procedure leerAutos(var au: autos);
begin
	writeln('Ingrese la patente: ');
	readln(au.patente);
	if (au.patente <> -1) then begin
		writeln('Ingrese el ano: ');
		readln(au.ano);
		writeln('Ingrese la marca: ');
		readln(au.marca);
		writeln('Ingrese el modelo: ');
		readln(au.modelo);
	end;
end;

procedure cargarArbol(var a: arbol; au: autos);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= au;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (au.patente <= a^.dato.patente) then 
			cargarArbol(a^.HI,au)
		else
			cargarArbol(a^.HD,au);
end;

procedure agregarAdelante(var l: lista; au: autos);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= au;
    aux^.sig:= l;
    l:= aux;
end;

procedure cargarArbolListas(var a: arbol2; au: autos; l: lista);
begin
	if (a = nil) or (au.marca = a^.dato.marca) then begin
		if a = nil then begin
			new(a);
			a^.dato.marca:= au.marca;
			agregarAdelante(a^.dato.autos,au);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			agregarAdelante(a^.dato.autos,au);
	end
	else
		if (au.marca <= a^.dato.marca) then
			cargarArbolListas(a^.HI,au,l)
		else
			cargarArbolListas(a^.HI,au,l);
end;

procedure armarArbol(var a: arbol; var a2: arbol2; l: lista);
var
	au: autos;
begin
	leerAutos(au);
	while (au.patente <> -1) do begin
		cargarArbol(a,au);
		cargarArbolListas(a2,au,l);
		leerAutos(au);
	end;
end;

procedure informarArbol(a: arbol);
begin
	if (a <> nil) then begin
		informarArbol(a^.HI);
		writeln(a^.dato.patente);
		writeln(a^.dato.ano);
		writeln(a^.dato.marca);
		writeln(a^.dato.modelo);
		writeln('');
		informarArbol(a^.HD);
	end;
end;

procedure informarArbol2(a: arbol2);
var
	aux: lista;
begin
	if (a <> nil) then begin
		informarArbol2(a^.HI);
		writeln('Marca en arbol: ');
		writeln(a^.dato.marca);
		aux:= a^.dato.autos;
		if aux = nil then
			writeln('bbbbbbbbbbbbbbbb');
		while (aux <> nil) do begin
			writeln('Patente en lista: ');
			writeln(aux^.dato.patente);
			writeln('Ano en lista: ');
			writeln(aux^.dato.ano);
			writeln('Modelo en lista: ');
			writeln(aux^.dato.modelo);
			aux:= aux^.sig;
		end;
		writeln('');
		informarArbol2(a^.HD);
	end;
end;

procedure CantAutosA1(a: arbol; marca: string; var autosTotal: integer);
begin
	if (a <> nil) then begin
		CantAutosA1(a^.HI,marca,autosTotal);
		if (a^.dato.marca = marca) then
			autosTotal:= autosTotal + 1;
		CantAutosA1(a^.HD,marca,autosTotal);
	end;
end;

procedure CantAutosA2(a: arbol2; marca: string; var autosTotal: integer);
var
	aux: lista;
begin
	if (a <> nil) then begin
		CantAutosA2(a^.HI,marca,autosTotal);
		aux:= a^.dato.autos;
		while (aux <> nil) do begin
			if aux^.dato.marca = marca then
				autosTotal:= autosTotal + 1;
			aux:= aux^.sig;
		end;
		CantAutosA2(a^.HD,marca,autosTotal);
	end;
end;

procedure agregarAdelante2(var l: lista2; au: autos);
var
    aux: lista2;
begin
    new(aux);
    aux^.dato:= au;
    aux^.sig:= l;
    l:= aux;
end;

procedure cargarListaAnos(a: arbol; var l: lista2);
begin
	if (a <> nil) then begin
		cargarListaAnos(a^.HI,l);
		agregarAdelante2(l,a^.dato);
		cargarListaAnos(a^.HD,l);
	end;
end;

procedure informarLista2(l: lista2);
var
	aux: lista2;
begin
	aux:= l;
	while (aux <> nil) do begin
		writeln('Ano: ');
		writeln(aux^.dato.ano);
		writeln('Patente: ');
		writeln(aux^.dato.patente);
		writeln('Marca: ');
		writeln(aux^.dato.marca);
		writeln('Modelo: ');
		writeln(aux^.dato.modelo);
		writeln('');
		aux:= aux^.sig;
	end;
end;

procedure autoPorPatente(a: arbol; patente: integer; var modelo: string);
begin
	if (a <> nil) then begin
		autoPorPatente(a^.HI,patente,modelo);
		if patente = a^.dato.patente then
			modelo:= a^.dato.modelo;
		autoPorPatente(a^.HD,patente,modelo);
	end;
end;

procedure autoPorPatente2(a: arbol2; patente: integer; var modelo: string);
var
	aux: lista;
begin
	if (a <> nil) then begin
		autoPorPatente2(a^.HI,patente,modelo);
		aux:= a^.dato.autos;
		while (aux <> nil) do begin
			if (aux^.dato.patente = patente) then
				modelo:= aux^.dato.modelo;
			aux:= aux^.sig;
		end;
		autoPorPatente2(a^.HD,patente,modelo);
	end;
end;

var
	a: arbol;
	a2: arbol2;
	l: lista;
	marca,modelo: string;
	autosTotal,patente: integer;
	l2: lista2;
BEGIN
	a:= nil;
	a2:= nil;
	l:= nil;
	l2:= nil;
	armarArbol(a,a2,l);
	informarArbol(a);
	
	writeln('---------------------------');
	
	informarArbol2(a2);
	
	writeln('---------------------------');
	
	writeln('Ingrese una marca: ');
	readln(marca);
	autosTotal:= 0;
	CantAutosA1(a,marca,autosTotal);
	writeln('La cantidad de autos de la marca ', marca, ' es de: ', autosTotal);
	
	writeln('---------------------------');
	
	writeln('Ingrese una marca: ');;
	readln(marca);
	autosTotal:= 0;
	CantAutosA2(a2,marca,autosTotal);
	writeln('La cantidad de autos de la marca ', marca, ' es de: ', autosTotal);
	
	writeln('---------------------------');
	
	cargarListaAnos(a,l2);
	informarLista2(l2);
	
	writeln('---------------------------');
	
	writeln('Ingrese una patente: ');
	readln(patente);
	modelo:= '';
	autoPorPatente(a,patente,modelo);
	writeln('La patente ingresada es de un: ', modelo);
	
	writeln('---------------------------');
	
	writeln('Ingrese una patente: ');
	readln(patente);
	modelo:= 'nada';
	autoPorPatente2(a2,patente,modelo);
	writeln('La patente ingresada es de un: ', modelo);
END.

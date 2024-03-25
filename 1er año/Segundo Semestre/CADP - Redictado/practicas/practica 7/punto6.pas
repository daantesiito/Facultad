program punto6;
type
	rangoCategorias = 1..7;
	objeto = record
		cod: integer;
		cat: rangoCategorias;
		nombre: string;
		distancia: real;
		descubridor: string;
		ano: integer;
	end;
	
	vectorCategorias = array [rangoCategorias] of integer;
	
	lista = ^nodo;
	nodo = record
		dato: objeto;
		sig: lista;
	end;
	
procedure LeerObjeto(var o: objeto);
begin
	readln(o.cod);
	readln(o.cat);
	readln(o.nombre);
	readln(o.distancia);
	readln(o.descubridor);
	readln(o.ano);
end;

procedure AgregarAdelante(var l: lista; o: objeto);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= o;
	aux^.sig:= l;
	l:= aux;
end;

procedure InicializarVector(var v: vectorCategorias);
var
	i: integer;
begin
	for i:= 1 to 7 do begin
		v[i]:= 0;
	end;
end;

procedure CargarLista(l: lista);
var
	o: objeto;
begin
	LeerObjeto(o);
	while (l <> nil) and (o.cod <> -1) do begin
		AgregarAdelante(l,o);
		LeerObjeto(o);
	end;
end;

procedure CODpares(num: integer; l: lista);
var
	dig, contpar, contimpar: integer;
begin
	contpar:= 0;
	contimpar:= 0;
	while num <> 0 do begin
		dig:= num MOD 10;
		if ((dig MOD 2) = 0) then
			contpar:= contpar + 1
		else if ((dig MOD 2) = 1) then
			contimpar:= contimpar + 1;
	end;
	if (contpar > contimpar) then
		writeln(l^.dato.nombre);
end;

procedure procesarTodo(l: lista; v: vectorCategorias);
var
	distmax1, distmax2: real;
	codmax2, codmax1, contPlanetasGalileo: integer;
	cate: rangoCategorias;
begin
	distmax1:= 0;
	distmax2:= 0;
	codmax1:= 0;
	codmax2:= 0;
	contPlanetasGalileo:= 0;
	CargarLista(l);
	while (l <> nil) do begin
		// 1
		if (l^.dato.distancia > distmax1) then begin
			distmax2:= distmax1;
			distmax1:= l^.dato.distancia;
			codmax2:= codmax1;
			codmax1:= l^.dato.cod;
		end
		else if (l^.dato.distancia > distmax2) then begin
			distmax2:= l^.dato.distancia;
			codmax2:= l^.dato.cod;
		end;
		// 2
		if (l^.dato.descubridor = 'Galileo Galilei') and (l^.dato.ano < 1600) then 
			contPlanetasGalileo:= contPlanetasGalileo + 1;
		// 3
		cate:= l^.dato.cat;
		v[cate]:= v[cate] + 1;
		l:= l^.sig;
		// 4
		CODpares(l^.dato.cod,l);
	end;
	writeln('El codigo del objeto mas lejano de la tierra es: ', codmax1, ' y el segundo mas lejano es: ', codmax2);
	writeln('La cantidad de planetas descubiertos por Galileo Galilei son: ', contPlanetasGalileo);
end;

var
	l: lista;
	v: vectorCategorias;
begin
	l:= nil;
	InicializarVector(v);
	procesarTodo(l,v);
end.

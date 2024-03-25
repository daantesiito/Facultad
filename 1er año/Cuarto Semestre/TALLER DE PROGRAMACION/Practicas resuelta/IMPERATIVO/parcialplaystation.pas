program parcialplaystation;
type
	dias = 1..31;
	meses = 1..12;
	compra = record
		codJuego: integer;
		codCli: integer;
		dia: dias;
		mes: meses;
	end;
	
	arbol = ^nodoarbol;
	nodoarbol = record
		dato: compra;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [meses] of integer;
	
	lista = ^nodolista;
	nodolista = record
		dato: compra;
		sig: lista;
	end;

procedure LeerCompras(var c: compra);
begin
	writeln('Ingrese el codigo de cliente: ');
	readln(c.codCli);
	if c.codCli <> 0 then begin
		writeln('Ingrese el codigo de juego: ');
		readln(c.codJuego);
		writeln('Ingrese el dia: ');
		readln(c.dia);
		writeln('Ingrese el mes: ');
		readln(c.mes);
	end;
end;

procedure CargarArbol(var a: arbol; c: compra);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= c;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (c.codCli < a^.dato.codCli) then
			CargarArbol(a^.HI,c)
		else
			CargarArbol(a^.HD,c);
end;

procedure ArmarArbol(var a: arbol; var v: vector);
var
	c: compra;
begin
	LeerCompras(c);
	while c.codCli <> 0 do begin
		v[c.mes]:= v[c.mes] + 1;
		CargarArbol(a,c);
		LeerCompras(c);
	end;
end;

procedure InformarArbol(a: arbol);
begin
	if (a <> nil) then begin
		InformarArbol(a^.HI);
		writeln('Codigo Cliente: ');
		writeln(a^.dato.codCli);
		writeln('Codigo Juego: ');
		writeln(a^.dato.codJuego);
		writeln('Dia: ');
		writeln(a^.dato.dia);
		writeln('Mes: ');
		writeln(a^.dato.mes);
		InformarArbol(a^.HD);
	end;
end;

procedure InicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 12 do begin
		v[i]:=0;
	end;
end;

procedure InformarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 12 do begin
		writeln('La cantidad de compras realizadas en el mes ', i, ' es de: ', v[i])
	end;
end;

procedure AgregarAdelante(var l: lista; c: compra);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= c;
	aux^.sig:= l;
	l:= aux;
end;

procedure ComprasCliente(a: arbol; cli: integer; var l: lista);
begin
	if (a <> nil) then begin
		ComprasCliente(a^.HI,cli,l);
		if a^.dato.codCli = cli then
			AgregarAdelante(l,a^.dato);
		ComprasCliente(a^.HD,cli,l);
	end;
end;

procedure InformarLista(l: lista);
var
	aux: lista;
begin
	aux:= l;
	while (aux <> nil) do begin
		writeln('Codigo de Cliente en lista: ');
		writeln(aux^.dato.codCli);
		writeln('Codigo de Juego en lista: ');
		writeln(aux^.dato.codJuego);
		writeln('Dia en lista: ');
		writeln(aux^.dato.dia);
		writeln('Mes en lista: ');
		writeln(aux^.dato.mes);
		aux:= aux^.sig;
	end;
end;

procedure seleccion(var v: vector);
var
	i,j,pos: integer;
	item: integer;
begin
	for i:= 1 to 12-1 do begin
		pos:= i;
		for j:= i+1 to 12 do begin
			if v[j] > v[pos] then
				pos:= j;
		end;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
	end;
end;

procedure InformarVectorv2(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 12 do begin
		writeln('Orden de mayor a menor, ', v[i], ' esta en la pos: ', i);
	end;
end;

var
	a: arbol;
	v: vector;
	l: lista;
	cli: integer;
BEGIN
	a:= nil;
	InicializarVector(v);
	ArmarArbol(a,v);
	
	writeln('i--------------------------------------');
	
	InformarArbol(a);
	
	writeln('ii--------------------------------------');
	
	InformarVector(v);
	
	writeln('b--------------------------------------');
	
	writeln('Ingrese un codigo de cliente: ');
	readln(cli);
	ComprasCliente(a,cli,l);
	InformarLista(l);
	
	writeln('c--------------------------------------');
	
	seleccion(v);
	InformarVectorv2(v);
	
	writeln('---------------------------------------');
END.

program p3prac5;
type
	rubros = 1..10;
	
	producto = record
		codigo: integer;
		rubro: rubros;
		stock: integer;
		precio: integer;
	end;
	
	arbol = ^nodoarbol;
	nodoarbol = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [rubros] of arbol;

procedure LeerProducto(var p: producto);
begin
	writeln('Ingrese un codigo: ');
	readln(p.codigo);
	if p.codigo <> -1 then begin
		writeln('Ingrese un rubro: ');
		readln(p.rubro);
		writeln('Ingrese el stock: ');
		readln(p.stock);
		writeln('Ingrese el precio: ');
		readln(p.precio);
	end;
end;

procedure CargarArbol(var a: arbol; p: producto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (p.codigo < a^.dato.codigo) then
			CargarArbol(a^.HI,p)
		else
			CargarArbol(a^.HD,p);
end;

procedure ArmarArbol(var v: vector);
var
	p: producto;
begin
	LeerProducto(p);
	while (p.codigo <> -1) do begin
		CargarArbol(v[p.rubro],p);
		LeerProducto(p);
	end;
end;

procedure InicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 10 do begin
		v[i]:= nil;
	end;
end;

procedure InformarArbol(a: arbol; v: vector; var i: integer);
begin
	if a = nil then
		writeln('b');
	if (a <> nil) then begin
		InformarArbol(a^.HI,v,i);
		writeln('a');
		i:= i + 1;
		writeln(v[i]^.dato.codigo);
		writeln(v[i]^.dato.rubro);
		writeln(v[i]^.dato.stock);
		writeln(v[i]^.dato.precio);
		InformarArbol(a^.HD,v,i);
	end;
end;

var
	a: arbol;
	v: vector;
	i: integer;
BEGIN
	a:= nil;
	InicializarVector(v);
	ArmarArbol(v);
	i:= 0;
	InformarArbol(a,v,i);
	
END.

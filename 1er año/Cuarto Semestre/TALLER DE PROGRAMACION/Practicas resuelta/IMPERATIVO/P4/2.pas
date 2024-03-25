program p2prac4;
type
	prestamo = record
		ISBN: integer;
		numsocio: integer;
		dia: integer;
		mes: integer;
		cantdias: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: prestamo;
		HI: arbol;
		HD: arbol;
	end;
	

procedure leerprestamos(var p: prestamo);
begin
	writeln('Ingrese el ISBN del libro: ');
	readln(p.ISBN);
	if (p.isbn <> -1) then begin
		writeln('Ingrese el numero de socio: ');
		readln(p.numsocio);
		writeln('Ingrese el dia: ');
		readln(p.dia);
		writeln('Ingrese el mes: ');
		readln(p.mes);
		writeln('Ingrese la cantidad de dias de prestamo: ');
		readln(p.cantdias);
	end;
end;

procedure cargarArbol(var a: arbol; p: prestamo);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if (p.ISBN < a^.dato.ISBN) then
			cargarArbol(a^.HI,p)
		else
			cargarArbol(a^.HD,p);
end;


procedure armarArbol(var a: arbol);
var
	p: prestamo;
begin
	leerprestamos(p);
	while (p.ISBN <> -1) do begin
		cargarArbol(a,p);
		leerprestamos(p);
	end;
end;

var
	a: arbol;

BEGIN
	a:= nil;
	armarArbol(a);
	
END.


















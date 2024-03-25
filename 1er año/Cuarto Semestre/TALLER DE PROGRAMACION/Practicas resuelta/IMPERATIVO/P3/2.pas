program p2prac3;
type
    venta = record
        codigo:integer;
        fecha:integer;
        cant:integer;
    end;

    arbol=^nodo;
    nodo=record
        dato:venta;
        HI:arbol;
        HD:arbol;
    end;

procedure leerVenta(var v:venta);
begin
    writeln('inserte codigo: ');
    readln(v.codigo);
    if(v.codigo <> 0)then begin
        writeln('inserte fecha: ');
        readln(v.fecha);
        writeln('inserte cantidad vendida: ');
        readln(v.cant);
    end;
    writeln('');
end;

procedure cargarArbol(var a:arbol; v:venta);
begin
    if(a = nil)then begin
        new(a);
        a^.dato:= v;
        a^.HI:= nil;
        a^.HD:= nil;
    end
    else
        if(v.codigo > a^.dato.codigo)then
            cargarArbol(a^.HI,v)
        else
            cargarArbol(a^.HD,v)
end;

procedure crearArbol(var a:arbol);
var
    v:venta;
begin
    leerVenta(v);
    while(v.codigo<>0)do begin
        cargarArbol(a,v);
        leerVenta(v);
    end;
end;

procedure totalvendidasB(a: arbol; cod: integer; var cantvendidasB: integer);
begin
	if (a <> nil) then begin
		totalvendidasB(a^.HI,cod,cantvendidasB);
		if (cod = a^.dato.codigo) then
			cantvendidasB:= a^.dato.cant;
		totalvendidasB(a^.HD,cod,cantvendidasB)
	end;
end;

var
	a1, a2: arbol;
	cod, cod2, cantvendidasB: integer;
BEGIN
	a1:= nil;
	crearArbol(a1);
	
	a2:= nil;
	crearArbol(a2);
	
	cantvendidasB:= 0;
	writeln('Ingrese un codigo a buscar en el arbol 1: ');
	readln(cod);
	totalvendidasB(a1,cod,cantvendidasB);
	writeln('La cantidad total vendida es de: ', cantvendidasB);
	
	cantvendidasB:= 0;
	writeln('Ingrese un codigo a buscar en el arbol 2: ');
	readln(cod2);
	totalvendidasB(a2,cod2,cantvendidasB);
	writeln('La cantidad total vendida es de: ', cantvendidasB);
END.

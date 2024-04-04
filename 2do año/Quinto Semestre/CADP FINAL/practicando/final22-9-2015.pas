program final;
type
	rango = 1..300;
	ventas = record
		numProd: rango;
		cantVendidas: integer;
		nomProd: string;
	end;

	precios = array [rango] of real;
	
	listaVentas = ^nodo;
	nodo = record
		dato: ventas;
		sig: listaVentas;
	end;
	
procedure CargarPrecios(var p: precios);
var
	i: integer;
begin
	for i:= 1 to 300 do begin
		p[i]:= i;;
	end;
end;

procedure CalcularMinimo(l: listaVentas; p: precios; var minProducto: integer; var minGanancia: real);
var
	mismoProd: integer;
	totalGanancia: real;
begin
	mismoProd:= 0;
	while l <> nil do begin
		mismoProd:= l^.dato.numProd;
		totalGanancia:= 0;
		while l^.dato.numProd = mismoProd do begin
			totalGanancia:= l^.dato.cantVendidas * p[l^.dato.numProd];
			l:= l^.sig;
		end;
		if totalGanancia < minGanancia then begin
			minGanancia:= totalGanancia;
			minProducto:= mismoProd;
		end;
	end;
end;

var
	minGanancia: real;
	minProducto: integer;
	p: precios;
	l: listaVentas;
begin
	l:= nil;
	minGanancia:= 0;
	minProducto:= 0;
	CargarPrecios(p);
	CalcularMinimo(l,p,minProducto,minGanancia);
	writeln('El producto con menor ganancia es: ', minProducto, ' con: ', minGanancia)
end.

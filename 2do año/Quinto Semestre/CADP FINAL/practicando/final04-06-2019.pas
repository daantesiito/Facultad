program final;
type
	ventas = record
		codigoV: integer;
		codigoP: integer;
		cant: integer;
	end;
	
	listaVentas = ^nodo;
	nodo = record
		dato: ventas;
		sig: listaVentas;
	end;
	
procedure LeerVentas(var v: ventas);
begin
	readln(v.codigoV);
	if v.codigoV <> 9999 then begin
		readln(v.codigoP);
		readln(v.cant);
	end;
end;

procedure AgregarAdelante(var l: listaVentas; v: ventas);
var
	aux: listaVentas;
begin
	new(aux);
	aux^.dato:= v;
	aux^.sig:= l;
	l:= l^.sig;
end;

procedure llenarLista(var l: listaVentas; var v: ventas);
begin
	LeerVentas(v);
	while v.codigoV <> 9999 do begin
		AgregarAdelante(l,v);
		LeerVentas(v);
	end;
end;

procedure InformarCantProd(l: listaVentas; codigo: integer; cantVendidos: integer);
begin
	while (l <> nil) do begin
		if (l^.dato.codigoP = codigo) then begin
			cantVendidos:= cantVendidos + 1;
		end;
		l:= l^.sig;
	end;
end;


var
	v: ventas;
	l: listaVentas;
	codigo: integer;
	cantVendidos: integer;
begin
	l:= nil;
	codigo:= 0;
	cantVendidos:= 0;
	llenarLista(l,v);
	writeln('Ingrese el codigo de producto a informar ventas: ');
	readln(codigo);
	InformarCantProd(l,codigo,cantVendidos);
	writeln('La cantidad de productos vendidos del codigo: ', codigo, ' es de: ', cantVendidos);
end.

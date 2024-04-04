program final;
type
	ventas = record
		numVenta: integer;
		cantProd: integer;
		tipoPago: String;
	end;
	
	listaVentas = ^nodo;
	nodo = record
		dato: ventas;
		sig: listaVentas;
	end;
	
	listaVentasDigPar = ^nodo2;
	nodo2 = record
		dato: ventas;
		sig: listaVentasDigPar;
	end;

function EsPar(productos: integer): boolean;
var
    dig, cantPares: integer;
begin
    cantPares := 0;
    while (productos <> 0) and (cantPares <= 2) do 
    begin
        dig := productos MOD 10;
        if (dig MOD 2) = 0 then 
            cantPares := cantPares + 1;
        productos := productos DIV 10;
    end;
    if cantPares >= 2 then
        EsPar := True
    else
        EsPar := False;
end;

procedure AgregarAdelante(var l: listaVentasDigPar; v: ventas);
var
	aux: listaVentasDigPar;
begin
	new(aux);
	aux^.dato:= v;
	aux^.sig:= l;
	l:= aux;
end;

procedure AgregarAtras(var l, ult: listaVentasDigPar; v: ventas);
var
	aux: listaVentasDigPar;
begin
	new(aux);
	aux^.dato:= v;
	aux^.sig:= nil;
	if l = nil then
		l:= aux
	else
		ult^.sig:= aux;
	ult:= aux;
end;

procedure HacerListaNueva(l: listaVentas; var l2: listaVentasDigPar; v: ventas);
var
	ult: listaVentasDigPar;
begin
	while (l <> nil) do begin
		if (EsPar(l^.dato.cantProd) = True) then begin
			l2^.dato.numVenta:= l^.dato.numVenta;
			l2^.dato.cantProd:= l^.dato.cantProd;
			l2^.dato.tipoPago:= l^.dato.tipoPago;
			if (l2^.dato.tipoPago = 'tarjeta') then 
				AgregarAdelante(l2,v)
			else // si es efectivo se agrega atras
				AgregarAtras(l2,ult,v);
		end;
		l:= l^.sig;
	end;
end;

VAR
	v: ventas;
	l: listaVentas;
	l2: listaVentasDigPar;
BEGIN
	l:= nil;
	l2:= nil;
	// LeerVentas(v); // Se dispone
	// CargarLista(l,v); // Se dispone
	HacerListaNueva(l,l2,v);
END.



















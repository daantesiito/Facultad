program parcial3tema2;
type
	compra = record
		monto: integer;
		mes: string;
		kilos: integer;
		nombfri: string;
	end;
	
	vectorMeses = array[1..12] of integer;
	
	lista = ^nodo;
	nodo = record
		dato: compra;
		sig: lista;
	end;
	
procedure LeerCompras(var c: compra);
begin
	readln(c.monto);
	readln(c.mes);
	readln(c.kilos);
	readln(c.nombfri);
end;

procedure AgregarOrdenado(var l: lista; c: compra);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.dato:= c;
	act:= l;
	ant:= l;
	while (act <> nil) and (c.nombfri < l^.dato.nombfri) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then
		l:= nue;
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure InicializarVector(var v: vectorMeses);
var
	i: integer;;
begin
	for i:= 1 to 12 do
		v[i]:= 0;
end;

procedure CargarLista(var l: lista);
begin
	l:= nil;
	repeat
		LeerCompras(c);
		AgregarOrdenado(l,c);
	until (c.kilos = 100)
end;

procedure procesar(var l: lista);
var
	frigorificoActual: lista;
	montoActual: integer;
begin
	while (l <> nil) do begin
	frigorificoActual:= l^.dato.nombfri;
	montoActual:= 0;
		while (l <> nil) and (l^.dato.nombfri = frigorificoActual) do begin
			montoActual:= montoActual + l^.dato.monto;
			if montoActual > 45000 do
				writeln('Monto total facturado de :', l^.dato.nombfri, ' supera los 45000.');
			mesesMinimos(v)
			
		end;
	end;
end;

procedure mesesMinimos(v: vectorMeses);
begin
	for i:= 1 to 12 do begin
		if v[i] < min1 do begin
			min2:= min1;
			min1:= v[i];
			min2i:= min1i;
			min1i:= l;
		end;
		else if v[i] < min2 do begin
			min2:= v[i];
			min2i:= l;
		end;
	end;
	writeln('Los dos meses que menos recaudaron son: ', min1,' y ', min2);
end;

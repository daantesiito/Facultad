program parcialturnoctema2;
type
	meses = 1..12;
	compra = record
		codCli: integer;
		mes: meses;
		monto: integer;
	end;
	
	vector = array [meses] of integer;
	
	cliente = record
		compras: compra;
		vecmeses: vector;
	end;
	
	arbol = ^nodoarbol;
	nodoarbol = record
		dato: cliente;
		HI: arbol;
		HD: arbol;
	end;
	
procedure LeerCompra(var c: compra);
begin
	writeln('Ingrese un codigo de cliente: ');
	readln(c.codCli);
	if c.codCli <> 0 then begin
		writeln('Ingrese un mes: ');
		readln(c.mes);
		writeln('Ingrese un monto: ');
		readln(c.monto);
	end;
end;

procedure InicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 12 do begin
		v[i]:= 0;
	end;
end;

procedure CargarArbol(var a: arbol; c: compra);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.compras:= c;
		InicializarVector(a^.dato.vecmeses);
		a^.dato.vecmeses[c.mes]:= c.monto;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (c.codCli = a^.dato.compras.codCli) then
			a^.dato.vecmeses[c.mes]:= a^.dato.vecmeses[c.mes] + c.monto
	else
		if (c.codCli < a^.dato.compras.codCli) then
			CargarArbol(a^.HI,c)
		else
			CargarArbol(a^.HD,c);
end;

procedure ArmarArbol(var a: arbol);
var
	c: compra;
begin
	LeerCompra(c);
	while c.codCli <> 0 do begin
		CargarArbol(a,c);
		LeerCompra(c);
	end;
end;

procedure InformarArbol(a: arbol);
var
	i: integer;
begin
	if (a <> nil) then begin
		writeln('Codigo de Cliente en arbol: ');
		writeln(a^.dato.compras.codCli);
		writeln('Monto en arbol: ');
		writeln(a^.dato.compras.monto);
		writeln('Mes en arbol: ');
		writeln(a^.dato.compras.mes);
		for i:= 1 to 12 do begin
			writeln('Mes: ', i, ', monto total: ', a^.dato.vecmeses[i]);
		end;
		InformarArbol(a^.HI);
		InformarArbol(a^.HD);
	end;
end;

procedure MesMayorGastoCliente(a: arbol; cliente: integer; var retorno,max,maxi: integer);
var
	i: integer;
begin
	if (a <> nil) then begin
		MesMayorGastoCliente(a^.HI,cliente,retorno,max,maxi);
		if (a^.dato.compras.codCli = cliente) then begin
			for i:= 1 to 12 do begin
				if (a^.dato.vecmeses[i] > max) then begin
					max:= a^.dato.vecmeses[i];
					maxi:= i;
				end;
			end;
		end;
		MesMayorGastoCliente(a^.HD,cliente,retorno,max,maxi);
	end;
end;

procedure ClienteMesCero(a: arbol; mes: integer; var retorno: integer);
begin
	if (a <> nil) then begin
		ClienteMesCero(a^.HI,mes,retorno);
		if (a^.dato.vecmeses[mes] = 0) then
			retorno:= retorno + 1;
		ClienteMesCero(a^.HD,mes,retorno);
	end;
end;

var
	a: arbol;
	v: vector;
	client,retorno,max,maxi,mes: integer;
BEGIN
	a:= nil;
	
	writeln('a----------------------------------');
	
	InicializarVector(v);
	ArmarArbol(a);
	InformarArbol(a);
	
	writeln('b----------------------------------');
	
	writeln('Ingrese un Cliente: ');
	readln(client);
	max:=-1;
	maxi:=0;
	retorno:= 0;
	MesMayorGastoCliente(a,client,retorno,max,maxi);
	writeln('El mes que mas gasto el cliente ', client, ' es: ', maxi, ' con un total de: ', max);

	writeln('c----------------------------------');
	
	writeln('Ingrese un mes: ');
	readln(mes);
	retorno:= 0;
	ClienteMesCero(a,mes,retorno);
	writeln('La cantidad de clientes que el mes ', mes, ' no gastaron nada son: ', retorno);
END.

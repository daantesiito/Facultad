program parcialturnodtema1;
type
	envio = record
		codCli: integer;
		dia: integer;
		codPostal: integer;
		peso: integer;
	end;
	
	info = record
		codCli: integer;
		dia: integer;
		peso: integer;
	end;

	lista = ^nodolista;
	nodolista = record
		dato: info;
		sig: lista;
	end;
	
	arbol = ^nodoarbol;
	nodoarbol = record
		dato: lista;
		codPostal: integer;
		HI: arbol;
		HD: arbol;
	end;
	
	listaEnvios = ^nodolistaEnvios;
	nodolistaEnvios = record
		dato: envio;
		sig: listaEnvios;
	end;
	
procedure LeerEnvio(var e: envio);
begin
	writeln('Ingrese un peso: ');
	readln(e.peso);
	if e.peso <> 0 then begin
		writeln('Ingrese un codigo de cliente: ');
		readln(e.codCli);
		writeln('Ingrese un dia: ');
		readln(e.dia);
		writeln('Ingrese un codigo postal: ');
		readln(e.codPostal);
	end;
end;

procedure asignarRegistro(var i: info; e: envio);
begin
	i.codCli:= e.codCli;
	i.dia:= e.dia;
	i.peso:= e.peso;
end;

procedure AgregarAdelante(var l: lista; i: info);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= i;
	aux^.sig:= l;
	l:= aux;
end;

procedure AgregarAdelante2(var l: listaEnvios; e: envio);
var
	aux: listaEnvios;
begin
	new(aux);
	aux^.dato:= e;
	aux^.sig:= l;
	l:= aux;
end;

procedure cargarArbol(var a: arbol; i: info; codPostal: integer);
begin
	if (a = nil) then begin
		new(a);
		a^.codPostal:= codPostal;
		a^.dato:= nil;
		AgregarAdelante(a^.dato,i);
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if codPostal = a^.codPostal then
			AgregarAdelante(a^.dato,i)
	else
		if codPostal <= a^.codPostal then
			cargarArbol(a^.HI,i,codPostal)
		else
			cargarArbol(a^.HD,i,codPostal);
end;

procedure ArmarArbol(var a: arbol);
var
	e: envio;
	i: info;
begin
	LeerEnvio(e);
	asignarRegistro(i,e);
	while (e.peso <> 0) do begin
		cargarArbol(a,i,e.codPostal);
		LeerEnvio(e);
		asignarRegistro(i,e);
	end;
end;

procedure InformarArbol(a: arbol);
var
	aux: lista;
begin
	if (a <> nil) then begin
		aux:= a^.dato;
		while (aux <> nil) do begin
			writeln('Codigo postal: ');
			writeln(a^.codPostal);
			writeln('Peso: ');
			writeln(aux^.dato.peso);
			writeln('Dia: ');
			writeln(aux^.dato.dia);
			writeln('Codigo Cliente: ');
			writeln(aux^.dato.codCli);
			aux:= aux^.sig;
		end;
		InformarArbol(a^.HI);
		InformarArbol(a^.HD);
	end;
end;

procedure EnviosCodPostal(a: arbol; codPostal: integer; var l2: listaEnvios);
var
	env: envio;
begin
	if (a <> nil) then begin
		EnviosCodPostal(a^.HI,codPostal,l2);
		if (a^.codPostal = codPostal) then begin
			env.codPostal:= a^.codPostal;
			env.peso:= a^.dato^.dato.peso;
			env.codCli:= a^.dato^.dato.codCli;
			env.dia:= a^.dato^.dato.dia;
			AgregarAdelante2(l2,env);
		end;
		EnviosCodPostal(a^.HD,codPostal,l2);
	end;
end;

procedure InformarLista2(l: listaEnvios);
var
	aux: listaEnvios;
begin
	aux:= l;
	if aux = nil then
	while (aux <> nil) do begin
		writeln(aux^.dato.codPostal);
		writeln(aux^.dato.peso);
		writeln(aux^.dato.codCli);
		writeln(aux^.dato.dia);
		aux:= aux^.sig;
	end;
end;

procedure EnvioMayorMenorPeso(l: listaEnvios; var codMayor,codMenor,min,max: integer);
var
	aux: listaEnvios;
begin
	aux:= l;
	if (aux <> nil) then begin
		if (aux^.dato.peso > max) then begin
			max:= aux^.dato.peso;
			codMayor:= aux^.dato.codCli;
		end
		else if (aux^.dato.peso < min) then begin
				min:= aux^.dato.peso;
				codMenor:= aux^.dato.codCli;
			end;
		EnvioMayorMenorPeso(aux^.sig,codMayor,codMenor,min,max);
	end;
end;

var
	a: arbol;
	l2: listaEnvios;
	codPostal,codMayor,codMenor,min,max: integer;
BEGIN
	a:= nil;
	l2:= nil;
	ArmarArbol(a);
	
	writeln('----------------------------------------');
	
	InformarArbol(a);
	
	writeln('----------------------------------------');
	
	writeln('Ingrese un codigo postal');
	readln(codPostal);
	EnviosCodPostal(a,codPostal,l2);
	InformarLista2(l2);
	
	writeln('----------------------------------------');
	
	codMayor:=0;
	codMenor:=0;
	min:=9999;
	max:=-9999;
	EnvioMayorMenorPeso(l2,codMayor,codMenor,min,max);
	writeln('El envio con menor peso es del codigo: ', codMenor, ' y el de mayor peso es del codigo: ', codMayor);
	
	writeln('----------------------------------------');
END.

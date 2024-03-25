program p4prac5;
type
	reclamo = record
		codigo: integer;
		DNI: integer;
		ano: integer;
		tipo: string;
	end;
	
	lista = ^nodolista;
	nodolista = record
		dato: reclamo;
		sig: lista;
	end;
	
	DNIalm = record
		cantReclamos: integer;
		reclamos: lista;
	end;
	
	arbol = ^nodoarbol;
	nodoarbol = record
		dato: DNIalm;
		HI: arbol;
		HD: arbol;
	end;
	
	lista2 = ^nodolista2;
	nodolista2 = record
		dato: integer;
		sig: lista2;
	end;
	
procedure LeerReclamos(var r: reclamo);
begin
	writeln('Ingrese un codigo: ');
	readln(r.codigo);
	if (r.codigo <> -1) then begin
		writeln('Ingrese DNI: ');
		readln(r.DNI);
		writeln('Ingrese el ano: ');
		readln(r.ano);
		writeln('Ingrese tipo de reclamo: ');
		readln(r.tipo);
	end;
end;

procedure AgregarAdelante(var l: lista; r: reclamo);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= r;
	aux^.sig:= l;
	l:= aux;
end;

procedure CargarArbol(var a: arbol; r: reclamo);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.cantReclamos:= 1;
		AgregarAdelante(a^.dato.reclamos,r);
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (r.DNI = a^.dato.reclamos^.dato.DNI) then begin
			a^.dato.cantReclamos:= a^.dato.cantReclamos + 1;
			AgregarAdelante(a^.dato.reclamos,r);
		end
	else
		if (r.DNI <= a^.dato.reclamos^.dato.DNI) then
			CargarArbol(a^.HI,r)
		else
			CargarArbol(a^.HD,r);
end;

procedure ArmarArbol(var a: arbol);
var
	r: reclamo;
begin
	LeerReclamos(r);
	while (r.codigo <> -1) do begin
		CargarArbol(a,r);
		LeerReclamos(r);
	end;
end;

procedure InformarArbol(a: arbol);
var
	aux: lista;
begin
	if (a <> nil) then begin
		InformarArbol(a^.HI);
		aux:= a^.dato.reclamos;
		while aux <> nil do begin
			writeln('Codigo: ');
			writeln(aux^.dato.codigo);
			writeln('DNI: ');
			writeln(aux^.dato.DNI);
			writeln('Ano: ');
			writeln(aux^.dato.ano);
			writeln('Tipo: ');
			writeln(aux^.dato.tipo);
			aux:= aux^.sig;
		end;
		InformarArbol(a^.HD);
	end;
end;

procedure cantReclamosDNI(a: arbol; DNI: integer; var cantiReclamos: integer);
var
	aux: lista;
begin
	if (a <> nil) then begin
		cantReclamosDNI(a^.HI,DNI,cantiReclamos);
		aux:= a^.dato.reclamos;
		while (aux <> nil) do begin
			if (aux^.dato.DNI = DNI) then
				cantiReclamos:= cantiReclamos + 1;
			aux:= aux^.sig;
		end;
		cantReclamosDNI(a^.HD,DNI,cantiReclamos);
	end;
end;

procedure cantReclamosDOSDNI(a: arbol; DNI1,DNI2: integer; var cantiReclamos: integer);
var
	aux: lista;
begin
	if (a <> nil) then begin
		aux:= a^.dato.reclamos;
		if (a^.dato.reclamos^.dato.DNI > DNI1) then begin
			if (a^.dato.reclamos^.dato.DNI < DNI2) then begin
				while (aux <> nil) do begin
					cantiReclamos:= cantiReclamos + 1;
					aux:= aux^.sig;
				end;
				cantReclamosDOSDNI(a^.HI,DNI1,DNI2,cantiReclamos);
				cantReclamosDOSDNI(a^.HD,DNI1,DNI2,cantiReclamos);
			end
			else
				cantReclamosDOSDNI(a^.HI,DNI1,DNI2,cantiReclamos);
		end
		else
			cantReclamosDOSDNI(a^.HD,DNI1,DNI2,cantiReclamos);
	end;
end;

procedure AgregarAdelante2(var l: lista2; cod: integer);
var
	aux: lista2;
begin
	new(aux);
	aux^.dato:= cod;
	aux^.sig:= l;
	l:= aux;
end;

procedure ReclamosAnoCodigo(a: arbol; ano: integer);
var
	aux: lista;
	aux2: lista2;
begin
	if (a <> nil) then begin
		ReclamosAnoCodigo(a^.HI,ano);
		aux:= a^.dato.reclamos;
		while aux <> nil do begin
			if aux^.dato.ano = ano then
				writeln('a');
				AgregarAdelante2(aux2,aux^.dato.codigo);
			aux:= aux^.sig;
		end;
		ReclamosAnoCodigo(a^.HD,ano);
	end;
end;

procedure informarLista2(l: lista2);
var
	aux: lista2;
begin
	aux:= l;
	while (aux <> nil) do begin
		writeln(aux^.dato);
	end;
end;

var
	a: arbol;
	DNI1,DNI2,cantiReclamos,ano: integer;
	l2: lista2;
BEGIN
	a:= nil;
	l2:= nil;
	ArmarArbol(a);
	{InformarArbol(a);
	
	writeln('---------------------------');
	
	writeln('Ingrese un DNI a buscar: ');
	readln(DNI1);
	cantiReclamos:= 0;
	cantReclamosDNI(a,DNI1,cantiReclamos);
	writeln('La cantidad de reclamos del DNI ', DNI1, ' es de: ', cantiReclamos);
	
	writeln('---------------------------');
	
	writeln('Ingrese un DNI a buscar: ');
	readln(DNI1);
	writeln('Ingrese un DNI a buscar: ');
	readln(DNI2);
	cantiReclamos:= 0;
	cantReclamosDOSDNI(a,DNI1,DNI2,cantiReclamos);
	writeln('La cantidad de reclamos entre DNI ', DNI1, ' y ', DNI2, ' es de: ', cantiReclamos);
	
	writeln('---------------------------');}
	
	writeln('Ingrese un ANO a buscar: ');
	readln(ano);
	ReclamosAnoCodigo(a,ano);
	informarLista2(l2);
	
	writeln('---------------------------');
END.

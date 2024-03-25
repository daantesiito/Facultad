program parcialTurnoFtema2;
type
	meses = 0..12;
	codigos = 1..15;
	
	atenciones = record
		DNI: integer;
		mes: meses;
		cod: codigos;
	end;
	
	DNItotal = record
		cantAtenciones: integer;
		DNI: integer;
	end;
	
	arbol = ^nodoarbol;
	nodoarbol = record
		dato: DNItotal;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [codigos] of integer;
	
procedure LeerAtenciones(var at: atenciones);
begin
	writeln('Inserte un mes: ');
	readln(at.mes);
	if (at.mes <> 0) then begin
		writeln('Inserte un DNI: ');
		readln(at.DNI);
		writeln('Inserte un codigo: ');
		readln(at.cod);
	end;
end;

procedure CargarArbol(var a: arbol; at: atenciones);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.DNI:= at.DNI;
		a^.dato.cantAtenciones:= 1;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (at.DNI = a^.dato.DNI) then
			a^.dato.cantAtenciones:= a^.dato.cantAtenciones + 1
	else
		if (at.DNI <= a^.dato.DNI) then
			CargarArbol(a^.HI,at)
		else
			CargarArbol(a^.HD,at);
end;

procedure ArmarArbol(var a: arbol; var v: vector);
var
	at: atenciones;
begin
	LeerAtenciones(at);
	while (at.mes <> 0) do begin
		v[at.cod]:= v[at.cod] + 1;
		CargarArbol(a,at);
		LeerAtenciones(at);
	end;
end;

procedure InformarArbol(a: arbol);
begin
	if (a <> nil) then begin
		InformarArbol(a^.HI);
		writeln('DNI: ');
		writeln(a^.dato.DNI);
		writeln('Cant Atenciones: ');
		writeln(a^.dato.cantAtenciones);
		writeln('-----------');
		InformarArbol(a^.HD);
	end;
end;

procedure InicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 15 do begin
		v[i]:= 0;
	end;
end;

procedure InformarVector(v: vector);
var
	i: integer;
begin
	for i:= 1 to 15 do begin
		writeln('Cant Atenciones para el diagnostico ', i, ' es de: ', v[i]);
	end;
end;

procedure AtencionesDNI(a: arbol; DNI1,DNI2,num: integer; var retorno: integer);
begin
	if (a <> nil) then begin
		if (a^.dato.DNI > DNI1) then begin
			if (a^.dato.DNI < DNI2) then begin
				if (a^.dato.cantAtenciones > num) then
					retorno:= retorno + 1;
				AtencionesDNI(a^.HI,DNI1,DNI2,num,retorno);
				AtencionesDNI(a^.HD,DNI1,DNI2,num,retorno);
			end;
			AtencionesDNI(a^.HI,DNI1,DNI2,num,retorno);
		end;
		AtencionesDNI(a^.HD,DNI1,DNI2,num,retorno);
	end;
end;

procedure AtencionesCero(v: vector; var retorno,i: integer);
begin
	if (i <> 16) then begin
		i:= i + 1;
		if (v[i] = 0) then
			retorno:= retorno + 1;
		AtencionesCero(v,retorno,i);
	end;
end;

var
	a: arbol;
	v: vector;
	DNI1,DNI2,num,retorno,i: integer;
BEGIN
	a:= nil;
	InicializarVector(v);
	ArmarArbol(a,v);
	
	writeln('------------------------------------');
	
	InformarArbol(a);
	
	writeln('------------------------------------');
	
	InformarVector(v);
	
	writeln('------------------------------------');
	
	writeln('Ingrese un DNI: ');
	readln(DNI1);
	writeln('Ingrese otro DNI: ');
	readln(DNI2);
	writeln('Ingrese un Numero: ');
	readln(num);
	retorno:= 0;
	AtencionesDNI(a,DNI1,DNI2,num,retorno);
	writeln('El numero de dnis con mayor cant de atenciones que ', num, ' es de: ', retorno);
	
	writeln('------------------------------------');
	
	retorno:= 0;
	i:= 0;
	AtencionesCero(v,retorno,i);
	writeln('La cantidad de diagnosticos con 0 atenciones son: ', retorno);
	
	writeln('------------------------------------');
END.

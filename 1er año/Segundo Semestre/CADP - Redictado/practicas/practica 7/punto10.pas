program punto10;
type
	dimF = 1..20;
	empresa = record
		codigo: integer;
		nombre_emp: string;
		estopriv: string;
		ciudad_rad: string;
		cultivos: dimF;
	end;
	
	cultivo = record
		tipo: string;
		hectareas: integer;
		meses: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: empresa;
		sig: lista;
	end;
	
	vectorCultivos = array[dimF] of cultivo;
	
procedure LeerEmpresas(var e: empresa);
begin
	readln(e.codigo);
	readln(e.nombre_emp);
	readln(e.estopriv);
	readln(e.ciudad_rad);
	readln(e.cultivos);
end;

procedure LeerCultivos(var c: cultivo);
begin
	readln(c.tipo);
	readln(c.hectareas);
	readln(c.meses);
end;

procedure LeerVectorCultivos(var v: vectorCultivos; c: cultivo; var SumaTotalHectareas: integer; var SumaTotalSoja: integer);
var
	dimL: integer;
begin
	dimL:= 0;
	LeerCultivos(c);
	while (c.hectareas <> 0) and (dimL < 20) do begin
		SumaTotalHectareas:= SumaTotalHectareas + c.hectareas;
		if c.tipo = 'soja' then
			SumaTotalSoja:= SumaTotalSoja + c.hectareas;
		dimL:= dimL + 1;
		v[dimL].tipo:= c.tipo;
		v[dimL].hectareas:= c.hectareas;
		v[dimL].meses:= c.meses;
		LeerCultivos(c);
	end;
end;

procedure AgregarAdelante(var l: lista; e: empresa);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= e;
	aux^.sig:= l;
	l:= aux;
end;

procedure CargarLista(l: lista; e: empresa);
begin
	LeerEmpresas(e);
	while (e.codigo <> -1) do begin
		AgregarAdelante(l,e);
		LeerEmpresas(e);
	end;
end;

function cultivanTrigo(v: vectorCultivos; var trigo: boolean): boolean;
var
	i: integer;
begin
	trigo:= False;
	i:= 1;
	while i < 20 and trigo = False do begin
		if v[i].tipo = trigo then
			trigo:= True;
		i:= i + 1;
	end;
	if trigo = True then
		cultivanTrigo:= True;
end;

function contieneDosCero(codigo: integer): boolean;
var
	dig, sumaCeros: integer;
begin
	dig:= codigo mod 10;
	while codigo <> 0 and sumaCeros < 2 do begin
		if ((dig mod 2) = 0) then
			sumaCeros:= sumaCeros + 1;
		num:= codigo div 10;
	end;
	if sumaCeros:= 2 then
		contieneDosCero:= True;
end;

procedure procesarTodo();
var
	SumaTotalHectareas, SumaTotalSoja: integer;
begin
	SumaTotalHectareas:= 0;
	SumaTotalSoja:= 0;
	LeerVectorCultivos(v, SumaTotalHectareas, SumaTotalSoja);
	while l <> nil do begin
		if (l^.dato.ciudad_rad = 'San Miguel del Monte') and cultivanTrigo(l^.dato.cultivos,trigo) = True and contieneDosCero(l^.dato.codigo) = True then
			writeln(l^.dato.nombre_emp);
		l:= l^.sig;
	end;
	writeln('Suma total de hectareas de soja: ', SumaTotalSoja, ' y con respecto al total de hectareas: ', SumaTotalHectareas/SumaTotalSoja);
end;

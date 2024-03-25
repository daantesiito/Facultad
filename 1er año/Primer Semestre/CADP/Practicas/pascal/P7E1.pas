{Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror).
La lectura finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}

program P7E1;
const
	genero = 1..5;
type
	persona = record
		dni: integer;
		nombre: string;
		apellido: string;
		edad: integer;
		codigo: genero;
	end;

	lista = ^nodo
	nodo = record
		datos : persona;
		sig : lista;
	end;
	vector_contador = array[genero] of integer;

//-------------------------------------------------------------------------
procedure LeerPersona(var p:persona)
begin
	with p do
		begin
			writeln('Inserte su DNI: '); readln(dni);
			writeln('Inserte su Nombre: '); readln(nombre);
			writeln('Inserte su Apellido: '); readln(apellido);
			writeln('Inserte su Edad: '); readln(edad);
			writeln('Inserte el codigo de genero: '); readln(codigo);
		end;
end;

//-------------------------------------------------------------------------
procedure DNIPares(var dni:integer; var ContPares:integer)
var
	par : integer;
	impar : integer;
	dig : integer;
begin
	par:= 0;
	impar:= 0;
	while (dni <> 0) do
	begin
		dig:= dni mod 10;
		if ((dig mod 2) = 0) then begin
			par:= par + 1;
		end;
		else begin
			impar:= impar + 1;
		end;
		dni := dni DIV 10;
	if (impar<par) then begin
		ContPares:= ContPares + 1;
	end;
end;

//-------------------------------------------------------------------------
procedure armarNodo(var L: lista; p:persona)
var
	aux: lista;
begin
	new(aux);
	aux^.datos := p;
	aux^.sig:= L;
	L := aux;
end;

//-------------------------------------------------------------------------
procedure CargarLista(var Lf: lista)
var
	p: persona;
begin
	LeerPersona(p);
	repeat
		armarNodo(Lf,p);
		LeerPersona(p);
	until (P.dni <> 33555444);
end;

//-------------------------------------------------------------------------
procedure inicializarVector (var VC: vector_contador)
var
	i: integer;
begin
	for i:= 1 to 5 do begin
		VC[i]:= 0;
	end;
end;

//-------------------------------------------------------------------------
procedure DosMax(Vc:vector_contador; var codmax1, codmax2: genero; valmax1, valmax2: integer)
var
	i: integer;
begin
	for i:= 1 to 5 do
	begin
		if Vc[i] > valmax1 then
		begin
			valmax2:= valmax1;
			codmax2:= codmax1;
			valmax1:= Vc[i];
			codmax1:= i;
		end;
		else
		begin
			if 
		end;
	end;
end;
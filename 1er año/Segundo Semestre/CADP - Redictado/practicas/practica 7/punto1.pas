{Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}

program punto1;
type
	generos = 1..5;
	casting = record
		DNI: integer;
		nombre: string;
		apellido: string;
		edad: integer;
		cod_gen: generos
	end;
	
	lista = ^nodo;
	nodo = record
		dato: casting;
		sig: lista;
	end;

	vectorGeneros = array[generos] of integer;

procedure LeerActor(var c: casting);
begin
	writeln('Ingrese su DNI: ');
	readln(c.DNI);
	writeln('Ingrese su Nombre: ');
	readln(c.nombre);
	writeln('Ingrese su Apellido: ');
	readln(c.apellido);
	writeln('Ingrese su edad: ');
	readln(c.edad);
	writeln('Ingrese el codigo de genero deseado: ');
	readln(c.cod_gen);
end;

procedure agregarAdelante(var l: lista; c: casting);
var
	aux: lista;
begin
	new(aux);
	aux^.dato := c;
	aux^.sig:= l;
	l:= aux;
end;

procedure cargarLista(var l: lista);
var
	c: casting;
begin
	l:= nil;
	repeat
		LeerActor(c);
		agregarAdelante(l,c);
	until (c.DNI = 33555444);
end;

{a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}

procedure procesar_todo(var c: casting; l: lista; var vgeneros: vectorGeneros);
var
	DNIactual: nodo;
	dig, cantPares, cantImpares, dniparimpar, max1, max2, maxi1, maxi2: integer;
begin
	max1:= -1;
	max2:= -1;
	while l <> nil do begin
		DNIactual:= l^dato.DNI;
		dniparimpar:= DNIactual;
		dig:= dniparimpar mod 10;
		cargarLista(l)
		while (l <> nil) and (l^dato.DNI = DNIactual) do begin
			while dniparimpar <> 0 do begin
				if dig mod 2 = 0 then
					cantPares:= cantPares + 1;
				else
					cantImpares:= cantImpares + 1;
				dniparimpar:= dniparimpar DIV 10;
			end;
		end;
		for i:= 1 to 5 do begin
			if vgeneros[i] > max1 then begin
				max2:= max1;
				max1:= vgeneros[i];
				maxi2:= maxi1;
				maxi1:= i;
			end;
			else if vgeneros[i] > max2 then begin
				max2:= vgeneros[i];
				maxi2:= i;
			end;
		end;
		l: l^.sig;
	end;
end;
	
var
	l: lista;
	v: vectorGeneros;
	c: casting;
	dimL, elemento: integer;
begin
	procesar_todo(c,l,v);
end.


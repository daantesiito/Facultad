{Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100 camiones. 
De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa.
De cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros
recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando
se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}

program P7E5;
type
	rango = 1..100;
	camion = record
		patente: string[8];
		ano_fab: integer;
		capacidad: real;
	end;

	viaje = record
		cod_via: integer;
		cod_cam: rango;
		km: real;
		ciu_dest: string;
		ano_via: integer;
		DNI: integer;
	end;

	lista = ^nodo;
	nodo = record
		dato: viaje;
		sig: lista;
	end;

	vector = array [rango] of camion;

//----------------------------------------------------------------
procedure LeerViaje(vi: viaje);
begin
	writeln('Codigo de viaje: '); readln(vi.cod_via);
	if (vi.cod_via <> -1) then begin
		writeln('Codigo de camion: '); readln(vi.cod_cam);
		writeln('Distancia en KM: '); readln(vi.km);
		writeln('Ciudad de destino: '); readln(vi.ciu_dest);
		writeln('Año en el que se realizo el viaje: '); readln(vi.ano_via);
		writeln('Dni del chofer: '); readln(vi.dni)
	end;
end;

//----------------------------------------------------------------
Procedure AgregarAdelante (var L:lista; via:viaje);
Var 
    nue:Lista;
Begin  
    New(nue);  
    nue^.dato:=via;  
    nue^.sig:=L;  
    L:=nue;
End;

// 1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que menos kilómetros recorridos posee.
//----------------------------------------------------------------
procedure patmaxmin(var l:lista; var max, min:string);
var
	aux: lista;
	max_km, min_km: real;
	pat_max, pat_min: string;
begin
	max_km:= -1;
	min_km:= 1000000;
	pat_max:= '';
	pat_min:= '';
	aux:= l;
	while aux <> nil do
	begin
		if aux^.dato.km > max_km then
		begin
			max_km:= aux^.dato.km;
			pat_max:= aux^.dato.patente;
		end;
		if aux^.dato.km < min_km then
		begin
			min_km:= aux^.dato.km;
			pat_min:= aux^.dato.patente;
		end;
		aux:= aux^.sig;
	end;
	max:= pat_max;
	min:= pat_min;
end;

// 2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas
// y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el viaje).
//----------------------------------------------------------------
procedure cant_viajes(var l:lista; var cant:integer);
var
	aux: lista;
	capacidad: real;
	antiguedad: integer;
begin
	capacidad:= 30.5;
	antiguedad:= (aux^.dato.año_via - 5);
	aux:= l;
	while aux <> nil do
	begin
		if (aux.^dato.capacidad > capacidad) and (aux.^dato.año_via <= antiguedad) then
			cant:= cant + 1;
		aux:= aux.^sig;
	end;
end;

// 3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares. Nota: Los códigos de viaje no se repiten.
//----------------------------------------------------------------
procedure cod_viajes(var l:lista; var cant:integer);
var
	aux: lista;
	DNI: integer;
begin
	DNI:= 1;
	aux:= l;
	dig:= aux.^dato.DNI MOD 10;
	while aux <> nil do
	begin
		if (dig = 1) then
			cant:= cant + 1;
			dig:= aux.^dato.dni DIV 10;
			dig:= aux.^dato.dni MOD 10;
		if cant = 10 then
			writeln('El chofer que realizo el viaje ', aux.^dato.cod_via, ' con dni ', aux.^dato.dni, ' tiene solo digitos impares.');
		aux:= aux.^sig;
	end;
end;

var
	l: lista;
	vi: viaje;
	max, min: string;
	cant: integer;
begin
	l:= nil;
	cant:= 0;
	repeat
		LeerViaje(vi);
		if vi.cod_via <> -1 then
			agregarAdelante(l, vi);
	until vi.cod_via = -1;
	patmaxmin(l, max, min);
	cant_viajes(l, cant);
end;

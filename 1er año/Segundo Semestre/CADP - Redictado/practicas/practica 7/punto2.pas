{Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}

program punto2;
type
	poliza = 1..6;
	cliente = record
		CODcli: integer;
		DNI: integer;
		apellido: string;
		nombre: string;
		CODpol: poliza;
		monto: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: cliente;
		sig: lista;
	end;
	
	vectorPoliza = array[poliza] of integer;



procedure LeerCliente(var c: cliente);
begin
	readln(c.CODcli);
	readln(c.DNI);
	readln(c.apellido);
	readln(c.nombre);
	readln(c.CODpol);
	readln(c.monto);
end;

procedure agregarAdelante(var l: lista; c: cliente);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= c;
	aux^.sig:= l;
	l:= aux;
end;

procedure cargarLista(var l: lista);
var
	c: cliente;
begin
	l:= NIL;
	repeat
		LeerCliente(c);
		agregarAdelante(l,c);
	until c.CODcli = 1122
end;

function tieneDos9(num: integer): boolean;
var
	contNueves: integer;
	dig: integer;
begin
	contNueves:= 0;
	dig:= (num MOD 10);
	while (num <> 0) and (contNueves < 2) do
	begin
		if (dig MOD 2) = 9 then
			contNueves:= contNueves + 1;
		num := (num DIV 10);
	end;
	if (contNueves >= 2) then
		tieneDos9:= true;
	if (contNueves < 2) then
		tieneDos9:= false;
end;

{a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}

procedure procesar_todo(l: lista; v: vectorPoliza);
var
	CODcliactual: integer;
	montototal: integer;
begin
	while (l <> nil) do begin
		CODcliActual:= l^.dato.CODcli;
		while (l <> nil) and (l^.dato.CODcli = CODcliActual) do begin
			writeln('Nombre: ', l^.dato.nombre);
			writeln('Apellido: ', l^.dato.apellido);
			writeln('DNI: ', l^.dato.DNI);
			montototal:= (l^.dato.monto + v[l^.dato.CODpol]);
			writeln('Monto a pagar: ', montototal);
		end;
		if tieneDos9(l^.dato.DNI) then begin
			writeln('Nombre: ', l^.dato.nombre, ' Apellido: ', l^.dato.apellido, ' tiene al menos dos digitos nueve en su DNI.');
		end;
	end;
end;

procedure eliminar (var l: lista; num: integer);
var 
    actual, ant: lista;
begin
    actual:= l;
	
	while (actual <> nil) and (actual^.elem <> num) do begin
		ant:= actual;
		actual:= actual^.sig;
	end;
	
	if (actual <> nil) then begin
		if (actual = l) then begin
			l:= l^.sig;	
		end
		else begin
			ant^.sig:= actual^.sig;
		end;
		dispose(actual);
	end;
	
end;

var
	l: lista;
	v: vectorPoliza;
	c: cliente;
begin
	cargarLista(l);
	// cargarVectorPolizas(v)
	procesar_todo(l,v)
	eliminar(l,c.CODcli)
end.

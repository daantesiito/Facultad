// Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
// consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
// cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
// y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
// la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
// a. Realizar un módulo que lea la información de una línea de teléfono.
// b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
// módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
// del cliente.
// Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.

program P3E4;
type
	cliente = record
		codCl : integer;
		cantLin : integer;
end;
	linea = record
		numero : integer;
		minutoscon : integer;
		mbcon : integer;
end;

procedure leerlinea(var lin : linea);
	begin
		writeln('Ingrese su numero: ');
		readln(lin.numero);
		writeln('Ingrese los minutos consumidos: ');
		readln(lin.minutoscon);
		writeln('Ingrese mb consumidos: ');
		readln(lin.mbcon);
	end;

procedure leercliente(var cli : cliente);
	begin
		writeln('Ingrese su codigo de cliente: ');
		readln(cli.codCl);
		writeln('Ingrese la cantidad de lineas que tiene: ');
		readln(cli.cantLin);
	end;

var
	c : cliente;
	l : linea;
	i, i2 : integer;
	minfac, mbfac, sumamin, sumamb : real;
begin
	i := 0;
	i2 := 0;
	minfac := 0;
	mbfac := 0;
	sumamin := 0;
	sumamb := 0;
	for i:= 1 to 2 do begin // 1 to 9300
		leercliente(c);
		leerlinea(l);
		if c.cantLin > 1 then begin
			for i2:= 1 to (c.cantLin - 1) do begin
				leerlinea(l);
				minfac := l.minutoscon * 3.40;
				mbfac := l.mbcon * 1.35;
				sumamin := sumamin + minfac;
				sumamb := sumamb + mbfac;
			sumamintotal
				end;
		if c.cantLin = 1 then begin
			minfac := l.minutoscon * 3.40;
			mbfac := l.mbcon * 1.35;
			sumamin := sumamin + minfac;
			sumamb := sumamb + mbfac;
			end;
		end;
	end;
	writeln('Cantidad de minutos a facturar: ', sumamin:1:2);
	writeln('Cantidad de mb a facturar: ', sumamb:1:2);
end.

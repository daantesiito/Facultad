// El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año 2019.
// Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
// a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
// b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido en el inciso a).
// c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al ingresar el año 2020,
// que no debe procesarse, e informe la cantidad de casamientos realizados durante los meses de verano (enero, febrero y marzo) y 
// la cantidad de casamientos realizados en los primeros 10 días de cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.

program P3E2;
type

fecha = record
	dia : integer;
	mes : integer;
	ano : integer;
end;
casamiento = record
	lugar : string;
	fechaC : fecha;
	nombres : string;
end;

procedure leer(var cas : casamiento);
	begin
		writeln('Ingrese el lugar del casamiento: ');
		readln(cas.lugar);
		writeln('Ingrese el dia del casamiento: ');
		readln(cas.fechaC.dia);
		writeln('Ingrese el mes del casamiento: '); 
		readln(cas.fechaC.mes);
		writeln('Ingrese el año del casamiento: ');
		readln(cas.fechaC.ano);
	end;

var
	c: casamiento;
	cont3, cont10: integer;

begin
	cont3:= 0;
	cont10:= 0;
	leer(c);
	while (c.fechaC.ano = 2019) do;
		if c.fechaC.mes = 1 or 2 or 3 then;
			cont3:= cont3 + 1;
		if c.fechaC.dia <= 10 then;
			cont10:= cont10 + 1;
		leer(c);
	writeln('La cantidad de casamientos en verano son: ', cont3);
	writeln('La cantidad de casamientos los primeros 10 dias de todos los meses son: ', cont10);
end.

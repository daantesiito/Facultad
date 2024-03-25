program P3E2v2;
type

fecha = record
	dia : integer;
	mes : string;
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
		read(cas.lugar);
		writeln('Ingrese el dia del casamiento: ');
		read(cas.fechaC.dia);
		writeln('Ingrese el mes del casamiento: ');
		read(cas.fechaC.mes);
		writeln('Ingrese el año del casamiento: ');
		read(cas.fechaC.ano);
	end;

var
	c: casamiento;
	cont3, cont10: integer;

begin
	cont3:= 0;
	cont10:= 0;
	leer(c);
	while c.fechaC.ano <> 2020 do;
		leer(c);
		if c.fechaC.mes = 'enero' then;
			cont3:= cont3 + 1;
		if c.fechaC.mes = 'febrero' then;
			cont3:= cont3 + 1;
		if c.fechaC.mes = 'marzo' then;
			cont3:= cont3 + 1;
		if c.fechaC.dia <= 10 then;
			cont10:= cont10 + 1;
end.

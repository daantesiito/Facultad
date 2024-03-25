program ej3practica3;

type

	finall = record
		codigo: integer;
		nota: integer;
	end;

	listafinales = ^nodo;
	nodo = record
		dato: finall;
		sig: listafinales;
	end;

	alumno = record
		legajo: integer;
		DNI: integer;
		anoingreso: integer;
		finales: listafinales;
	end;
	
	arbol = ^nodoarbol;
	nodoarbol = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;
	
	dniano = record
		DNI: integer;
		ano: integer;
	end;
	
	listalegajosinf = ^nodo2;
	nodo2 = record
		dato: dniano;
		sig: listalegajosinf;
	end;
	
procedure agregarfinal (var l: listafinales; f: finall);
var
	nuevo: listafinales;
begin
	new(nuevo);
	nuevo^.dato:= f;
	nuevo^.sig:= l;
	l:= nuevo;
end;
	
procedure leeralumno (var alu: alumno);
var
	f: finall;
begin
	writeln('ingrese el numero de legajo');
	readln(alu.legajo);
	if alu.legajo <> 0 then begin
		writeln('ingrese el DNI');
		readln(alu.DNI);
		writeln('ingrese el año de ingreso');
		readln(alu.anoingreso);
		writeln('ingrese el codigo de materia');
		readln(f.codigo);
		while f.codigo <> -1 do begin
			writeln('ingrese la nota de la materia');
			readln(f.nota);
			agregarfinal(alu.finales,f);
			writeln('ingrese el codigo de materia');
			readln(f.codigo);
		end;
	end;
end;

procedure agregaralumno (var a: arbol; alu: alumno);
begin
	if a = nil then begin
		new(a);
		a^.dato:= alu;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if (alu.legajo <= a^.dato.legajo) then 
		agregaralumno(a^.HI,alu)
	else 
		agregaralumno(a^.HD,alu);
end;

procedure agregardniano (var l: listalegajosinf; da: dniano);
var
	nuevo: listalegajosinf;
begin
	new(nuevo);
	nuevo^.dato:= da;
	nuevo^.sig:= l;
	l:= nuevo;
end;

procedure buscarinferior (a: arbol; valor: integer; var lf: listalegajosinf);
var
	da: dniano;
begin
	if a <> nil then begin
		if valor < a^.dato.legajo then
			buscarinferior(a^.hi,valor,lf)
		else begin
			if a^.dato.legajo <> valor then begin
				da.DNI:= a^.dato.DNI;
				da.ano:= a^.dato.anoingreso;
				writeln(da.DNI);
				writeln(da.ano);
				agregardniano(lf,da);
			end;
			buscarinferior(a^.hi,valor,lf);
			buscarinferior(a^.hd,valor,lf);
		end;
	end;
end;

procedure buscarlegajogrande (a: arbol; var max: integer);
begin
	if a <> nil then begin
		if a^.HD = nil then
			max:= a^.dato.legajo;
		buscarlegajogrande(a^.HD,max);
	end;
end;

procedure buscardnigrande (a: arbol; var max: integer);
begin
	if a <> nil then begin
		if a^.dato.DNI > max then
			max:= a^.dato.DNI;
		buscardnigrande(a^.HI,max);
		buscardnigrande(a^.HD,max);
	end;
end;

procedure buscarlegajosimpar (a: arbol; var cant: integer);
begin
	if a <> nil then begin
		if (a^.dato.legajo MOD 2) = 1 then
			cant:= cant + 1;
		buscarlegajosimpar(a^.HI,cant);
		buscarlegajosimpar(a^.HD,cant);
	end;
end;

function sacarpromedio (infofinales: listafinales) : integer;
var
	materias: integer;
	totalnotas: integer;
begin
	materias:= 0;
	totalnotas:= 0;
	while infofinales <> nil do begin
		materias:= materias + 1;
		totalnotas:= totalnotas + infofinales^.dato.nota;
		infofinales:= infofinales^.sig;
	end;
	sacarpromedio:= (totalnotas DIV materias);
end;

procedure buscarpromediomayor (a: arbol; var promediomayor: integer; var legajo: integer);
var
	promedioalumno: integer;
begin
	if a <> nil then begin
		promedioalumno:= sacarpromedio(a^.dato.finales);
		if promedioalumno > promediomayor then begin
			promediomayor:= promedioalumno;
			legajo:= a^.dato.legajo;
		end;
		buscarpromediomayor(a^.HI,promediomayor,legajo);
		buscarpromediomayor(a^.HD,promediomayor,legajo);
	end;
end;

procedure buscarmayoresavalor (a: arbol; valor: integer);
var
	promedioalumno: integer;
begin
	if a <> nil then begin
		promedioalumno:= sacarpromedio(a^.dato.finales);
		if promedioalumno > valor then
			writeln('El alumno con legajo:' , a^.dato.legajo, 'tiene un promedio de:' , promedioalumno, 'que es mayor al valor ingresado');
		buscarmayoresavalor(a^.HI,valor);
		buscarmayoresavalor(a^.HD,valor);
	end;
end;

var
	alu: alumno;
	a: arbol;
	valor: integer;
	lf: listalegajosinf;
	max: integer;
	cant: integer;
	legajopm: integer;
	promedio: integer;
BEGIN
	leeralumno(alu);
	while alu.legajo <> 0 do begin
		agregaralumno(a,alu);
		leeralumno(alu);
	end;
	lf:= nil;
	writeln('escribir un valor');
	readln(valor);
	buscarinferior(a, valor, lf);
	max:= 0;
	buscarlegajogrande(a,max);
	writeln('El legajo mas grande es:' ,max);
	max:= 0;
	buscardnigrande(a,max);
	writeln('El DNI mas grande es:' ,max);
	cant:= 0;
	buscarlegajosimpar(a,cant);
	writeln('La cantidad de legajos impares es de:' ,cant);
	promedio:= 0;
	buscarpromediomayor(a,promedio,legajopm);
	writeln('El legajo del alumno con mayor promedio es:' , legajopm, 'y su promedio fue de:' ,promedio);
	writeln('Ingrese un valor');
	read(valor);
	buscarmayoresavalor(a,valor);
END.
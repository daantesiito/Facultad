program p3prac3;
type
	finales = record
		codigo: integer;
		nota: integer;
	end;
	
	listafinales = ^nodo;
	nodo = record
		dato: finales;
		sig: listafinales;
	end;
	
	alumno = record
		legajo: integer;
		DNI: integer;
		ano: integer;
		finaless: listafinales;
	end;
	
	arbol = ^nodo2;
	nodo2 = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;

procedure agregaradelante(var l: listafinales; f: finales);
var
    aux: listafinales;
begin
    new(aux);
    aux^.dato:= f;
    aux^.sig:= l;
    l:= aux;
end;


procedure leeralumno(var a: alumno; var l: listafinales; var f: finales);
begin
	writeln('Ingrese su numero de legajo: ');
	readln(a.legajo);
	if a.legajo <> 0 then begin
		writeln('Ingrese su DNI: ');
		readln(a.DNI);
		writeln('Ingrese el ano de ingreso: ');
		readln(a.ano);
		writeln('Ingrese el codigo de la materia: ');
		readln(f.codigo);
		while (f.codigo <> -1) do begin
			writeln('Ingrese la nota de la materia: ');
			readln(f.nota);
			agregaradelante(a.finaless,f);
			writeln('Ingrese el codigo de la materia: ');
			readln(f.codigo);
		end;
	end;
end;

procedure cargarArbol(var a: arbol; al: alumno);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= al;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (al.legajo < a^.dato.legajo) then 
			cargarArbol(a^.HI, al)
		else
			cargarArbol(a^.HD, al);
end;


procedure ArmarArbol(var a: arbol; l: listafinales);
var
	al: alumno;
	f: finales;
begin
	leeralumno(al,l,f);
	while (al.legajo <> 0) do begin
		cargarArbol(a,al);
		leeralumno(al,l,f);
	end;
end;

procedure informarDNIyAno(a: arbol; leg: integer);
begin
	if (a <> nil) then begin
		if (a^.dato.legajo < leg) then begin
			writeln('DNI: ', a^.dato.DNI, ' y ano de ingreso: ', a^.dato.ano);
			informarDNIyAno(a^.HI,leg);
			informarDNIyAno(a^.HD,leg);
		end
		else
			informarDNIyAno(a^.HI,leg);
	end;
	
end;

procedure informarLegMayor(a: arbol; var legmayor: integer);
begin
	if (a <> nil) then begin
		if (legmayor < a^.dato.legajo) then
			legmayor:= a^.dato.legajo;
		informarLegMayor(a^.HD, legmayor);
		
	end;
end;

procedure informarDNIMayor(a: arbol; var DNImayor: integer);
begin
	if (a <> nil) then begin
		if (DNImayor < a^.dato.DNI) then
			DNImayor:= a^.dato.DNI;
		informarDNIMayor(a^.HD, DNImayor);
		
	end;
end;

function esImpar(legajo: integer): boolean;
var
	dig: integer;
begin
	esImpar:= False;
	dig:= legajo MOD 10;
	if ((dig MOD 2) = 1) then 
		esImpar:= True;
end;

procedure informarAlumLegImpar(a: arbol; var cantLegajosImpar: integer);
begin
	if (a <> nil) then begin
		informarAlumLegImpar(a^.HI, cantLegajosImpar);
		if (esImpar(a^.dato.legajo) = True) then
			cantLegajosImpar:= cantLegajosImpar + 1;
		informarAlumLegImpar(a^.HD, cantLegajosImpar);	
	end;
end;

function sacarpromedio(l: listafinales): real;
var
	materias, notas: integer;
begin
	materias:= 0;
	notas:= 0;
	while l <> nil do begin
		materias:= materias + 1;
		notas:= notas + l^.dato.nota;
		l:= l^.sig;
	end;
	sacarpromedio:= notas / materias;
end;

procedure legajomayorpromedio(a: arbol; var legmayprom: integer; var mayorprom: real);
var
	sacarpromediomayor: real;
begin
	if a <> nil then begin
		sacarpromediomayor:= sacarpromedio(a^.dato.finaless);
		if (sacarpromediomayor > mayorprom) then begin
			mayorprom:= sacarpromediomayor;
			legmayprom:= a^.dato.legajo;
		end;
		legajomayorpromedio(a^.HI,legmayprom,mayorprom);
		legajomayorpromedio(a^.HD,legmayprom,mayorprom);
	end;
end;

var
	l: listafinales;
	a: arbol;
	leg,legmayor,DNImayor,cantLegajosImpar,legmayprom: integer;
	mayorprom: real;
BEGIN
	l:= nil;
	ArmarArbol(a,l);
	{writeln('Ingrese un legajo de parametro: ');
	readln(leg);
	informarDNIyAno(a,leg);
	legmayor:= 0;
	informarLegMayor(a,legmayor);
	writeln('El legajo mayor es: ', legmayor);
	DNImayor:= 0;
	informarDNIMayor(a,legmayor);
	writeln('El DNI mayor es: ', DNImayor);
	cantLegajosImpar:= 0;
	informarAlumLegImpar(a,cantLegajosImpar);
	writeln('La cantidad de alumnos con legajo impar es de: ', cantLegajosImpar);}
	legmayprom:= 0;
	mayorprom:= 0;
	legajomayorpromedio(a,legmayprom,mayorprom);
	writeln('El alumno con mayor legajo es: ', legmayprom, ' con un promedio de: ', mayorprom);
	
END.


program ej1practica3;

type

	socio = record
		numero: integer;
		nombre: string;
		edad: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: socio;
		HI: arbol;
		HD: arbol;
	end;

procedure leersocio (var s: socio);
begin
	writeln('ingrese el numero del socio');
	readln(s.numero);
	if s.numero <> 0 then begin
		writeln('ingrese el nombre del socio');
		readln(s.nombre);
		writeln('ingrese la edad del socio');
		readln(s.edad);
	end;
end;

procedure agregar (var a: arbol; s: socio);
begin
	if a = nil then begin
		new(a);
		a^.dato:= s;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if s.numero <= a^.dato.numero then agregar(a^.HI,s)
		else agregar(a^.HD,s);
end;

procedure buscarnumgrande (a: arbol; var max: integer);
begin
	if a <> nil then begin
		buscarnumgrande(a^.HD,max);
		if a^.dato.numero > max then
			max:= a^.dato.numero;
	end;
end;

procedure buscarsocionummenor (a: arbol; var s: socio; var min: integer);
begin
	if a <> nil then begin
		buscarsocionummenor(a^.HI,s,min);
			if a^.dato.numero < min then begin
				min:= a^.dato.numero;
				s:= a^.dato;
			end;
	end;
end;
		
procedure buscaredadmayor (a: arbol; var max: integer; var numsocio: integer);
begin
	if a <> nil then begin
		buscaredadmayor(a^.HI,max,numsocio);
		if a^.dato.edad > max then begin
			max:= a^.dato.edad;
			numsocio:= a^.dato.numero;
		end;
		buscaredadmayor(a^.HD,max,numsocio);
	end;
end;

Procedure sumar1edad (a:arbol);
begin
   if ( a <> nil ) then 
     begin
		sumar1edad(a^.HI);
		a^.dato.edad:= a^.dato.edad + 1;
		writeln('socio+1: ', a^.dato.edad);
		sumar1edad(a^.HD);
   end;
end;


function buscarvalorsocio2(a: arbol; num: integer): boolean;
begin
  if (a = nil) then buscarvalorsocio2:= false
  else if (a^.dato.numero = num) then buscarvalorsocio2:= true
  
  else if num < a^.dato.numero then  buscarvalorsocio2:= buscarvalorsocio2(a^.HI, num)
  else buscarvalorsocio2:= buscarvalorsocio2(a^.HD, num);
end;

function buscarnombre (a: arbol; nombre: string) : boolean;
begin
	if (a <> nil) then begin
		if (a^.dato.nombre = nombre) then 
			buscarnombre:= True
		else begin
			buscarnombre:= False;
			buscarnombre(a^.HI,nombre);
			buscarnombre(a^.HD,nombre);
		end;
		
	end;
end;

procedure informarcantsocios(a: arbol; var cantsocios: integer);
begin
	if (a <> nil) then begin
		informarcantsocios(a^.HI, cantsocios);
		cantsocios:= cantsocios + 1;
		informarcantsocios(a^.HD, cantsocios);
	end;
end;

procedure sumaredades(a: arbol; var edadestotal: real);
begin
	if (a <> nil) then begin
		sumaredades(a^.HI, edadestotal);
		edadestotal:= edadestotal + a^.dato.edad;
		sumaredades(a^.HD, edadestotal);
	end;
end;

procedure informarsocioscreciente(a: arbol);
begin
	if (a <> nil) then begin
		informarsocioscreciente(a^.HI);
		writeln('Socio num: ', a^.dato.numero);
		informarsocioscreciente(a^.HD);
	end;
end;

function espar(num: integer): boolean;
var
	dig: integer;
begin
	espar:= False;
	dig:= num MOD 10;
	if ((dig MOD 2) = 0) then
		espar:= True;
end;

procedure informarsociosdecrecienteypar(a: arbol);
begin
	if (a <> nil) then begin
		informarsociosdecrecienteypar(a^.HD);
		if espar(a^.dato.numero) = True then
			writeln('Socio num: ', a^.dato.numero);
		informarsociosdecrecienteypar(a^.HI);
	end;
end;

var
	s: socio;
	a: arbol;
	max: integer;
	min: integer;
	numsociomenoredad: integer;
	num: integer;
	nombre: string;
	cantsocios: integer;
	edadestotal: real;
	promedad: real;
BEGIN
	leersocio(s);
	while s.numero <> 0 do begin
		agregar(a,s);
		leersocio(s);
	end;
	max:= 0;
	buscarnumgrande(a,max);
	writeln('el numero de socio mas grande es:' ,max);
	min:= 9999;
	buscarsocionummenor(a,s,min);
	writeln('los datos del socio con menor numero de socio son:' ,s.numero, s.nombre, s.edad);
	max:= 0;
	buscaredadmayor(a,max,numsociomenoredad);
	writeln('el numero de socio del socio con mayor edad es:' ,numsociomenoredad);
	sumar1edad(a);
	writeln('Num a buscar: ');
	readln(num);
	if buscarvalorsocio2(a, num) = True then
			writeln('Se encontro el valor')
		else
			writeln('No se encontro el valor');
	writeln('Ingrese nombre a buscar');
	readln(nombre);
	if buscarnombre(a, nombre) = True then
		writeln('Se encontro el nombre')
	else
		writeln('No se encontro el nombre');
	cantsocios:= 0;
	informarcantsocios(a,cantsocios);
	writeln('La cantidad total de socios es: ', cantsocios);
	edadestotal:= 0;
	sumaredades(a, edadestotal);
	promedad:= edadestotal / cantsocios;
	writeln('La edad promedio es: ', promedad:1:2);
	informarsocioscreciente(a);
	informarsociosdecrecienteypar(a);
END.

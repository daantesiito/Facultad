program p2prac4;
type
	prestamo = record
		ISBN: integer;
		numsocio: integer;
		dia: integer;
		mes: integer;
		cantdias: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: prestamo;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodo3;
	nodo3 = record
		dato: prestamo;
		sig: lista;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato: lista;
		HI: arbol2;
		HD: arbol2;
	end;
	
	ISBNprestados = record
		ISBN: integer;
		cantPrestados: integer;
	end;
	
	arbol3 = ^nodo4;
	nodo4 = record
		dato: ISBNprestados;
		HI: arbol3;
		HD: arbol3;
	end;
	
	arbol4 = ^nodo5;
	nodo5 = record
		dato: ISBNprestados;
		HI: arbol4;
		HD: arbol4;
	end;

procedure leerprestamos(var p: prestamo);
begin
	writeln('Ingrese el ISBN del libro: ');
	readln(p.ISBN);
	if (p.isbn <> -1) then begin
		writeln('Ingrese el numero de socio: ');
		readln(p.numsocio);
		writeln('Ingrese el dia: ');
		readln(p.dia);
		writeln('Ingrese el mes: ');
		readln(p.mes);
		writeln('Ingrese la cantidad de dias de prestamo: ');
		readln(p.cantdias);
	end;
end;

procedure cargarArbol(var a: arbol; p: prestamo);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if (p.ISBN < a^.dato.ISBN) then
			cargarArbol(a^.HI,p)
		else
			cargarArbol(a^.HD,p);
end;

procedure agregaradelante(var l: lista; p: prestamo);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= p;
	aux^.sig:= l;
	l:= aux;
end;

procedure cargarArboldeListas(var a: arbol2; p: prestamo);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= nil;
		agregaradelante(a^.dato,p);
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (p.ISBN <= a^.dato^.dato.ISBN) then
			cargarArboldeListas(a^.HI,p)
		else
			cargarArboldeListas(a^.HD,p);
end;

procedure cargarArbolISBNprestados(var a: arbol3; ISBN: integer);
begin
	if (a = nil) or (ISBN = a^.dato.ISBN) then begin
		if a = nil then begin
			new(a);
			a^.dato.ISBN:= ISBN;
			a^.dato.cantPrestados:= 1;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			a^.dato.cantPrestados:= a^.dato.cantPrestados + 1;
	end
	else
		if (ISBN <= a^.dato.ISBN) then
			cargarArbolISBNprestados(a^.HI, ISBN)
		else	
			cargarArbolISBNprestados(a^.HD, ISBN);
end;

procedure cargarArbolISBNprestadosv2(var a: arbol4; ISBN: integer);
begin
	if (a = nil) or (ISBN = a^.dato.ISBN) then begin
		if a = nil then begin
			new(a);
			a^.dato.ISBN:= ISBN;
			a^.dato.cantPrestados:= 1;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			a^.dato.cantPrestados:= a^.dato.cantPrestados + 1;
	end
	else
		if (ISBN <= a^.dato.ISBN) then
			cargarArbolISBNprestadosv2(a^.HI, ISBN)
		else	
			cargarArbolISBNprestadosv2(a^.HD, ISBN);
end;

procedure recorrerArbol3(var a3: arbol3; a: arbol);
begin
	if a <> nil then begin
		recorrerArbol3(a3,a^.HI);
		cargarArbolISBNprestados(a3, a^.dato.ISBN);
		recorrerArbol3(a3,a^.HD);
	end;
end;

procedure recorrerArbol4(var a4: arbol4; a2: arbol2);
var
	aux: lista;
begin
	if (a2 <> nil) then begin
		recorrerArbol4(a4,a2^.HI);
		aux:= a2^.dato;
		while (aux <> nil) do begin
			cargarArbolISBNprestadosv2(a4, aux^.dato.ISBN);
			aux:= aux^.sig;
		end;
		recorrerArbol4(a4,a2^.HD);
	end;
end;

procedure armarArbol(var a: arbol; l: lista; var a2: arbol2);
var
	p: prestamo;
begin
	leerprestamos(p);
	while (p.ISBN <> -1) do begin
		cargarArboldeListas(a2,p);
		cargarArbol(a,p);
		leerprestamos(p);
	end;
end;

procedure ISBNmayor(a: arbol; var ISBNmasgrande: integer);
begin
	if a <> nil then begin
		if a^.dato.ISBN > ISBNmasgrande then
			ISBNmasgrande:= a^.dato.ISBN;
		ISBNmayor(a^.HD,ISBNmasgrande);
	end;
end;

procedure ISBNmenor(a: arbol; var ISBNmaschico: integer);
begin
	if a <> nil then begin
		ISBNmayor(a^.HI,ISBNmaschico);
		if a^.dato.ISBN < ISBNmaschico then
			ISBNmaschico:= a^.dato.ISBN;
	end;
end;

procedure prestamosSocios(a: arbol; numesocio: integer; var cantprestamos: integer);
begin
	if (a <> nil) then begin
		prestamosSocios(a^.HI,numesocio,cantprestamos);
		if (a^.dato.numsocio = numesocio) then
			cantprestamos:= cantprestamos + 1;
		prestamosSocios(a^.HD,numesocio,cantprestamos);
	end;
end;

procedure prestamosSocios(a: arbol2; numesocio: integer; var cantprestamos: integer);
begin
	if (a <> nil) then begin
		prestamosSocios(a^.HI,numesocio,cantprestamos);
		if (a^.dato^.dato.numsocio = numesocio) then
			cantprestamos:= cantprestamos + 1;
		prestamosSocios(a^.HD,numesocio,cantprestamos);
	end;
end;

procedure informararbol3(a: arbol3);
begin
	if (a <> nil) then begin
		informararbol3(a^.HI);
		writeln('ISBN: ', a^.dato.ISBN, ' y cantidad prestadas: ', a^.dato.cantPrestados);
		informararbol3(a^.HD);
	end;
end;

procedure informararbol4(a: arbol4);
begin
	if (a <> nil) then begin
		informararbol4(a^.HI);
		writeln('ISBN: ', a^.dato.ISBN, ' y cantidad prestadas: ', a^.dato.cantPrestados);
		informararbol4(a^.HD);
	end;
end;

procedure prestamosEntre2Valores(a: arbol; num1,num2: integer; var sumaPrestamos: integer);
begin
	if (a <> nil) then begin
		if (a^.dato.ISBN > num1) then begin
			if (a^.dato.ISBN < num2) then begin
				sumaPrestamos:= sumaPrestamos + 1;
				prestamosEntre2Valores(a^.HI,num1,num2,sumaPrestamos);
				prestamosEntre2Valores(a^.HD,num1,num2,sumaPrestamos);
			end
			else
				prestamosEntre2Valores(a^.HI,num1,num2,sumaPrestamos);
		end
		else
			prestamosEntre2Valores(a^.HD,num1,num2,sumaPrestamos);
	end;
end;

procedure prestamosEntre2Valoresv2(a: arbol2; num1,num2: integer; var sumaPrestamos: integer);
var
	aux: lista;
begin
	if (a <> nil) then begin
		aux:= a^.dato;
		if (a^.dato^.dato.ISBN > num1) then begin
			if (a^.dato^.dato.ISBN < num2) then begin
				sumaPrestamos:= sumaPrestamos + 1;
				aux:= aux^.sig;
				prestamosEntre2Valoresv2(a^.HI,num1,num2,sumaPrestamos);
				prestamosEntre2Valoresv2(a^.HD,num1,num2,sumaPrestamos);
			end
			else
				prestamosEntre2Valoresv2(a^.HI,num1,num2,sumaPrestamos);
		end
		else
			prestamosEntre2Valoresv2(a^.HD,num1,num2,sumaPrestamos);
	end;
end;

var
	a: arbol;
	a2: arbol2;
	l: lista;
	ISBNmasgrande,ISBNmaschico,cantprestamos,numesocio,num1,num2,sumaPrestamos: integer;
	a3: arbol3;
	a4: arbol4;
BEGIN
	a:= nil;
	l:= nil;
	a2:= nil;
	a3:= nil;
	armarArbol(a,l,a2);
	ISBNmasgrande:= 0;
	ISBNmayor(a,ISBNmasgrande);
	writeln('El ISBN mas grande es: ', ISBNmasgrande);
	
	ISBNmaschico:= 0;
	ISBNmenor(a,ISBNmaschico);
	writeln('El ISBN mas chico es: ', ISBNmaschico);
	
	cantprestamos:= 0;
	writeln('Ingrese un numero de socio: ');
	readln(numesocio);
	prestamosSocios(a,numesocio,cantprestamos);
	writeln('El socio ', numesocio, ' tiene ', cantprestamos, ' prestamos');
	
	cantprestamos:= 0;
	writeln('Ingrese un numero de socio para el arbol 2: ');
	readln(numesocio);
	prestamosSocios(a2,numesocio,cantprestamos);
	writeln('El socio ', numesocio, ' tiene ', cantprestamos, ' prestamos');
	
	recorrerArbol3(a3,a);
	informararbol3(a3);
	writeln('------------------------------');
	recorrerArbol4(a4,a2);
	informararbol4(a4);
	
	writeln('Ingrese un numero: ');
	readln(num1);
	writeln('Ingrese otro numero: ');
	readln(num2);
	sumaPrestamos:= 0;
	prestamosEntre2Valores(a,num1,num2,sumaPrestamos);
	writeln('La cantidad de prestamos entre los ISBN ', num1, ' y ', num2, ' es de: ', sumaPrestamos);
	
	writeln('Ingrese un numero para el arbol 2: ');
	readln(num1);
	writeln('Ingrese otro numero para el arbol 2: ');
	readln(num2);
	sumaPrestamos:= 0;
	prestamosEntre2Valoresv2(a2,num1,num2,sumaPrestamos);
	writeln('La cantidad de prestamos entre los ISBN ', num1, ' y ', num2, ' es de: ', sumaPrestamos);
END.










































	
{
procedure armarArbol(var a: arbol; var a2: arbol2);
var
	p: prestamo;
	p2: prestamosISBN;
begin
	leerprestamos(p);
	p2.codISBN:= 0;
	p2.numPrestados:= 0;
	while (p.ISBN <> -1) do begin
		cargarArbol(a,p);
		cargarArbolPrestamosISBN(a2,p2);
		leerprestamos(p);
	end;
end;

function buscarNodo(a:arbol2; x:integer): arbol2; 
begin
	if (a = nil) then 
		buscarNodo:= nil
	else
		if (a^.dato.codISBN = x) then
			buscarNodo:= a
		else
			if (x > a^.dato.codISBN) then 
				buscarNodo:= buscarNodo(a^.HD, x)
			else
				buscarNodo:= buscarNodo(a^.HI, x);
End;

procedure cargarArbolPrestamosISBN(var a: arbol2; p: prestamosISBN);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if buscarNodo(a2,p.codISBN) then
			a^.dato.numprestados:= a^.dato.numprestados + 1;
			
		if (p.codISBN < a^.dato.codISBN) then
			cargarArbolPrestamosISBN(a^.HI,p)
		else
			cargarArbolPrestamosISBN(a^.HD,p);
end;
}

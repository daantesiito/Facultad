program parcial;
const
	max = 12;
type
	rango = 1..max;

	ingreso = 4..10;
	distintosTurnos = 1..4;

	vector = array [rango] of integer;

	alumnos = record
		dni: integer;
		nombre: string;
		nota: ingreso;
		turno: distintosTurnos;
		asistencias: vector;
	end;

	lista = ^nodo;

	nodo = record
		dato: alumnos;
		sig: lista;
	end;

	vectorTurno = array [1..4] of integer;

//----------------------------------------------------------------
	
procedure leerAlumnos (var a: alumnos); //SE DISPONE


//----------------------------------------------------------------

procedure agregar (var l: lista; a: alumnos); //SE DISPONE

//----------------------------------------------------------------

procedure generarLista (var l: lista);  //SE DISPONE

//----------------------------------------------------------------





//----------------------------------------------------------------



//----------------------------------------------------------------

procedure contarAsistencias (v: vector) : integer;
var
	i, cant: rango;
begin
	cant:= 0;
	for i:= 1 to max do begin
		if (v[i] = 1) then
			cant:= cant + 1;
	end;
	contarAsistencias:= cant;
end;

//----------------------------------------------------------------

procedure recorrerLista (l: lista; var l2: lista);
begin
	while (l<> nil) do begin
		if (contarAsistencias(l^.dato.asistencias) >= 8) then
			agregar(l2, l^.dato);

		l:= l^.sig;
	end;	
end;

//----------------------------------------------------------------

procedure recorrerLista (l2: lista, var vecT: vectorTurno);
begin
	while (l2 <> nil) do begin
		if (l2^.dato.nota >= 8) then
			writeln('Nombre: ',l2^.dato.nombre, ' . DNI: ',l2^.dato.dni)

		
		vecT[l2^.dato.turno]:= vecT[l2^.dato.turno] + 1;

		l2:= l2^.sig;
	end;	
end;

//----------------------------------------------------------------

var
	l, listaNueva: lista;
	v: vector;
	vecCont: vecCantidad;
	dni: integer;
	i: integer;
BEGIN
	l:= nil;

	generarLista (l);

	cargarVector (v); // SE DISPONE

	recorrerLista (l, l2);

	writeln('El dni del cliente que menos ha gastado es: ',dni)
	
	for i:= 1 to max do
		writeln('De la categoria: ',i,' se hicieron: ' ,vCant[i], ' compras');

END.
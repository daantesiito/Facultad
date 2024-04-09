{
Se dispone de la informacion de los participantes inscriptos a una carrera (a lo sumo 5000).
De cada participante se lee DNI, nombre y apellido, categoria (1..5) y fecha de inscripcion.
Se pide implementar un programa que guarde en una estructura de datos adecuada los participantes de aquellas categorias que posean a lo sumo 50 inscriptos.
Se sabe que cada participante se puede anotar en una sola categoria.   
}

program final;
type
	categorias = 1..5;
	
	participante = record
		DNI: integer;
		nya: string;
		cat: categorias;
		inscripcion: string;
	end;

	vectorInscriptos = array [1..5000] of participante;
	
	lista = ^nodo;
	nodo = record
		dato: participante;
		sig: lista;
	end;
	
	vectorCategorias = array [categorias] of integer;
	
// se dispone: procedure leerParticipante(var p: participante);

// se dispone: procedure cargarVector(var v: vectorInscriptos; var dimL: integer)

procedure inicializarVector(var v: vectorCategorias);
var
	i: integer;
begin
	for i:= 1 to 5 do begin
		v[i]:= 0;
	end;
end;

procedure llenarVectorCategorias(var v: vectorCategorias; vi: vectorInscriptos; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		v[vi[i].cat]:= v[vi[i].cat] + 1;
	end;
end;

procedure agregarOrdenado(var l: lista; p: participante);
var
	aux,act,ant: lista;
begin
	new(aux);
	aux^.dato:= p;
	act:= l;
	ant:= l;
	while (act <> nil) and (p.DNI > act^.dato.DNI) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= aux
	else
		ant^.sig:= aux;
	aux^.sig:= act;
end;

procedure llenarLista(var l: lista; vi: vectorInscriptos; v: vectorCategorias; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		if (v[vi[i].cat] >= 50) then begin
			agregarOrdenado(l,vi[i]);
		end;
	end;
end;

var
	v: vectorCategorias;
	vi: vectorInscriptos;
	dimL: integer;
	l: lista;
begin
	dimL:= 300;
	// se dispone: cargarVector(v,dimL);
	llenarVectorCategorias(v,vi,dimL);
	llenarLista(l,vi,v,dimL);
end.
















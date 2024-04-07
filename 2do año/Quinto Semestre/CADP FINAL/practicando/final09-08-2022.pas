program final;
type
	categorias = 1..5;
	
	participante = record
		DNI: integer;
		nomyApe: string;
		categoria: categorias;
		fecha: string;
	end;
	
	listaParticipantes = ^nodo;
	nodo = record
		dato: participante;
		sig: listaParticipantes;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		dato: participante;
		sig: lista2;
	end;
	
	vectorContador = array [categorias] of integer;

procedure inicializarVector(var v: vectorContador);
var
	i: integer;
begin
	for i:= 1 to 5 do begin
		v[i]:= 0;
	end;
end;

procedure agregarAdelante(var l: lista2; p: participante);
var
	aux: lista2;
begin
	new(aux);
	aux^.dato:= p;
	aux^.sig:= l;
	l:= l^.sig;
end;

procedure llenarLista2(l: listaParticipantes; var l2: lista2; v: vectorContador; var p: participante);
begin
	while (l <> nil) do begin
		if (v[l^.dato.categoria] < 50) then begin
			p.DNI:= l^.dato.DNI;
			p.nomyApe:= l^.dato.nomyApe;
			p.categoria:= l^.dato.categoria;
			p.fecha:= l^.dato.fecha;
			agregarAdelante(l2,p);
			v[l^.dato.categoria]:= v[l^.dato.categoria] + 1;
		end;
		l:= l^.sig;
	end;
end;

VAR
	l2: lista2;
	l: listaParticipantes;
	v: vectorContador;
	p: participante;

BEGIN
	l:= nil;
	l2:= nil;
	inicializarVector(v);
	llenarLista2(l,l2,v,p);
END.

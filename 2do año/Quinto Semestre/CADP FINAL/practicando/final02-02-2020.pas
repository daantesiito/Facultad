program final;
type
	tipos = 1..12;
	
	publicacion = record
		titulo: string;
		nombreAutor: string;
		DNIAutor: integer;
		tipo: tipos;
	end;
	
	listaPublicaciones = ^nodo;
	nodo = record
		dato: publicacion;
		sig: listaPublicaciones;
	end;
	
	vectorContador = array [tipos] of integer;
	
procedure LeerPublicaciones(var p: publicacion);
begin
	readln(p.DNIAutor);
	if p.DNIAutor <> 0 then begin
		readln(p.titulo);
		readln(p.nombreAutor);
		readln(p.tipo);
	end;
end;

procedure InsertarOrdenado(var l: listaPublicaciones; p: publicacion);
var
	aux,ant,act: listaPublicaciones;
begin
	new(aux);
	aux^.dato:= p;
	ant:= l;
	act:= l;
	while (act <> nil) and (p.DNIAutor > l^.dato.DNIAutor) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if act = ant then
		l:= aux
	else
		ant^.sig:= aux;
	aux^.sig:= act;
end;

procedure llenarLista(var l: listaPublicaciones; var p: publicacion);
begin
	LeerPublicaciones(p);
	while p.DNIAutor <> 0 do begin
		InsertarOrdenado(l,p);
		LeerPublicaciones(p);
	end;
end;

procedure inicializarVector(var v: vectorContador);
var
	i: integer;
begin
	for i:= 1 to 12 do begin
		v[i]:= 0;
	end;
end;

procedure IncisoA(var v: vectorContador; l: listaPublicaciones);
begin
	while (l <> nil) do begin
		v[l^.dato.tipo]:= v[l^.dato.tipo] + 1;
		l:= l^.sig;
	end;
end;

procedure IncisoB(l: listaPublicaciones);
var
	cantPublicaciones: integer;
	DNIActual: integer;
begin
	while (l <> nil) do begin
		cantPublicaciones:= 0;
		DNIActual:= l^.dato.DNIAutor;
		while (l^.dato.DNIAutor = DNIActual) do begin
			cantPublicaciones:= cantPublicaciones + 1;
			l:= l^.sig;
		end;
		writeln('La cantidad de publicaciones que hizo: ', DNIActual, ' es de: ', cantPublicaciones);
	end;
end;

var
	l: listaPublicaciones;
	p: publicacion;
	v: vectorContador;
	i: integer;

begin
	llenarLista(l,p);
	inicializarVector(v);
	IncisoA(v,l);
	for i:= 1 to 12 do begin
		writeln('El tipo: ', i, ' tiene: ', v[i], ' publicaciones.');
	end;
	IncisoB(l);
end.



















	

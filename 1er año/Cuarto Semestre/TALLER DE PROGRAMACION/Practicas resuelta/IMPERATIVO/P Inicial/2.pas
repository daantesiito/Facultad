program ej2;
type
	propiedad = record;
		zona: 1..5;
		codigo: integer;
		tipo: string;
		metros: real;
		preciometro: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: propiedad;
		sig: lista;
	end;
	
procedure LeerPropiedad(var p: propiedad);
begin
	readln(p.zona);
	readln(p.codigo);
	readln(p.tipo);
	readln(p.metros);
	readln(p.preciometro);
end;

procedure InsertarOrdenado(var l: lista; p: propiedad);
var
    aux, ant, act: lista;
begin
    new(aux);
    aux^.dato:= p;
    ant:= l;
    act:= l;
    while (act <> nil) and (p.zona > l^.dato.zona) do begin
        ant:= act;
        act:= act^.sig;;
    end;
    if act = ant then
        l:= aux;
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;

procedure CargarLista(var l: lista);
var
	p: propiedad;
begin
	LeerPropiedad(p);
	while (l <> nil) and (p.preciometro <> -1) do begin
		AgregarOrdenado(l);
		LeerPropiedad(p);
	end;
end;

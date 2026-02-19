program final;

const
    TEMA_MAX = 15;
type
    rangoTemas = 1..TEMA_MAX;

    prestamos = record
        codTema: rangoTemas;
        fecha: string;
        codLibro: integer;
    end;

    listaPrestamos = ^nodo;
    nodo = record
        dato: prestamos;
        sig: listaPrestamos;
    end;

    vectorCantPrestamos = array[rangoTemas] of integer;

procedure inicializarVector(var v: vectorCantPrestamos);
var
    i: integer;
begin
    for i:= 1 to TEMA_MAX do begin
        v[i]:= 0;
    end;
end;

procedure procesar(var v: vectorCantPrestamos; l: listaPrestamos);
begin
    while (l <> nil) do begin
        v[l^.dato.codTema]:= v[l^.dato.codTema] + 1;
        l:= l^.sig;
    end;
end;

function mayorTema(v: vectorCantPrestmos): integer;
var
    maxTema, i, maxCant: integer;
begin
    maxTema:= -1;
    maxCant:= -1;
    for i:= 1 to TEMA_MAX do begin
        if (maxCant < v[i]) then begin
            maxCant:= v[i];
            maxTema:= i;
        end;
    end;
    mayorTema = maxTema;
end;

var
    v: vectorCantPrestamos;
    l: listaPrestamos;
    i: integer;
begin
    l:= nil;
    cargarLista(l); // se dispone
    inicializarVector(v);
    procesar(v,l);
    writeln('Codigo de tema con mas cantidad de prestamos: ', mayorTema(v));
    for i:= 1 to TEMA_MAX do begin
        writeln('Tema ', i, '. Cantidad de prestamos: ', v[i]);
    end;
end.

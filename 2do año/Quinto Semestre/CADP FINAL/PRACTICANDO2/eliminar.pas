procedure eliminarLista (var L: lista);
var
    actual: lista;
    nuevo: lista;
begin
    actual:= L;
    while actual <> nil do begin
        nuevo:= actual;
        actual:= actual^.sig;
        dispose(nuevo);
    end;
    L:= nil;
end;


procedure eliminarLista(var l: lista);
var
    aux,act: lista;
begin
    act:= l;
    while act <> nil do begin
        aux:= act;
        act:= act^.sig;
        dispose(aux);
    end;
    l:= nil;
end;

procedure eliminarLista(var l: lista);
var
    aux,act: lista;
begin
    act:= l;
    while act <> nil do begin
        aux:= act;
        act:= act^.sig;
        dispose(aux);
    end;
    l:= nil;
end;

procedure eliminarLista(var l: lista);
var
    aux,act:= l;
begin
    act:= l;
    while act <> nil do begin
        aux:= act;
        act:= act^.sig;
        dispose(aux);
    end;
    l:= nil;
end;



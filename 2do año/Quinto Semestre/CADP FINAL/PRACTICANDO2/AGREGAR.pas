procedure agregarOrdenado(var l: lista; d: dato);
var
    aux,act,ant: lista;
begin
    new(aux);
    aux^.dato:= d;
    act:= l;
    ant:= l;
    while (act <> nil) and (d.datoBuscar < act^.dato.datoBuscar) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act = ant) then
        l:= aux;
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;

procedure agregarAtras(var l,ULT: lista; d: dato);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= d;
    aux^.sig:= nil;
    if l = nil then
        l:= aux;
    else
        ULT^.sig:= aux;
    ULT = aux;
end;

procedure agregarAdelante(var l: lista; d: dato);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= d;
    aux^.sig:= l;
    l:= aux;
end;
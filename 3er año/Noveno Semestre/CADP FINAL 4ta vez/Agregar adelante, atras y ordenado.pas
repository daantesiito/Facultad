procedure AgregarAdelante(var l: lista; c: compra);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= l;
    l:= aux;
end;

procedure AgregarAtras(var l, ULT: lista; c: compra);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= nil;
    if l = nil then
        l:= aux;
    else
        ULT^.sig:= aux;
    ULT:= aux;
end;

procedure InsertarOrdenado(var l: lista; c: compra);
var
    aux, ant, act: lista;
begin
    new(aux);
    aux^.dato:= c;
    ant:= l;
    act:= l;
    while (act <> nil) and (c.nombre > act^.dato.nombre) do begin
        ant:= act;
        act:= act^.sig;;
    end;
    if act = ant then
        l:= aux;
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;

------------------------PRACTICANDO--------------------------

procedure AgregarAdelante(var l: lista; c: compra);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= l;
    l:= aux;
end;    

procedure AgregarAdelante(var l: lista; c: compra);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= l;
    l:= aux;
end;

procedure AgregarAdelante(var l: lista; c: compra);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= l;
    l:= aux;
end;

procedure AgregarAtras(var l, ULT:lista; c: compra);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= nil;
    if l = nil then
        l:= aux;
    else
        ULT^.sig:= aux;
    ULT:= aux;
end;

procedure AgregarAdelante(var l: lista; c: compra);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= l;
    l:= aux;
end;

procedure agregarAdelante(var l: lista; c: compra);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= l;
    l:= aux;
end;
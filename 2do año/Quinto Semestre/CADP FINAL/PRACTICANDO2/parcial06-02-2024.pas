program parcial06022024;
type
    venta = record
        num: integer;
        cant: integer;
        tipo: string;
    end;

    lista = ^nodo;
    nodo = record
        dato: venta;
        sig: lista;
    end;

procedure leerVentas(var v: ventas);

procedure agregarAdelante(var l: lista; v: venta)

procedure cargarVentas(var l: lista);

procedure agregarOrdenado(var l: lista; v: venta);
var
    ant,act,aux: lista;
begin
    new(aux);
    aux^.dato:= v;
    act:= l;
    ant:= l;
    while (act <> nil) and (v.tipo < act^.dato.tipo) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act = ant) then
        ant^.sig:= aux;
    aux^.sig:= act;
end;

function masPares(num: integer): boolean;
var
    dig: integer;
begin
    masPares:= False;
    dig:= num mod 10;
    while (num <> 0) do begin
        if ((dig mod 2) = 0) then
            cantPares:= cantPares + 1;
        else
            cantImpares:= cantImpares + 1;
        num:= num div 10;
    end;
    if (cantPares > cantImpares) then
        masPares:= True;
end;

procedure armarNuevaLista(var l,l2: lista);
var
    v: venta;
begin
    while (l <> nil) do begin
        if masPares(l^.dato.cant) then
            agregarOrdenado(l2,l^.dato);
        l:= l^.sig;
    end;
end;

var
    l,l2: lista;
    v: venta;

begin
    cargarVentas(l);
    armarNuevaLista(l,l2);
end.
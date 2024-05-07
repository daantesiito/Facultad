program final;
type
    venta = record
        codigoV: integer;
        codigoP: integer;
        cantVendida: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: venta;
        sig: lista;
    end;

procedure leerVentas(var v: ventas);
begin
    with v:
        writeln('Ingrese el codigo de venta: ');
        readln(codigoV);
        writeln('Ingrese el codigo de producto: ');
        readln(codigoP);
        writeln('Ingrese la cantidad vendida: ');
        readln(cantVendida);
    end;
end;

procedure agregarOrdenado(var l: lista; v: venta);
begin
    new(aux);
    aux^.dato:= v;
    ant:= l;
    act:= l;
    while (act <> nil) and (v.codigoP < act^.dato.codigoP) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act = ant) then
        l:= aux;
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;

procedure cargarLista(var l: lista);
var
    v: venta;
begin
    leerVentas(v);
    while (v.codigoV <> 9999) do begin
        agregarOrdenado(l,v);
        leerVentas(v);
    end;
end;

procedure informar(v: ventas);
begin
    writeln('Codigo Venta: ', v.codigoV);
    writeln('Codigo Producto: ', v.codigoP);
    writeln('Cantidad vendida: ', v.cantVendida);
end;

procedure informarVentas(var l: lista);
var
    cod, cantTotal: integer;
begin
    writeln('Ingrese el codigo de producto a buscar: ');
    readln(cod);
    while (l <> nil) do begin
        if (l^.dato.codigoP = cod) then begin
            informar(l^.dato);
            cantTotal:= cantTotal + l^.dato.cantVendida;
        end;
        l:= l^.sig;
    end;
    writeln('Cantidad total vendida del codigo: ', cod, ' es de: ', cantTotal);
end;

var
    l: lista;
begin
    cargarLista(l);
    informarVentas(l);
end.

program untitled;
type
    venta=record
        codigo:integer;
        fecha:integer;
        cant:integer;
    end;

    arbol=^nodo;
    nodo=record
        data:venta;
        HI:arbol;
        HD:arbol;
    end;

procedure leerVenta(var d:venta);
begin
    writeln('inserte codigo: ');
    readln(d.codigo);
    if(d.codigo<>0)then begin
        writeln('inserte fecha: ');
        readln(d.fecha);
        writeln('inserte cantidad vendida: ');
        readln(d.cant);
    end;
    writeln('');
end;

procedure cargarArbol(var a:arbol;d:venta);
begin
    if(a = nil)then begin
        new(a);
        a^.data:=d;
        a^.HI:=nil;
        a^.HD:=nil;
    end
    else
        if(a^.data.codigo>d.codigo)then
            cargarArbol(a^.HI,d)
        else
            cargarArbol(a^.HD,d)
end;

procedure crearArbol(var a:arbol);
var
    d:venta;
begin
    leerVenta(d);
    while(d.codigo<>0)do begin
        cargarArbol(a,d);
        leerVenta(d);
    end;
end;

procedure cantVendido(a:arbol;x:integer;var cant:integer);
begin
    if(a<>nil)then begin
        cantVendido(a^.HI,x,cant);
        if(a^.data.codigo=x)then
            cant:=cant + a^.data.cant;
        cantVendido(a^.HD,x,cant);
    end;
end;

var
    a1:arbol;
    a2:arbol;
    x:integer;
    cant:integer;
BEGIN
    a1:=nil;
    a2:=nil;
    crearArbol(a1);
    crearArbol(a2);

    cant:=0;
    writeln('ingrese producto a buscar: ');
    readln(x);
    cantVendido(a1,x,cant);
    writeln('cantidad de unidades vendidas del producto indicado: ',cant);
    writeln('');

    cant:=0;
    writeln('ingrese producto a buscar: ');
    readln(x);
    cantVendido(a2,x,cant);
    writeln('cantidad de unidades vendidas del producto indicado: ',cant);
END.

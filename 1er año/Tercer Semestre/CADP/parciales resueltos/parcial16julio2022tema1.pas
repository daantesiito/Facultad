program parcial16julio2022tema1;
type
    meses = 1..12;
    compra = record
        monto: integer;
        mes: meses;
        cantProductos: integer;
        nombre: string;
    end;

    lista = ^nodo;
    nodo = record
        dato: compra;
        sig: lista;
    end;

    vectorMeses = array [meses] of integer;

procedure LeerCompra(var c: compra);
begin
    readln(c.monto);
    if (c.monto <> -1) then begin
        readln(c.mes);
        readln(c.cantProductos);
        readln(c.nombre);
    end;
end;

procedure InsertarOrdenado(var l: lista; c: compra);
var
    aux, act, ant: lista;
begin
    new(aux);
    aux^.dato:= c;
    act:= l;
    ant:= l;
    while (act <> nil) and (c.nombre > act^.dato.nombre) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act = ant) then
        l:= aux;
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;

procedure CargarLista(var l: lista);
var
    c: compra;
begin
    LeerCompra(c);
    while (c.monto <> -1) do begin
        InsertarOrdenado(l,c);
        LeerCompra(c);
    end;
end;

procedure InicializarVectorContador(var v: vectorMeses);
var
    i: integer;
begin
    for i:= 1 to 12 do begin
        v[i]:= 0;
    end;
end;

procedure MaxMeses(v: vectorMeses);
var
    i,max1,max2,maxi1,maxi2: integer;
begin
    max1:= 0;
    max2:= 0;
    maxi1:= 0;
    maxi2:= 0;
    for i:= 1 to 12 do begin
        if v[i] > max1 then
            max1:= v[i];
            maxi1:= i;
        else 
            if v[i] < max2 then
                max2:= v[i];
                maxi2:= i;
    end;
    writeln('Los dos meses con mayor compras son: ', maxi1, ' y ', maxi2)
end;

procedure procesar(var l: lista; var v: vectorMeses);
var
    NombreActual: string;
    SumaMonto, montoTotalJunio, comprasTotalJunio: integer;
    promedioJunio: real;
begin
    comprasTotalJunio:= 0;
    montoTotalJunio:= 0;
    while (l <> nil) do begin
        NombreActual:= l^.dato.nombre;
        SumaMonto:= 0;
        while (l^.dato.nombre = NombreActual) do begin
            SumaMonto:= SumaMonto + l^.dato.monto;
            v[l^.dato.meses]:= v[l^.dato.meses] + 1;
            if l^.dato.meses = 6 then begin
                montoTotalJunio:= l^.dato.monto;
                comprasTotalJunio:= comprasTotalJunio + 1;
            end;
            l:= l^.sig;
        end;
        if (SumaMonto > 30000) then
            writeln('El provedor ', NombreActual, ' supero los 30000 pesos.')
        l:= l^.sig;
    end;
    MaxMeses(v);
    promedioJunio:= montoTotalJunio / comprasTotalJunio;
    writeln('El monto promedio de las compras en Junio es de: ', promedioJunio);
end;

var
    l: lista;
    v: vectorMeses;
begin
    l:= nil;
    InicializarVectorContador(v);
    CargarLista(l)
    procesar(l,v);
end.
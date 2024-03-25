program parcialENUNCIADOtema2;
type
    meses = 1..12;
    compra = record
        monto: integer;
        mes: meses;
        cantKilos: integer;
        nombre: string;
    end;

    lista = ^nodo;
    nodo = record
        dato: compra;
        sig: lista;
    end;

    vectorCompras = array [meses] of integer;

procedure LeerCompras(var c: compra);
begin
    readln(c.cantKilos);
    if (c.cantKilos <> 100) then begin
        readln(c.monto);
        readln(c.mes);
        readln(c.nombre);
    end;
end;

procedure InsertarOrdenado(var l: lista; c: compra);
var
    aux, act, ant: lista;
begin
    new(aux);
    aux^.dato:= c;
    ant:= l;
    act:= l;
    while act <> nil and c.nombre > l^.dato.nombre do begin
        ant:= act;
        act:= act^.sig;
    end;
    if act = ant then
        l:= aux;
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;

program CargarLista(var l: lista);
var
    c: compra;
begin
    LeerCompras(c);
    while c.cantKilos <> 100 do begin
        InsertarOrdenado(l,c);
        LeerCompras(c);
    end;
end;

program procesar(var l: lista; var v: vectorCompras);
var
    MontoTotalFrig,ComprasSeptiembre,ComprasSeptiembreMonto: integer
    NombreActual: string;
    promedioSeptiembre: real;
begin
    while (l <> nil) do begin
        NombreActual:= l^.dato.nombre;
        while (l^.dato.nombre = NombreActual) do begin
            MontoTotalFrig:= MontoTotalFrig + l^.dato.monto;
            v[l^.dato.mes]:= v[l^.dato.mes] + 1;
            if l^.dato.mes:= 9 then begin
                ComprasSeptiembre:= ComprasSeptiembre + 1;
                ComprasSeptiembreMonto:= ComprasSeptiembreMonto + l^.dato.monto;
            end;
            l:= l^.sig;
        end;
        if (MontoTotalFrig > 45000) then
            writeln('El frigorifico', NombreActual ,' supero los 45000 pesos facturados.')
        l:= l^.sig;
    end;
    promedioSeptiembre:= ComprasSeptiembreMonto / ComprasSeptiembre;
    writeln('El monto promedio de compras en septiembre fue de: ', promedioSeptiembre);
    MaxMeses(v)
end;

procedure InicializarVectorContador(var v: vectorCompras);
var
    i: integer;
begin
    for i:= 1 to 12 do begin
        v[i]:= 0;
    end;
end;

procedure MaxMeses(v: vectorCompras);
var
    i,min1,min2,mini1,mini2: integer;
begin
    min1:= 999;
    min2:= 999;
    mini1:= 0;
    mini2:= 0;
    for i:= 1 to 12 do begin
        if v[i] < min1 then begin
            min2:= min1;
            min1:= v[i];
            mini2:= mini1;
            mini1:= i;
        end;
        else
            if v[i] > min2 then begin
                min2:= v[i];
                mini2:= i;
            end;
    end;
    writeln('Los dos meses con menores compras fueron: ', mini1, ' y ' ,mini2);
end;

var
    l: lista;
    v: vectorCompras;
begin
    l:= nil;
    InicializarVectorContador(v);
    CargarLista(l);
    procesar(l,v)
end.
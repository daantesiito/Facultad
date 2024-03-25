program parcialcadp2022tema2julio16;
type
    cantMeses = 1..12;
    compra = record
        monto: integer;
        mes: cantMeses;
        cantKG: integer;
        nombre: string;
    end;

    montototal = record
        nombre: string;
    end;

    lista = ^nodo;
    nodo = record
        dato: compra;
        sig: lista;
    end;

    lista2 = ^nodo2;
    nodo2 = record
        dato: montototal;
        sig: lista2;
    end;

    vectorMeses = array[1..12] of integer;

procedure LeerCompras(var c: compra);
begin
    readln(c.monto);
    readln(c.mes);
    readln(c.cantKG);
    readln(c.nombre);
end;

procedure InsertarOrdenado(var l: lista; c: compra);
var
    aux: lista;
    act,ant: lista;
begin
    new(aux);
    aux^.dato:= c;
    act:= l;
    ant:= l;
    while (act <> nil) and (c.nombre < aux^.dato.nombre) do begin
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
    LeerCompras(c);
    repeat
        InsertarOrdenado(l,c);
        LeerCompras(c);
    until (c.cantKG <> 100);
end;

procedure AgregarAdelante(var l: lista2;  m: montototal);
var
    aux: lista2;
begin
    new(aux);
    aux^.dato:= m;
    aux^.sig:= l;
    l:= l^.sig;
end;

procedure CargarLista2(var l: lista2; nombreF: string);
var
    m: montototal;
begin
    m.nombre:= nombreF;
    AgregarAdelante(l,m);
end;

procedure InicializarVectorContador(var v: vectorMeses);
var
    i: integer;
begin
    for i:= 1 to 12 do begin
        v[i]:= 0;
    end;
end;

procedure MenosCompras2Meses(num: integer; mes: integer; var min1, min2, mini1, mini2: integer);
begin
    if num > min1 then begin
        min2:= min1;
        min1:= num;
        mini2:= mini1;
        mini1:= mes;
    end;
    else
        if num > min2 then begin
            min2: num;
            mini2: mes;
        end;
end;

procedure procesar(var l: lista; var l2: lista2; var v: vectorMeses);
var
    nombreFrigorifico: string;
    MontoTotalFacturado, MontoTotalSeptiembre, min1, min2, mini1, mini2: integer;
    promedioSeptiembre:= real;
begin
    MontoTotalSeptiembre:= 0;
    MontoTotalFacturado:= 0;
    min1:= 0;
    min2:= 0;
    mini1:= 0;
    mini2:= 0;
    while l <> nil do begin
        nombreFrigorifico:= l^.dato.nombre;
        while l <> nil and nombreFrigorifico = l^.dato.nombre do begin
            MontoTotalFacturado:= MontoTotalFacturado + l^.dato.monto;
            v[l^.dato.mes]:= v[l^.dato.mes] + 1;
            if l^.dato.mes = 'septiembre' then begin
                MontoTotalSeptiembre:= MontoTotalSeptiembre + l^.dato.monto;
            end;
        end;
        if MontoTotalFacturado > 45000 then
            CargarLista2(l2,l^.dato.nombre);
        l:= l^.sig;
    end;
    while l2 <> nil do begin
        writeln('Los nombres de los frigorificos son: ', l2^.dato.nombre);
    end;
    for i:= 1 to 12 do begin
        MenosCompras2Meses(v[i], i, min1, min2, mini1, mini2);
    end;
    writeln('El menor mes de compras es: ', mini1, ' con ', min1, ' y el segundo es: ', mini2, ' con ', min2);
    promedioSeptiembre:= MontoTotalSeptiembre / v[9];
    writeln('El monto promedio de las compras realizadas en septiembre es de : ', promedioSeptiembre)
end;

var
    v:vectorMeses;
    l: lista;
    l2: lista2;
begin
    l:= nil;
    InicializarVectorContador(v);
    CargarLista(l);
    procesar(l,l2,v);
end.
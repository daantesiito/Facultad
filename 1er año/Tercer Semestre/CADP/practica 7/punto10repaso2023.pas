program punto10repaso2023;
type
    cantcultivos = 1..20;
    empresa = record
        cod: integer;
        nombre: string;
        estopriv: string;
        ciudad_rad: string;
        cultivos: cantcultivos;
        dimL: integer;
    end;

    cultivo: record
        tipo: integer;
        hectareas: integer;
        meses: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: empresa;
        sig: lista;
    end;

    vectorCultivos = array[cantcultivos] of cultivo;

procedure LeerEmpresas(var e: empresa);
begin
    readln(e.cod);
    readln(e.nombre);
    readln(e.estopriv);
    readln(e.ciudad_rad);
    readln(e.cultivos);
end;

procedure LeerCultivos(var c: cultivo);
begin
    readln(c.tipo);
    readln(c.hectareas);
    readln(c.meses);
end;

procedure AgregarAdelante(var l: lista; e: empresa);
var
    aux: lista;
begin
    new(aux);
    aux^.dato: e;
    aux^.sig: l;
    l:= aux;
end;

procedure CargarLista(var l: lista; e: empresa);
begin
    LeerEmpresas(e);
    while e.cod <> -1 do begin
        AgregarAdelante(l,e);
        LeerEmpresas(e);
    end;
end;

procedure LeerVectorCultivos(var v: vectorCultivos; var c: cultivo; var sumatotalhectareas: integer; var sumatiempomaiz: integer; var sumatotalsoja: integer; var totalcultivos: integer; var e: empresa; var max1: integer; var maxi1: string);
begin
    e.dimL:= 0;
    sumatiempomaiz:= 0;
    LeerCultivos(c);
    while (c.hectareas <> 0) and (e.cultivos < 20) do begin
        sumatotalhectareas:= sumatotalhectareas + c.hectareas;
        e.dimL:= e.dimL + 1;
        v[e.dimL]:= c.tipo;
        v[e.dimL]:= c.hectareas;
        v[e.dimL]:= c.meses;
        if v[e.dimL].tipo = 'soja' then
            sumatotalsoja:= sumatotalsoja + c.hectareas;
        if v[e.dimL].tipo = 'maiz' then
            sumatiempomaiz:= sumatiempomaiz + c.meses;
        LeerCultivos(c);
    end;
    mastiempoenmaiz(max1,sumatiempomaiz,maxi1,e);
end;

procedure procesarTodo(var l: lista);
var
    sumatotalhectareas, sumatotalsoja, max1, totalcultivos: integer;
    porcentajesoja: real;
    e: empresa;
begin
    max1:= 0;
    maxi1:= '';
    while l <> nil do begin
        sumatotalhectareas:= 0; {preguntar si va adentro del while o si va afuera}
        sumatotalsoja:= 0; {lo mismo de arriba}
        porcentajesoja:= 0.0; {lo mismo de arriba}
        if (l^.dato.nombre = 'San Miguel del Monte') and (CultivanTrigo(v) = True) and (ContieneDosCero(l^.dato.cod) = True) then
            writeln('El nombre de la empresa es: ', l^.dato.nombre);;
        porcentajesoja:= sumatotalhectareas / sumatotalsoja;
        writeln('La cantidad total de hectarias dedicadas al cultivo de soja son: ', sumatotalsoja, ' y el porcentaje que representa al total es de: ', porcentajesoja);
        l:= l^.sig;
    end;
    writeln('La empresa con mas tiempo dedicado al cultivo de maiz es: ', maxi1);
end;

procedure mastiempoenmaiz(var max1, sumatiempomaiz: integer; var maxi1: string; e: empresa);
begin
    if sumatiempomaiz > max1 then begin
        max1:= sumatiempomaiz;
        maxi1:= e.nombre;
    end;
end;

function CultivanTrigo(v: vectorCultivos): boolean;
var
    trigo: boolean;
    i: integer;
begin
    trigo:= False;
    i:= 1;
    while (i > 20) and (trigo = False) do begin
        if v[i].tipo = 'soja' then
            trigo:= True;
        i:= i + 1;
    end;
    if trigo = True then 
        CultivanTrigo:= True;
end;

function ContieneDosCero(codigo: integer;): boolean;
var
    dig, CantCeros: integer;
begin
    CantCeros:= 0;
    dig:= codigo MOD 10;
    while (codigo <> 0) and (CantCeros < 2) do begin
        if dig mod 2 = 0 then
            CantCeros:= CantCeros + 1;
        else
        codigo:= codigo DIV 10;
    end;
    if CantCeros >= 2 then
        ContieneDosCero:= True;
end;
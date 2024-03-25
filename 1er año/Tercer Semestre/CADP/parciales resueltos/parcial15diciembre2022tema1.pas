program parcial15diciembre2022tema1;
type
    prestamo = record
        ID: integer;
        fecha: fecha;
        DNI: integer;
        codigo: integer;
    end;

    fecha = record
        dia: integer;
        mes: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: prestamo;
        sig: lista;
    end;

    puntoA = record
        DNI: integer;
        CantPrestamosJunio: integer;
    end;

    lista2 = ^nodo2;
    nodo2 = record
        dato: puntoA;
        sig: lista2;
    end;

procedure LeerPrestamos(var p: prestamo);
begin
    readln(p.DNI);
    if (p.DNI <> -1) then begin
        readln(p.ID);
        readln(p.fecha.dia);
        readln(p.fecha.mes);
        readln(p.codigo);
    end;
end;

procedure InsertarOrdenado(var l: lista; p: prestamo);
var
    aux: lista;
    ant, act: lista;
begin
    new(aux);
    aux^.dato:= p;
    ant:= l;
    act:= l;
    while (act <> nil) and (p.DNI > act^.dato.DNI) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if act = ant then
        l:= aux;
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;

procedure CargarLista(var l: lista);
var
    p: prestamo;
begin
    LeerPrestamos(p);
    while (p.DNI <> -1) do begin
        InsertarOrdenado(l,p);
        LeerPrestamos(p);
        end;
    end;
end;

procedure AgregarAdelante(var l2: lista2; pa: puntoA);
var
    aux: lista2;
begin
    new(aux);
    aux^.dato:= pa;
    aux^.sig:= l2;
    l2:= aux;
end;

procedure MaxYMinPrestamos(prestamosmaxmin, DNI: integer; var max,maxi,min,mini: integer);
begin
    if prestamosmaxmin > max then begin
        max:= prestamosmaxmin;
        maxi:= DNI;
    end;
    if prestamosmaxmin < min then begin
        min:= prestamosmaxmin;
        mini:= DNI;
    end;
end;

procedure InicializarVectorContador(var: v: VectorDigitos);
var
    i: integer;
begin
    for i:= 1 to 10 do begin
        v[i]:= 0;
    end;
end;

procedure PuntoC(ID: integer);
var
    v: VectorDigitos    
begin
    InicializarVectorContador(v);
    dig:= 0;
    while ID <> 0 do begin
        dig:= ID MOD 10;
        v[dig + 1]:= v[dig + 1] + 1;
        ID:= ID DIV 10;
    end;
    for i:= 1 to 10 do begin
        writeln('El digito ', i - 1, ' tiene ', v[i]);
    end;
end;

procedure procesar(l: lista; var l2: lista);
var
    CantLibrosJunio, DNIactual, PrestamosPorCabeza, max, maxi, min, mini: integer;
    pa: puntoA;
begin
    max:= 0;
    maxi:= 0;
    min:= 999;
    mini:= 999;
    while (l <> nil) do begin
        DNIactual:= l^.dato.DNI;
        CantLibrosJunio:= 0;
        PrestamosPorCabeza:= 0;
        while (l^.dato.DNI = DNIactual) do begin
            PrestamosPorCabeza:= PrestamosPorCabeza + 1;
            if (l^.dato.fecha.mes = 6) then begin
                CantLibrosJunio:= CantLibrosJunio + 1;
            end;
            PuntoC(l^.dato.ID);
            l:= l^.sig;
        end;
        pa.DNI:= DNIactual;
        pa.CantPrestamosJunio:= CantLibrosJunio;
        AgregarAdelante(l2,pa);
        MaxYMinPrestamos(PrestamosPorCabeza,DNIactual,max,maxi,min,mini);
        l:= l^.sig;
    end;
    writeln('El socio con mas prestamos es: ', maxi, ' y el que menos tiene es: ', mini);
end;
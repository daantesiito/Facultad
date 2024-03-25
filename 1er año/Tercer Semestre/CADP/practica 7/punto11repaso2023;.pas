program punto11practica7repaso2023;
type
    cantEventos: 1..100;
    tiposEventos: 1..5;
    evento = record
        nombre: string;
        tipo: tiposEventos;
        lugar: string;
        capacidad: integer;
        entrada: integer;
        entradas: lista;
    end;

    venta = record
        codigo: integer;
        numEv: cantEventos;
        DNI: integer;
        cantEntradas: integer;
    end;

    vectorEventos = array[cantEventos] of evento;

    lista = ^nodo;
    nodo = record
        dato: venta;
        sig: lista;
    end;

procedure LeerEventos(var v: ventas);
begin
    readln(e.nombre);
    readln(e.tipo);
    readln(e.lugar);
    readln(e.capacidad);
    readln(e.entrada);
    v.entradas:= nil;
end;

procedure LeerVentas(var v: ventas);
begin
    readln(v.codigo);
    readln(v.numEv);
    readln(v.DNI);
    readln(v.cantEntradas);
end;

procedure CargarVector(var dimL: integer; var v: vectorEventos);
var
    e: evento;
begin
    LeerEventos(e)
    while (dimL > 100) do begin
        dimL:= dimL + 1;
        v[dimL]:= e;
        LeerEventos(e);
    end;
end;

procedure AgregarAdelante(var l: lista; v: venta);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= v;
    aux^.sig:= l;
    l:= aux;
end;

procedure CargarLista(var l: lista; var v: vectorEventos);
var
    ven: ventas;
begin
    LeerVentas(v)
    while (v.codigo <> -1) do begin
        AgregarAdelante(v[v.numEv].entradas,v);
        LeerVentas(v);
    end;
end;

procedure MenorRecaudacion(var min1, min2: integer; var miniN1, miniL1, miniN2, miniL2: string);
var
    totalRecaudacion: integer;
    v: vectorEventos;
begin
    for i:= 1 to 100 do begin
        totalRecaudacion:= v[i].costo * v[i].capacidad;
        if totalRecaudacion > min1 then begin
            min2:= min1;
            min1:= totalRecaudacion
            miniN2:= miniN1;
            miniN1:= v[i].nombre
            miniL2:= miniL1;
            miniL1:= v[i].lugar
        end;
    end;
end;

procedure procesarTodo(var l: lista);
var
    min1, min2: integer;
    miniN1, miniL1, miniN2, miniL2: string;
begin
    miniN1:= '';
    miniL1:= '';
    miniN2:= '';
    miniL2:= '';
    min1:= 0;
    min2:= 0;
    while l <> nil do begin
        MenorRecaudacion(min1, min2, miniN1, miniL1, miniN2, miniL2);
        l:= l^.sig;
    end;
    writeln('Los eventos con menos recaudacion fueron: 1: ', miniN1, ' en ', miniL1,  ' con 'min1, ' dinero ', ' y 2: ', miniN2, ' en ', miniL2, ' con ', min2, ' dinero ');
end;
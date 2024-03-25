program parcial8noviembre2022;
type
    areas = 1..4;
    empleados = record
        DNI: integer;
        nYa: string;
        condicion: string;
        area: areas;
        antiguedad: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: empleados;
        sig: lista;
    end;

    vectorAreas = array [areas] of integer;

procedure LeerEmpleados(var e: empleados);
begin
    readln(e.DNI);
    readln(e.nYa);
    readln(e.condicion);
    readln(e.area);
    readln(e.antiguedad);
end;

procedure AgregarAdelante(var l: lista; e: empleados);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= e;
    aux^.sig:= l;
    l:= l^.sig;
end;

procedure CargarLista(var l: lista);
var
    e: empleados;
begin
    LeerEmpleados(e);
    repeat 
        AgregarAdelante(l,e);
        if e.cod = temporal and DNICompuesto() = True
            InsertarOrdenado
        LeerEmpleados(e);
    until (l <> nil) and (e.DNI <> 33444555);
end;

procedure InicializarVectorContador(var v: vectorAreas);
var
    i: integer;
begin
    for i:= 1 to 4 do begin
        v[i]:= 0;
    end;
end;

procedure MenorAntiguedad(var min1,min2,dni1,dni2: integer; antiguedad, DNI: integer);
begin
    if antiguedad < min1 then begin
        min2:= min1;
        min1:= antiguedad;
        dni2:= dni1;
        dni1:= DNI
    end;
    else begin
        if antiguedad < min2 then begin
            min2:= antiguedad;
            dni2:= DNI;
        end;
    end;
end;

procedure EmpleadosEnAreas(v: vectorAreas);
var
    i: integer;
begin
    for i:= 1 to 4 do begin
        writeln('En el area ', i, ' hay ', v[i], ' empleados')
    end;
end;

function DNICompuesto(DNI: integer;): boolean;
var
    dig, cantPares, cantImpares: integer;
begin
    cantImpares:= 0;
    cantPares:= 0;
    DNICompuesto:= False;
    while DNI <> 0 do begin
        dig:= DNI MOD 10;
        if dig MOD 2 = 0 then 
            cantPares:= cantPares + 1;
        else
            cantImpares:= cantImpares + 1;
        DNI:= DNI DIV 10;
    end;
    if cantImpares = cantPares then
        DNICompuesto:= True;
end;

procedure InsertarOrdenado(var l: lista; e: empleados);
var
    aux: lista;
    act, ant: lista;
begin
    new(aux);
    aux^.dato:= e;
    ant:= l;
    act:= l;
    while (act <> nil) and (e.nYa > act^.dato.nYa) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if act = ant then
        l:= aux;
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;

procedure procesar(var l: lista; var l2: lista; var v: vectorAreas);
var
    min1,min2,dni1,dni2: integer;
begin
    min1:= -1;
    min2:= -1;
    dni1:= 0;
    dni2:= 0;
    while l <> nil do begin
        v[l^.dato.area]:= v[l^.dato.area] + 1;
        if l^.dato.area = 2 then
            MenorAntiguedad(min1,min2,dni1,dni2, l^.dato.antiguedad, l^.dato.DNI)
        if DNICompuesto(l^.dato.DNI) = True then begin
            InsertarOrdenado(l2,e);
        end;
        l:= l^.sig;
    end;
    EmpleadosEnAreas(v);
    writeln('Los DNI con menor antiguedad en el area administrativa son: ', dni1, ' y ', dni2);
end;

var
    l: lista;
    l2: lista;
    v: vectorAreas;
begin
    l:= nil;
    InicializarVectorContador(v);
    CargarLista(l);
    procesar(l,l2,v);
end.
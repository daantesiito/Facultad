program parcial2julio2022tema1;
type
    turnos: 1..4;
    notaingreso: 4..10;
    alumno = record
        DNI: integer;
        nYa: string;
        notaIng: notaingreso;
        turno: turnos;
        PoA: vectorPresentes;
    end;

    vectorPresentes = array [1..12] of boolean;

    lista = ^nodo;
    nodo = record
        dato: alumno;
        sig: lista;
    end;
    
    vectorTurnos = array [turnos] of integer;

procedure LeerAlumnos(var a: alumno); // SE DISPONE

procedure AgregarAdelante(var l: lista; a: alumno); // SE DISPONE

procedure CargarLista(var l: lista); // SE DISPONE

procedure procesar(var l: lista; var l2: lista);
var
    i, Asistio: integer;
begin
    while (l <> nil) do begin
        Asistio:= 0;
        for i:= 1 to 12 do begin
            if l^.dato.PoA[i] = True then
                Asistio:= Asistio + 1;
        end;
        if Asistio >= 8 then
            AgregarAdelante(l2, l^.dato);
        l:= l^.sig;
    end;
end;

procedure InicializarVectorContador(var v: vectorTurnos);
var
    i: integer;
begin
    for i:= 1 to 4 do begin
        v[i]:= 0;
    end;
end;

procedure MaxTurno(v: vectorTurnos; var max: integer;);
var
    i: integer;
begin
    for i:= 1 to 4 do begin
        if v[i] > max then begin
            max:= v[i];
            maxi:= i;
        end;
    end;
end;

function DigCero(DNI: integer): boolean;
var
    dig, EsCero: integer;
begin
    DigCero:= False;
    EsCero:= 0
    while (DNI <> 0) and (EsCero = 0) do begin
        dig:= DNI MOD 10;
        if dig = 0 then
            EsCero:= EsCero + 1;
        DNI:= DNI DIV 10;
    end;
    if EsCero = 0 then
        DigCero:= True;
end;

procedure procesar2(var l2: lista; var v: vectorTurnos);
var
    max, maxi, CantAlumnosCero: integer;
begin
    max:= 0;
    maxi:= 0;
    CantAlumnosCero:= 0;
    while l2 <> nil do begin
        if l2^.dato.notaIng >= 8 then
            writeln('El alumno ', l2^.dato.nYa, ' con DNI ', l2^.dato.DNI, ' obtuvo nota 8 o superior en el ingreso.')
        v[l2^.dato.turno]:= v[l2^.dato.turno] + 1;
        if DigCero(l2^.dato.DNI) = True then
            CantAlumnosCero:= CantAlumnosCero + 1;
        l2:= l2^.sig;
    end;
    MaxTurno(v,max,maxi);
    writeln('El turno con mayor cantidad de alumnos en condiciones de rendir es el turno: ' maxi);
    writeln('La cantidad de alumnos que no poseen ningun digito cero en su DNI es de: ', CantAlumnosCero);
end;

var
    l: lista;
    l2: lista;
    v: vectorTurnos;
begin
    l:= nil;
    l2:= nil;
    procesar(l,l2);
    InicializarVectorContador(v);
    procesar2(l2, v);
end.
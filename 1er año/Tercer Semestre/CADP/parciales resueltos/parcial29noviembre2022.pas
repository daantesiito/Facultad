program parcial29noviembre2022;
type
    cantMaterias = 0..37;
    notaPosible = 0..10;
    alumno = record
        legajo: integer;
        DNI: integer;
        nYa: string;
        ingreso: integer;
        MateriasA: cantMaterias;
        nota: vectorNotas;
    end;

    vectorNotas = array [0..37] of notaPosible;

    lista = ^nodo;
    nodo = record
        dato: alumno;
        sig: lista;
    end;

    AlumnoPuntoA = record
        legajo: integer;
        promedio: real;
    end;

    lista2 = ^nodo2;
    nodo2 = record
        dato: AlumnoPuntoA;
        sig: lista2;
    end;

procedure LeerAlumnos(var a: alumno); // SE DISPONE
begin
    readln(a.legajo);
    readln(a.DNI);
    readln(a.nYa);
    readln(a.ingreso);
    readln(a.MateriasA);
    for i:= 1 to a.MateriasA do begin
        readln(a.nota[i]);
    end;
end;

procedure AgregarAdelante(var l: lista; a: alumno); // NO SE HACE CUANDO SE DISPONE

procedure CargarLista(var l: lista); // SE DISPONE

procedure AgregarAdelante(var l: lista2; a: AlumnoPuntoA);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= a;
    aux^.sig:= l;
    l:= l^.sig;
end;

procedure MayorMateriasAprobadas(var max1,max2: integer; var maxi1,maxi2: string; nYa: string; MateriasA: integer);
begin
    if MateriasA > max1 then begin
        max2:= max1;
        max2:= maxi1;
        max1:= MateriasA;
        maxi1:= nYa;
    end;
    else begin
        if MateriasA > max2 then begin
            max2:= MateriasA;
            maxi2:= nYa;
        end;
    end;
end;

function DNIComp3Mult(dni: integer): boolean;
var
    dig, Cant3Mult: integer;
begin
    Cant3Mult:= 0;
    DNIComp3Mult:= False;
    while (DNI <> 0) and (Cant3Mult < 2) do begin
        dig:= DNI MOD 10;
        if ((dig MOD 3) = 0))) then
            Cant3Mult:= Cant3Mult + 1;
        DNI:= DNI DIV 10;
    end;
    if Cant3Mult >= 2 then
        DNIComp3Mult:= True;
end;

procedure procesar(var l: lista; var l2: lista; var ap: AlumnoPuntoA);
var
    SumaTotalNotas, max1, max2, i, CantAlumnos3Mult: integer;
    maxi1, maxi2: string;
begin
    i:= 0;
    max1:= 0;
    max2:= 0;
    maxi1:= '';
    maxi2:= '';
    CantAlumnos3Mult:= 0;
    while l <> nil do begin
        for i:= 1 to l^.dato.MateriasA do begin
            SumaTotalNotas:= SumaTotalNotas + l^.dato.nota[i];
        end;
        if (l^.dato.MateriasA > 1) then begin
            ap.legajo:= l^.dato.legajo;
            ap.promedio:= SumaTotalNotas / l^.dato.MateriasA;
            AgregarAdelante(l2,a)
        end;
        if (l^.dato.ingreso < 2018) then
            MayorMateriasAprobadas(max1,max2,maxi1,maxi2,l^.dato.nYa,l^.dato.MateriasA);
        if DNIComp3Mult(l^.dato.DNI) = True then
            CantAlumnos3Mult:= CantAlumnos3Mult + 1;
        l:= l^.sig;
    end;
    writeln('El nombre y apellido de los dos alumnos con mas materias aprobadas es: ', maxi1, ' y ', maxi2);
    writeln('La cantidad de alumnos con DNI compuesto por almenos 2 numeros multiplos de 3 es de: ', CantAlumnos3Mult);
end;

var
    l: lista;
    l2: lista2;
    ap: AlumnoPuntoA;
begin
    l:= nil;
    CargarLista(l);
    procesar(l,l2,ap)
end.
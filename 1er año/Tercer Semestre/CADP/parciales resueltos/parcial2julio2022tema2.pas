program parcial2julio2022;
type
    notaPosible = 0..10;
    alumno = record
        DNI: integer;
        nYa: string;
        ingreso: integer;
        nota: vectorNotas;
    end;

    lista = ^nodo;
    nodo = record
        dato: alumno;
        sig: lista;
    end;

    vectorNotas = array [1..10] of real;

procedure LeerAlumno(var a: alumno);
var
    cantAutoev: integer;
begin
    cantAutoev:= 0;
    readln(a.DNI);
    readln(a.nYa);
    readln(a.ingreso);
    readln(a.nota);
    for i:= 1 to 10 do begin
        readln(a.nota[i]);
    end;
end;

procedure AgregarAdelante(var l: lista; a: alumno);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= a;
    aux^.sig:= l;
    l:= l^.sig;
end;

procedure CargarLista(var l: lista);
var
    a: alumno;
begin
    LeerAlumno(a);
    repeat
        AgregarAdelante(l,a);
        LeerAlumno(a);
    until (a.DNI <> 33016244);    
end;

function DNIpar(DNI: integer): boolean
var
    dig, digFinal, sumaDig: integer;
begin
    sumaDig:= 0;
    DNIpar:= False;
    while DNI <> 0 do begin
        dig:= DNI MOD 10;
        sumaDig:= sumaDig + dig;
        DNI:= DNI DIV 10;
    end;
    digFinal:= sumaDig MOD 10;
    if ((digFinal MOD 2) = 0) then
        DNIpar:= True;
end;

procedure procesar(var l: lista);
var

begin
    Alumnos2020:= 0;
    AlumnosTotal:= 0;
    while l <> nil do begin
        AlumnosTotal:= AlumnosTotal + 1;
        cantHechas:= 0;
        cantAprobadas:= 0;
        for i:= 1 to 10 do begin
            if l^.dato.nota[i] <> -1 then
                cantHechas:= cantHechas + 1;
            if l^.dato.nota[i] >= 6 then
                cantAprobadas:= cantAprobadas + 1;
        end;
        if (cantHechas >= 8) and (cantAprobadas >= 4) then
            writeln('El alumno: ', l^.dato.DNI, ' puede rendir el parcial.')
        if (l^.dato.ingreso = 2020) and (cantHechas = 10) then
            Alumnos2020:= Alumnos2020 + 1;
        if DNIpar(l^.dato.DNI) = True then
            writeln(l^.dato.nYa);
        l:= l^.sig;
    end;
    PorcentajeAlumnos2020:= Alumnos2020 / AlumnosTotal;
    writeln('El porcentaje de alumnos es de: ', (PorcentajeAlumnos2020 * 100));
end;
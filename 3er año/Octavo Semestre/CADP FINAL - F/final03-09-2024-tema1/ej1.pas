program final;

const
    MAX_DEPTO = 100;

type
    rangoDeptos = 1..MAX_DEPTO;

    asistenciaEmp = record
        DNI: integer;
        apellido: string[15];
        nombre: string[15];
        codDepto: rangoDeptos;
        fecha: string[10];
        presente: boolean;
    end;

    listaAsistenciasEmp = ^nodo;
    nodo = record
        dato: asistenciaEmp;
        sig: listaAsistenciasEmp;
    end;

procedure procesar(l: listaAsistenciasEmp);
var
    maxCantEmp, cantEmpAct: integer;
    maxDepto, codAct: rangoDeptos;
    hayDatos: boolean;
begin
    hayDatos:= false;
    maxCantEmp:= -1;
    while (l <> nil) do begin
        hayDatos:= true;
        codAct:= l^.dato.codDepto;
        cantEmpAct:= 0;
        while (l <> nil) and (l^.dato.codDepto = codAct) do begin
            if (l^.dato.presente = true) then begin
                cantEmpAct:= cantEmpAct + 1;
            end;
            l:= l^.sig;
        end;
        if (cantEmpAct > maxCantEmp) then begin
            maxCantEmp:= cantEmpAct;
            maxDepto:= codAct;
        end;
    end;
    if (hayDatos) then begin
        writeln('El codigo de departamento con mas empleados presentes es: ', maxDepto);
    else 
        writeln('No hay datos cargados.');
    end;
end;

var
    l: listaAsistenciasEmp;
begin
    l:= nil;
    cargarLista(l);
    procesar(l);
end.
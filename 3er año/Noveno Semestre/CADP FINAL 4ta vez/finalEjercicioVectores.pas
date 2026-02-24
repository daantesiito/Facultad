// Una facultad dispone de los DNI de aquellos estudiantes que no cumplen con los requisitos de regularidad (a lo sumo 1000), 
// los cuales no pueden seguir siendo estudiantes de la Facultad. 
// Además, dispone de una estructura en la cual almacena todos los estudiantes; 
// de cada estudiante se conoce DNI, apellido y legajo. Esta estructura se encuentra ordenada por DNI. 
// Se pide realizar un programa que elimine (eficientemente en tiempo de ejecución) 
// de la estructura que posee todos los estudiantes aquellos estudiantes que han perdido la regularidad.

program final;
const
    MAX_ESTUDIANTES = 1000;

type
    estudiante = record
        DNI: integer;
        apellido: string;
        legajo: integer;
    end;

    lista_estudiantes = ^nodo;
    nodo = record
        dato: estudiante;
        sig: lista_estudiantes;
    end;

    vector_dni_estudiantes = array [1..MAX_ESTUDIANTES] of integer;

procedure cargarVector(var v: vector_dni_estudiantes; var dimL: integer); // se dispone
var
    dniActual: integer;
begin
    dimL := 0;
    
    write('Ingrese DNI a eliminar (-1 para cortar): ');
    readln(dniActual);
    
    while (dniActual <> -1) and (dimL < MAX_ESTUDIANTES) do begin
        
        dimL := dimL + 1;      
        v[dimL] := dniActual;   
        
        if (dimL < MAX_ESTUDIANTES) then begin 
            write('Ingrese DNI a eliminar (-1 para cortar): ');
            readln(dniActual);
        end;
    end;
end;

function alumnoAparece(v: vector_dni_estudiantes; dimL: integer; dni: integer): boolean;
var
    existe: boolean;
    i: integer;
begin
    existe := False;
    i := 1;
    while (not existe) and (i <= dimL) do begin
        if (v[i] = dni) then 
            existe := True
        else 
            i := i + 1;
    end;
    
    alumnoAparece := existe;
end;

procedure procesarEliminarAlumnos(var l: lista_estudiantes; v: vector_dni_estudiantes; dimL: integer);
var
    act, ant: lista_estudiantes;
begin
    act := l; 
    
    while (act <> nil) do begin
        
        if (alumnoAparece(v, dimL, act^.dato.DNI)) then begin
            
            { CASO A: Es el primer nodo de la lista }
            if (act = l) then begin
                l := l^.sig;     { Movemos el puntero principal de la lista }
                dispose(act);    { Matamos el nodo }
                act := l;        { Reubicamos act en el nuevo inicio }
            end
            
            { CASO B: Es un nodo en el medio o al final }
            else begin
                ant^.sig := act^.sig; { Hacemos el "puente" salteando a act }
                dispose(act);         { Matamos el nodo }
                act := ant^.sig;      { Reubicamos act en el que sigue }
            end;
            
        end
        
        { Si NO hay que borrarlo, simplemente avanzamos los dos punteros }
        else begin
            ant := act;       { El actual pasa a ser el anterior }
            act := act^.sig;  { El actual avanza al siguiente }
        end;
        
    end;
end;

var
    l: lista_estudiantes;
    v: vector_dni_estudiantes;
    dimL: integer;
begin
    dimL:= 0;
    cargarLista(l); // se dispone
    cargarVector(v,dimL); // se dispone
    procesarEliminarAlumnos(l,v,dimL);
end.
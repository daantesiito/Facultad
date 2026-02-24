program final_con_vector;

const
    MAX_TEMA = 15;

type
    prestamo = record
        cod_tema: integer;
        fecha: string;
        cod_libro: integer;
    end;

    lista_prestamos = ^nodo;
    nodo = record
        dato: prestamo;
        sig: lista_prestamos;
    end;

    vector_temas = array [1..MAX_TEMA] of integer;

procedure cargarLista(var l: lista_prestamos); // se dispone

procedure inicializarVector(var v: vector_temas);
var
    i: integer;
begin
    for i:= 1 to MAX_TEMA do begin
        v[i]:= 0;
    end;
end;

procedure procesarLista(l: lista_prestamos; var v: vector_temas);
begin
    while (l <> nil) do begin
            v[l^.dato.cod_tema]:= v[l^.dato.cod_tema] + 1;
            l:= l^.sig;
        end;
    end;
end;

procedure informar(v: vector_temas);
var
    i, tema_max, cant_tema_max: integer;
begin
    tema_max:= -1;
    cant_tema_max:= -1;
    for i:= 1 to MAX_TEMA do begin
        writeln('Cantidad de prestamos para tema ', i, ' es de: ', v[i]);
        if (v[i] > cant_tema_max) then begin
            tema_max:= i;
            cant_tema_max:= v[i];
        end;
    end;
    writeln('Tema con mas prestamos: ', tema_max);
end;

var
    l: lista_prestamos;
    v: vector_temas;
begin
    cargarLista(l); // se dispone
    inicializarVector(v);
    procesarLista(l,v);
    informar(v);
end.
program final09082022;
type
    categorias = 1..5;
    participante = record
        DNI: integer;
        nya: string;
        cat: categorias;
        inscripcion: string;
    end;

    vectorParticipantes = array [1..5000] of participante;

    lista = ^nodo;
    nodo = record
        dato: participante;
        sig: lista;
    end;

    vectorInscriptos = array [categorias] of integer;

// SE DISPONE procedure leerParticipantes(var p: participante);

// SE DISPONE procedure cargarVector(var v: vectorParticipantes; var p: participante);

procedure inicializarVectorInscriptos(var v: vectorInscriptos);
var
    i: integer;
begin
    for i:= 1 to 5 do begin
        v[i]:= 0;
    end;
end;

procedure conocerInscriptos(var l: lista; var vi: vectorInscriptos; var vp: vectorParticipantes);
var
    p: participante;
begin
    for i:= 1 to 5000 do begin
        v[vp[i].categoria]:= v[vp[i].categoria] + 1;
    end;
end;

procedure armarListaNueva(var l: lista; var v: vectorInscriptos; vp: vectorParticipantes);
var
    p: participante;
    i: integer;
begin
    for i:= 1 to 5000 do begin
        if (v[vp[i].categoria] >= 500) then begin
            agregarAdelante(l,p);
        end;
    end;
end;

var
    l: lista;
    p: participante;
    v: vectorContador;
    vp: vectorParticipantes;
begin
    // cargarVector(l,p); SE DISPONE 
    inicializarVector(v);
    conocerInscriptos(l,v,vp);
    armarListaNueva(l,v,vp);
end.
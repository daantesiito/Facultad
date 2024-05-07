program final;
type
    tipos = 1..12;

    publicacion = record
        titulo: string;
        nombre: string;
        dni: integer;
        tipo: tipos;
    end;

    lista = ^nodo;
    nodo = record
        dato: publicacion;
        sig: lista;
    end;

    vectorContador = array [tipos] of integer;

procedure inicializarVector(var v: vectorContador);
var
    i: integer;
begin
    for i:= 1 to 12 do begin
        v[i]:= 0;
    end;
end;

procedure informarCantPublisPorAutor();
var
    autorActual, sumaPost: integer;
begin
    leerPublicacion(p);
    while (p.dni <> 0) do begin
        autorActual:= p.dni;
        sumaPost:= 0;
        while (p.dni = autorActual) do begin
            v[p.tipo]:= v[p.tipo] + 1;
            sumaPost:= sumaPost + 1;
            leerPublicacion(p);
        end;
        writeln('La cantidad de posteos del dni: ', autorActual, ' es de: ', sumaPost);
    end;
end;

procedure informarMayorTipoCantPublis(v: vectorContador);
var
    i,max,maxi: integer;
begin
    max:= 0;
    maxi:= 0;
    for i:= 1 to 12 do begin
        if v[i] > max then begin
            max:= v[i];
            maxi:= i;
        end;
    end;
    writeln('El tipo de publicacion con mas publicaciones es: ', maxi, ' con: ', max, ' publicaciones');
end;

var
    v: vectorContador;
    l: lista;
    p: publicacion;

begin
    inicializarVector(v);
    informarCantPublisPorAutor(l);
    informarMayorTipoCantPublis(v);
end.
program ejercicio6adicional;
type
    cantLibros = 1..1500;
    cantTemas = 1..10;
    libro = record
        titulo: string;
        autor: string;
        ano: integer;
        tema: cantTemas;
    end;

    vectorLibros = array [cantLibros] of libro

    socio = record
        num: integer;
        mail: string;
        prestamos: prestamo;
    end;

    prestamo = record
        codLibro: 1..1500;
        fecha: string;
    end;

    lista = ^nodo;
    nodo = record
        dato: socio;
        sig: lista;
    end;

    vectorTemas = array [cantTemas] of integer;

procedure LeerLibros(var l: libro); // SE DISPONE

procedure CargarVectorLibros(var v: vectorLibros; l: libro); // SE DISPONE

procedure LeerSocios(var s: socio; var vt: vectorTemas; vl: vectorLibros; var cantTotalPrestamos: integer;);
var
    cantPrestamos: integer;
begin
    cantPrestamos:= 0;
    readln(s.num);
    readln(s.mail);
    readln(s.prestamos.codLibro);
    readln(s.prestamos.fecha);
    cantPrestamos:= cantPrestamos + 1;
    while vl[s.prestamos.codLibro] <> -1 do begin
        vt[vl[s.prestamos.codLibro].tema]:= vt[vl[s.prestamos.codLibro].tema] + 1;
        cantPrestamos:= cantPrestamos + 1;
        readln(s.prestamos.codLibro);
        readln(s.prestamos.fecha);
    end;
    cantTotalPrestamos:= cantTotalPrestamos + cantPrestamos;
end;

procedure AgregarAdelante(var l: lista; s: socio);
var
    aux: lista;
begin
    new(aux);
    aux^.dato: s;
    aux^.sig: l;
    l:= l^.sig;
end;

procedure CargarLista(var l: lista; var s: socio; vt: vectorTemas; vl: vectorLibros;);
var
    cantTotalPrestamos: integer;
begin
    cantTotalPrestamos:= 0;
    LeerSocios(s,vt,vl,cantTotalPrestamos);
    if cantPrestamos > 20 then begin
        writeln(s.num);
        writeln(cantPrestamos);
    end;
    while (l <> nil) and (s.num <> -1) do begin
        AgregarAdelante(l,s)
        LeerSocios(s,vt,vl,cantTotalPrestamos);
        if cantPrestamos > 20 then begin
            writeln(s.num);
            writeln(cantPrestamos);
        end;
    end;
    writeln(cantTotalPrestamos);
end;

procedure InicializarVectorContador(var v: vectorTemas);
var
    i: integer;
begin
    for i:= 1 to 10 do begin
        v[i]:= 0;
    end;
end;

program ejercicio6;
uses
	SysUtils;
const
    valoralto = 9999;
    n = 5;
type
    maestro = record
        cod_usuario: integer;
        fecha: string;
        tiempo_total_de_sesiones_abiertas: integer;
    end;

    detalle = record
        cod_usuario: integer;
        fecha: string;
        tiempo_sesion: integer;
    end;

    archivoMaestro = file of maestro;

    archivoDetalle = file of detalle;

    vectorADetalle = array [1..n] of archivoDetalle;

    vectorRDetalle = array [1..n] of detalle;

procedure leer(var archD: archivoDetalle; var d: detalle);
begin
    if not EOF(archD) then
        read(archD,d);
    else
        d.cod_usuario:= valoralto;
end;

procedure minimo(var vecADetalle: vectorADetalle; var min: detalle; var vecRDetalle: vectorRDetalle);
var
    i,codMin,posMin: integer;
begin
    codMin:= 9999;
    for i:= 1 to n do begin
        if vecRDetalle[i].cod_usuario < codMin then begin
            codMin:= vecRDetalle[i].cod_usuario;
            posMin:= i;
        end;
    end;
    min:= vecRDetalle[posMin];
    leer(vecADetalle[posMin],vecRDetalle[posMin]);
end;

procedure crearMaestro(var vecADetalle: vectorADetalle; var vecRDetalle: vectorRDetalle; var archM: archivoMaestro);
var
    i: integer;
    min: detalle;
    m: maestro;
begin
    assign(archM,'maestro');
    rewrite(archM);
    for i:= 1 to n do begin
        assign(vecADetalle[i],'detalle'+IntToStr(i));
        reset(vecADetalle[i]);
    end;
    minimo(vecADetalle,min,vecRDetalle);
    while (min.cod_usuario <> valoralto) do begin
        m.cod_usuario:= min.cod_usuario;
        while (min.cod_usuario = codActual) do begin
            m.fecha:= min.fecha;
            m.tiempo_total_de_sesiones_abiertas:= 0;
            while (min.cod_usuario = m.cod_usuario) and (min.fecha = m.fecha) do begin
                m.tiempo_total_de_sesiones_abiertas:= m.tiempo_total_de_sesiones_abiertas + min.tiempo;
                minimo(vecADetalle,min,vecRDetalle);
            end;
            write(archM,m);
        end;        
    end;
    close(archM);
    for i:= 1 to n do begin
        close(vecADetalle[i]);
    end;
end;

procedure leerMaestro(m: maestro);
begin
    with m do begin
        writeln('----------------');
        writeln('Usuario: ', m.cod_usuario);
        writeln('Usuario: ', m.fecha);
        writeln('Usuario: ', m.tiempo_total_de_sesiones_abiertas);
    end;
end;

procedure imprimirMaestro(var archM: archivoMaestro);
var
    m: maestro;
begin
    reset(archM);
    while not EOF(archM) do begin
        leerMaestro(m);
        read(archM,m)
    end;
    close(archM);
end;

var
    m: maestro;
    archM: archivoMaestro;
    vAD: vectorADetalle;
    vRD: vectorRDetalle;

begin
    crearMaestro(vAD,vRD,archM);
    imprimirMaestro(archM);
end.
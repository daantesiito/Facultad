program devuelta;
const
    valoralto = 9999;
type
    empleados = record
        cod: integer;
        nombre: string;
        monto: integer;
    end;

    compacto = record
        cod: integer;
        monto: integer;
    end;

    archMaestro = file of compacto;

    archDetalle = file of empleados;

procedure leer(var archD: archDetalle; var e: empleados);
begin
    if not EOF then
        read(archD,e);
    else
        e.cod:= valoralto;
end;

procedure recibo_y_compacto(var archM: archivoMaestro; var archD: archDetalle);
var
    e: empleados;
    c: compacto;
begin
    rewrite(archM);
    reset(archD);
    leer(archD,e);
    while (e.cod <> valoralto) then begin
        cod_actual:= e.cod;
        monto_cod_actual:= 0;
        while (e.cod == cod_actual) then begin
            monto_cod_actual += e.monto;
            leer(archD,e);
        end;
        c.monto:= monto_cod_actual;
        c.cod:= cod_actual;
        write(archM,c);
    end;
    close(archM);
    close(archD);
end;

var
    archM: archivoMaestro; 
    archD: archDetalle;

begin
    assign(archM,'maestro');
    assign(archD,'detalle');
    recibo_y_compacto(archM,archD);
end.
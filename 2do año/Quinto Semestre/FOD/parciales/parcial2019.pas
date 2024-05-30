program parcial2019;
const
    valoralto = 9999;
type
    fechas = record
        dia: integer;
        mes: integer;
        año: integer;
    end;

    ventas = record
        cod_farmaco: integer;
        nombre: string;
        fecha: fechas;
        cantidad_vendida: integer;
        forma_pago: string;
    end;

    resumen = record
        cod_farmaco: integer;
        nombre: string;
        fecha: fechas;
        cantidad_total_vendida: integer;
    end;

    archVenta = file of informacion;

    VecArchVenta = [1..30] of archVenta;

    VecRegVenta = [1..30] of ventas;

procedure leer(var archVenta: archVenta; var v: ventas);
begin
    if not EOF(archVenta) then
        read(archVenta,v);
    else
        v.cod_farmaco:= valoralto;
end; 

procedure minimo(var VecArchVenta: VecArchVenta; var min: ventas; var VecRegVenta: VecRegVenta);
begin
    posMin:= 0;
    for i:= 1 to 30 do begin
        if (vecRegVenta[i] <> valoralto) then begin
            if (vecRegVenta[i] < min.cod_farmaco) then begin
                min:= vecRegVenta[i];
                posMin:= i;
            end;
        end;
    end;
    if (posMin <> 0) then
        leer(vecArchVenta[posMin], vecRegVenta[posMin]);
end;

procedure mayorVendidas(cantVendidas,codActual: integer; var cantMax,codMax: integer);
begin
    if (cantVendidas > cantMax) then begin
        cantMax:= cantVendidas;
        codMax:= codActual;
    end;
end;

procedure cargarResumen(var r: resumen; nombre: string; codFarmaco,cantVendidas: integer; f: fechas);
begin
    r.cod_farmaco:= codFarmaco;
    r.nombre: nombre;
    r.fecha.dia: f.dia;
    r.fecha.mes: f.mes;
    r.fecha.año: f.año;
    r.cantidad_total_vendida: cantVendidas;
end;

procedure informar(var VecArchVenta: VecArchVenta; var VecRegVenta: VecRegVenta; var archTxt: Text);
var
    v: ventas;
    cantVendida,codActual,cantMax,codMax: integer;
begin
    cantMax:= 0;
    codMax:= 0;
    for i:= 1 to 30 do begin
        assign(VecArchVenta[i],'venta'+ i);
        reset(VecArchVenta[i]);
    end;
    reset(archTxt);
    minimo(VecArchVenta,v,VecRegVenta);
    while (v.cod_farmaco <> valoralto) do begin
        codActual:= v.cod_farmaco;
        cantVendida:= 0;
        while (v.cod_farmaco == codActual) do begin
            cantVendida += v.cantidad_vendida;
            minimo(VecArchVenta,v,VecRegVenta);
        end;
        cargarResumen(r);
        writeln(archTxt, r.cod_farmaco, r.nombre, r.fecha, r.cantidad_total_vendida);
        mayorVendidas(cantVendida,codActual,cantMax,codMax);
    end;
    writeln('El farmaco con mas ventas es: ', codMax, ' con: ', cantMax);
    for i:= 1 to 30 do begin
        close(VecArchVenta[i]);
    end;
    close(archTxt);
end;

var
    archTxt: Text;
    VecArchVenta: VecArchVenta;
    VecRegVenta: VecRegVenta;
begin
    assign(archTxt,'archivo.txt');
    infomar(VecArchVenta,VecRegVenta,archTxt);
end.
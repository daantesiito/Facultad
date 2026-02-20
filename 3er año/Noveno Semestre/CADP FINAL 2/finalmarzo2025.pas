// Un comercio dispone de una estructura de datos con información de las facturas realizadas durante el último mes (como máximo 1000). 
// De cada factura se conoce el número de factura, código de sucursal (0..5) a la que pertenece y monto total. 
// Se pide implementar un programa que lea de teclado un código de sucursal y elimine 
// de la estructura todas las facturas pertenecientes al código de sucursal leído. 
// Al finalizar debe informar el monto acumulado en todas las facturas eliminadas. 
// La solución debe ser óptima en tiempo de ejecución.

program final;
const
    MAX_NUM = 1000;

type
    cod_s = 1..5;
    

    factura = record
        num_factura: integer;
        cod_sucursal: cod_s;
        monto_total: real;
    end;

    vectorFacturas = array [1..MAX_NUM] of factura;

procedure eliminarFactura(numF: integer; var v: vectorFacturas; var contador_monto: real; var dimL: integer);
var
    i: integer;
begin
    i:= 0;
    for i:= 1 to dimL do begin
        if (v[i].cod_sucursal = numF) then begin
            v[i - 1] := v[i];
            dimL:= dimL - 1;
            contador_monto:= contador_monto + v[i].monto_total;
        end;
    end;
end;

var
    v: vectorFacturas;
    numF, contador_monto, dimL: integer;
begin
    cargarVector(dimL,v); // se dispone
    readln(numF);
    eliminarFactura(numF,v,contador_monto,dimL);
    writeln('Monto total de facturas eliminadas: ', contador_monto);
end.
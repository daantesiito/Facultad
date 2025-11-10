program final;

const
    MAX_RANGO = 1000;
    MAX_SUCURSAL = 5;
type
    rango = 1..MAX_RANGO;
    
    facturas = record
        numero: integer;
        codSucursal: 1..MAX_SUCURSAL;
        montoTotal: real;    
    end;

    vectorFacturas = array [rango] of facturas;
    
procedure eliminarFactuas(var v: vectorFacturas; codigoSucursal: integer; var montoAcumulado: real, var dimL: integer);
var
    i: integer;
begin
    i:= 0;
    while (i <= dimL) do begin
        if (v[i].codigoSucursal = codigoSucursal) then begin
            montoAcumulado:= montoAcumulado + v[i].montoTotal;
            v[i]:= v[dimL];
            dimL:= dimL - 1;
        end;
        else
            i:= i + 1;
    end;
end;

var
    v: vectorFacturas;
    codSucursal: 1..MAX_SUCURSAL;
    montoAcumulado: real;
    dimL: integer;
begin
    cargarVector(v) // se dispone
    dimL:= MAX_RANGO;
    montoAcumulado:= 0;
    writeln('Ingrese un codigo de sucursal: ');
    readln(codSucursal);
    eliminarFactuas(v,codSucursal,montoAcumulado,dimL);
    writeln('Monto acumulado de facturas eliminadas: ', montoAcumulado);
end.
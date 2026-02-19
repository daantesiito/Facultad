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

procedure eliminarFactura(numF: integer; var v: vectorFacturas; var contador: real; var dimL: integer);
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
    numF, contador, dimL: integer;
begin
    cargarVector(dimL,v); // se dispone
    readln(numF);
    eliminarFactura(numF,v,contador,dimL);
    writeln('Cantidad de facturas eliminadas: ', contador);
end.
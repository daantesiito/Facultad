program final;

const
    MAX_VENTAS = 500;

type
    producto = record
        codigo: integer;
        cantidad: integer;
    end;

    lista_productos = ^nodo;
    nodo = record
        dato: producto;
        sig: lista_productos;
    end;

    venta = record
        numero: integer;
        monto: real;
        prod_vendidos: lista_productos;
    end;

    vector_ventas = array [1..MAX_VENTAS] of venta;

function tiene_5(l: lista_productos): boolean;
var
    total: integer;
begin
    total:= 0;
    while (l <> nil) and (total <= 5) do begin
        total:= total + l^.dato.cantidad;
        l:= l^.sig;
    end;
    if (total = 5) then
        tiene_5:= True
    else begin
        tiene_5:= False;
    end;
end;

procedure eliminar_ventas_5_productos(var v: vector_ventas; var dimL: integer);
var
    i,pos_nueva: integer;
begin
    pos_nueva:= 1;
    for i:= 1 to dimL do begin
        if (not tiene_5(v[i].prod_vendidos)) then begin
            v[pos_nueva]:= v[i];
            pos_nueva:= pos_nueva + 1;
        end;
    end;
    dimL:= pos_nueva - 1;
end;

var
    v: vector_ventas;
    dimL: integer;
begin
    cargarVector(v,dimL);
    eliminar_ventas_5_productos(v,dimL);
end.
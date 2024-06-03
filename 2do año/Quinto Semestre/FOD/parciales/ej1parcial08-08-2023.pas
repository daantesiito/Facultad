program ej;
const
    valoralto = 9999;
type
    producto = record
        cod: integer;
        nombre: string;
        precio: real;
        stockActual: integer;
        stockMinimo: integer;
    end;

    venta = record
        cod: integer;
        cantVendida: integer;
    end;

    archProductos = file of productos;

    archDetalle = file of venta;

    vecArchDetalle = array [1..20] of archDetalle;

    vecRegDetalle = array [1..20] of venta;

procedure leer(var archD: archDetalle; var v: venta);
begin
    if not EOF(archD) then
        read(archD,v);
    else
        v.cod:= valoralto;
end;

procedure minimo(var vecArchDetalle: vecArchDetalle; var min: venta;var vecRegDetalle: vecRegDetalle);
begin
    posMin:= 0;
    min.cod:= valoralto;
    for i:= 1 to 20 do begin
        if vecRegDetalle[i].cod <> valoralto then begin
            if vecRegDetalle[i].cod < min.cod then begin
                min:= vecRegDetalle[i];
                posMin:= i;
            end;
        end;
    end;
    if posMin <> 0 then
        leer(vecArchDetalle[posMin], vecRegDetalle[posMin])
end;

procedure actualizar(var vecArchDetalle: vecArchDetalle; var min: venta;var vecRegDetalle: vecRegDetalle; var archP: archProductos; var archTxt: Text);
var
    min: venta;
    p: producto;
    codActual,totalVendido,montoTotalDia,i: integer;
begin
    reset(archP);
    rewrite(archTxt);
    for i:= 1 to 20 do begin
        assign(vecArchDetalle[i],'detalle ', i);
        reset(vecArchDetalle[i]);
    end;
    minimo(vecArchDetalle,min,vecRegDetalle);
    while (min.cod <> valoralto) do begin
        codActual:= min.cod;
        while (min.cod <> valoralto) and (codActual = min.cod) do begin
            totalVendido += min.cantVendida;
            minimo(vecArchDetalle,min,vecRegDetalle);
        end;
        read(archP,p);
        while (p.cod <> codActual) do
            read(archP,p);
        seek(archP,filepos(archP)-1);
        montoTotalDia:= p.precio * totalVendido;
        if (montoTotalDia > 10000) then
            writeln(archTxt,p.cod,p.nombre,p.precio,p.stockActual,p.stockMinimo);
        p.stockActual:= p.stockActual - totalVendido;
        write(archP,p);
    end;
    close(archP);
    close(archTxt);
    for i:= 1 to 20 do begin
        close(vecArchDetalle[i]);
    end;
end;

var
    archP: archProductos;
    vecArchDetalle: vecArchDetalle;
    vecRegDetalle: vecRegDetalle;
    archTxt: Text;
begin
    assign(archP,'productos');
    assign(archTxt,'ventas10000.txt');
    actualizar(vecArchDetalle,vecRegDetalle,archP,archTxt);
end.
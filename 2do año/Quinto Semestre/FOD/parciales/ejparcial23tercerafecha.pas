program ej;
const
    valoralto = 9999;
type
    producto = record
        cod: integer;
        nombre: string;
        precio: real;
        stockActual:= integer;
        stockMin:= integer;
    end;

    venta = record
        cod: integer;
        cantVendida: integer;
    end;

    archProducto = file of producto;

    archVenta = file of venta;

    vecArchVenta = array [1..20] of archVenta;

    vecRegVenta = array [1..20] of venta;

procedure leer(var arch: archVenta; var v: venta);
begin
    if not EOF(arch) then
        read(arch,v);
    else
        v.cod:= valoralto;
end;

procedure minimo(var arch: vecArchVenta; var min: venta; var reg: vecRegVenta);
var
    posMin,i: integer;
begin
    posMin:= 0;
    min.cod:= valoralto;
    for i:= 1 to 20 do begin
        if (reg[i].cod <> valoralto) then begin
            if (reg[i].cod < min.cod) then begin
                min:= reg[i];
                posMin:= i;
            end;
        end;
    end;
    if (posMin <> 0) then
        leer(arch[posMin],reg[posMin]);
end;

procedure actualizar(var vArch: vecArchVenta; var vReg: vecRegVenta; var archP: archProducto; var archTxt: Text);
var
    codActual,ventasTotal,montoTotal: integer;
    min: venta;
    p: producto;
begin 
    reset(archP);
    for i:= 1 to 20 do begin
        assign(vArch[i],'detalle',i);
        reset(vArch[i]);
        leer(vArch[i],vReg[i])
    end;
    minimo(vArch,min,vReg);
    while (min.cod <> valoralto) do begin
        codActual:= min.cod;
        ventasTotal:= 0;
        while (codActual = min.cod) do begin
            ventasTotal:= ventasTotal + min.cantVendida;
            minimo(vArch,min,vReg);
        end;
        read(archP,p);
        while p.cod <> codActual do 
            read(archP,p);
        p.stockActual:= p.stockActual - ventasTotal;
        montoTotal:= p.precio * ventasTotal;
        if (montoTotal > 10000) then
            writeln(archTxt,p.cod,p.nombre,p.precio,p.stockActual,p.stockMin);
        seek(archP,filepos(archP)-1);
        write(archP,p);
        if not EOF(archP) then
            read(archP,p);
    end;
    close(archP);
    for i:= 1 to 20 do begin
        close(vArch[i]);
    end;
end;
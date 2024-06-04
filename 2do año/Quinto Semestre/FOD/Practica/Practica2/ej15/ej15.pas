program parcial;
const
    valoralto = 9999;
type
    emision = record
        fecha: fechas;
        cod: integer;
        nombre: string;
        descripcion: string;
        precio: real;
        ejTotal: integer;
        ejVendidos: integer;
    end;

    detalle = record
        fecha: fechas;
        cod: integer;
        ejVendidos: integer;
    end;

    archEmision = file of emision;

    archDetalle = file of detalle;

    vecArchDetalle = array [1..100] of archDetalle;

    vecRegDetalle = array [1..100] of detalle;

procedure leer(var arch: archDetalle; var d: detalle);
begin
    if not EOF(arch) then
        read(arch,d);
    else
        d.cod:= valoralto;
end;

procedure minimo(var arch: vecArchDetalle; var min: detalle; var reg: vecRegDetalle);
var
    posMin,i: integer;
begin
    posMin:= 0;
    min.fecha:= valoralto;
    for i:= 1 to 100 do begin
        if reg[i].fecha <> valoralto then begin
            if reg[i].fecha < min.fecha then begin
                min:= reg[i];
                posMin:= i;
            end;
        end;
    end;
    if (posMin <> 0) then
        leer(arch[posMin],reg[posMin]);
end;

procedure maxVentas(num: integer; reg: detalle; var max: integer; var maxReg: detalle);
begin
    if (num > max) then begin
        max:= num;
        maxReg:= reg;
    end;
end;

procedure maxVentas(num: integer; reg: detalle; var min: integer; var minReg: detalle);
begin
    if (num < min) then begin
        min:= num;
        minReg:= reg;
    end;
end;


procedure actualizar(var archE: archEmision; var reg: vecRegDetalle; var vecArchDetalle: vecArchDetalle);
var
    i,maxV,minV: integer;
    
begin
    reset(archE);
    for i:= 1 to 100 do begin
        assign(arch[i],'detalle',i);
        reset(arch[i]);
    end;
    minimo(arch,min,reg);
    while (min.fecha <> valoralto) do begin
        fechaActual:= min.fecha;
        while fechaActual = min.fecha do begin
            maxVentas(min.ejVendidos,min,maxV,maxReg);
            minVentas(min.ejVendidos,min,minV,minReg);
            read(archE,e);
            while (e.cod <> min.cod) do
                read(archE,e);
            e.ejVendidos:= e.ejVendidos + min.ejVendidos;
            e.ejTotal:= e.ejTotal - min.ejTotal;
            seek(archE,filepos(archE)-1);
            write(archE,e);
            if not EOF(archE) then 
                read(archE,e);
            minimo(arch,min,reg);
        end;
    end;
    close(archE)
    for i:= 1 to 100 do begin
        close(arch[i]);
    end;
end;


program ejercicio5;
uses
	SysUtils;
const
    dimF = 30;
    valoralto = 9999;
type
    producto = record
        codigo: integer;
        nombre: string;
        descrip: string;
        stockDisp: integer;
        stockMin: integer;
        precio: integer;
    end;

    venta = record
        codigo: integer;
        cantVentas: integer;
    end;

    archivoMaestro = file of producto;

    archivoDetalle = file of venta;

    vectorDetalle = array [1..dimF] of archivoDetalle;

    vectorRegDetalle = array [1..dimF] of venta;

procedure leer(var detalle: archivoDetalle; var v: venta);
begin
    if not EOF(detalle) then
        read(detalle,v)
    else
        v.codigo:= valoralto;
end;

procedure minimo(var v: vectorRegDetalle; var min: venta; var detalle: vectorDetalle);
var
    i,codMin,posMin: integer;
begin
    codMin:= 9999;
    for i:= 1 to dimF do begin
        if v[i].codigo < codMin then begin
            codMin:= v[i].codigo;
            posMin:= i;
        end;
    end;    
    min:= v[posMin];
    leer(detalle[posMin],v[posMin]);
end;

procedure actualizarMaestro(var maestro: archivoMaestro; var vDetalle: vectorDetalle; var vRegDetalle: vectorRegDetalle);
var
    p: producto;
    i,prodActual,vendido,h: integer;
    min: venta;
begin
    assign(maestro,'maestro');
    reset(maestro);
    h:= 1;
    for i:= 1 to dimF do begin
        assign(vDetalle[i],'detalle'+ IntToStr(i));
        reset(vDetalle[i]);
    end;
    minimo(vRegDetalle,min,vDetalle);
    while min.codigo <> valoralto do begin
        prodActual:= min.codigo;
        vendido:= 0;
        while prodActual = min.codigo do begin
            vendido:= vendido + min.cantVentas;
            minimo(vRegDetalle,min,vDetalle);
        end;
        if (not EOF(maestro)) then
			read(maestro,p);
        writeln('asdas', h);
        h:= h+1;
        while (p.codigo <> prodActual) and (not EOF(maestro)) do
            read(maestro,p);
        p.stockDisp:= p.stockDisp - vendido;
        writeln('jajajajsjd');
        seek(maestro, filePos(maestro)-1);
        writeln('oooooooooooo');
        write(maestro,p);
        writeln('aaaaaaaaaaaaa');
    end;
    writeln('123456');
    close(maestro);
    writeln('hoola');
    for i:= 1 to 30 do 
        close(vDetalle[i]);
end;

procedure stockTXT(var maestro: archivoMaestro; var p: producto);
var
    maestrotxt: Text;
begin
    assign(maestro,'maestro');
    assign(maestrotxt,'maestro.txt');
    reset(maestro);
    rewrite(maestrotxt);
    read(maestro,p);
    while not EOF(maestro) do begin
        if p.stockDisp < p.stockMin then 
            writeln(maestrotxt, 'Nombre: ', p.nombre, ' Descripcion: ', p.descrip, ' Stock Disponible: ', p.stockDisp, ' Precio: ', p.precio);
        read(maestro,p);
    end;
end;

var
    maestro: archivoMaestro;
    vDetalle: vectorDetalle;
    vRegDetalle: vectorRegDetalle;
begin
    actualizarMaestro(maestro,vDetalle,vRegDetalle);
    //stockTXT(maestro,p);
end.

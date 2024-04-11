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

procedure LeerProducto(var p: producto);
begin
    writeln('Ingrese el codigo del producto: ');
    readln(p.codigo);
    if p.codigo <> 0 then begin
        writeln('Ingrese el nombre del producto: ');
        readln(p.nombre);
        writeln('Ingrese la descripcion del producto: ');
        readln(p.descrip);
        writeln('Ingrese el stock disponible del producto: ');
        readln(p.stockDisp);
        writeln('Ingrese el stock minimo del producto: ');
        readln(p.stockMin);
        writeln('Ingrese el precio del producto: ');
        readln(p.precio);
    end;
end;

procedure LeerVenta(var v: venta; i: integer);
begin
    v.codigo:= i;
    v.cantVentas:= 10 + i;
end;

var
    p: producto;
    vDetalle: vectorDetalle;
    vRegDetalle: vectorRegDetalle;
    maestro: archivoMaestro;
    i,opcion: integer;
    nombre_fisico: string;
begin
    writeln('Archivo PRODUCTOS (1) / Archivo VENTAS (2)');
    readln(opcion);
    case opcion of
        1:
        begin
            writeln('Ingrese el nombre del archivo de productos: ');
            readln(nombre_fisico);
            assign(maestro,nombre_fisico);
            rewrite(maestro);
            LeerProducto(p);
            while (p.codigo <> 0) do begin
                write(maestro,p);
                LeerProducto(p);
            end;
            writeln('Archivo maestro creado exitosamente!');
            close(maestro);
        end;
        2:
        begin
            writeln('Ingrese el nombre del archivo de ventas: ');
            readln(nombre_fisico);
            for i:= 1 to dimF do begin
                assign(vDetalle[i], 'detalle'+ IntToStr(i));
                rewrite(vDetalle[i]);
                LeerVenta(vRegDetalle[i],i);
                write(vDetalle[i],vRegDetalle[i]);;
            end;
            writeln('Archivo ventas creado exitosamente!');
        end;
    end;
end.


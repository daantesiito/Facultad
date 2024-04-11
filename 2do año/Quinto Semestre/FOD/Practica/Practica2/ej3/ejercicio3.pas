program ejercicio3;
const
	valoralto = 9999;
type
	producto = record
		codProd: integer;
		nombre: string;
		precio: integer;
		stockAct: integer;
		stockMin: integer;
	end;
	
	venta = record
		codProd: integer;
		cantVendido: integer;
	end;
	
	archivo_productos = file of producto;
	
	archivo_ventas = file of venta;
	
procedure leer(var ventas: archivo_ventas; var venta: venta);
begin
	if not EOF(ventas) then
		read(ventas, venta)
	else
		venta.codProd:= valoralto;
end;

procedure modificarProductos(var productos: archivo_productos; var ventas: archivo_ventas);
var
	ven: venta;
	prod: producto;
	codProdActual,stockVendido: integer;
begin
	//writeln('Ingrese el nombre del archivo de productos (maestro): ');
	//readln(nombre_fisico);
	assign(productos,'productos');
	//writeln('Ingrese el nombre del archivo de ventas (detalle): ');
	//readln(nombre_fisico);
	assign(ventas,'ventas');
	reset(productos);
	reset(ventas);
	read(productos,prod);
	leer(ventas,ven);
	while (ven.codProd <> valoralto) do begin
		codProdActual:= ven.codProd;
        stockVendido:= 0;
        while (ven.codProd = codProdActual) do begin
            stockVendido:= stockVendido + ven.cantVendido;
            leer(ventas,ven);
        end;
        while (prod.codProd <> codProdActual) do 
            read(productos,prod);
        prod.stockAct:= prod.stockAct - stockVendido;
        seek(productos, filePos(productos)-1);
        write(productos,prod);
        if not EOF(productos) then
            read(productos,prod);
	end;
    writeln('Archivo maestro modificado con exito!');
    close(productos);
    close(ventas);
end;

procedure buscarStockBajo(var productos: archivo_productos);
var
    stockMinimotxt: Text;
    prod: producto;
begin
    //writeln('Ingrese el nombre del archivo de productos (buscarMin): ');
	//readln(nombre_fisico);
    assign(productos,'productos');
	assign(stockMinimotxt,'stock_minimo.txt');
    rewrite(stockMinimotxt);
    reset(productos);
    while not EOF(productos) do begin
        read(productos,prod);
        if (prod.stockMin > prod.stockAct) then begin
			writeln(stockMinimotxt, 'Codigo: ',prod.codProd, ' Nombre: ',prod.nombre, ' Precio: ',prod.precio, ' Stock Actual: ',prod.stockAct, ' Stock Minimo: ',prod.stockMin)
        end;
    end;
    writeln('Archivo TXT creado con exito!');
    close(productos);
    close(stockMinimotxt);
end;

var
    productos: archivo_productos;
    ventas: archivo_ventas;
begin
    modificarProductos(productos,ventas);
    buscarStockBajo(productos);
end.

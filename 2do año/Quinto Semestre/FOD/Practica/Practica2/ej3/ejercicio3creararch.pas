program ejercicio3crear;
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

procedure LeerProductos(var prod: producto);
begin
	writeln('Ingrese el codigo de producto: ');
	readln(prod.codProd);
	if (prod.codProd <> 0) then begin
		writeln('Ingrese el nombre del producto: ');
		readln(prod.nombre);
		writeln('Ingrese el precio del producto: ');
		readln(prod.precio);
		writeln('Ingrese el stock actual del producto: ');
		readln(prod.stockAct);
		writeln('Ingrese el stock minimo del producto: ');
		readln(prod.stockMin);
	end;
end;

procedure LeerVentas(var ven: venta);
begin
    writeln('Ingrese el codigo del producto: ');
    readln(ven.codProd);
    if (ven.codProd <> 0) then begin
        writeln('Ingrese la cantidad vendida: ');
        readln(ven.cantVendido);
    end;
end;

var
    prod: producto;
    ven: venta;
    productos: archivo_productos;
    ventas: archivo_ventas;
    opcion: integer;
    nombre_fisico: string;
    productostxt: Text;
begin
    writeln('Archivo PRODUCTOS (1) / Archivo VENTAS (2) / Crear TXT de productos (3)');
    readln(opcion);
    case opcion of
        1:
        begin
            writeln('Ingrese el nombre del archivo de productos: ');
            readln(nombre_fisico);
            assign(productos,nombre_fisico);
            rewrite(productos);
            LeerProductos(prod);
            while (prod.codProd <> 0) do begin
                write(productos,prod);
                LeerProductos(prod);
            end;
            writeln('Archivo productos creado exitosamente!');
            close(productos);
        end;
        2:
        begin
            writeln('Ingrese el nombre del archivo de ventas: ');
            readln(nombre_fisico);
            assign(ventas,nombre_fisico);
            rewrite(ventas);
            LeerVentas(ven);
            while (ven.codProd <> 0) do begin
                write(ventas,ven);
                LeerVentas(ven);
            end;
            writeln('Archivo ventas creado exitosamente!');
            close(ventas);
        end;
        3:
		begin
			//writeln('Ingrese el nombre del archivo txt nuevo: ');
			//readln(nombre_fisico);
			assign(productostxt,'productos.txt');
			assign(productos,'productos');
			rewrite(productostxt);
			reset(productos);
			while not EOF(productos) do begin
				read(productos,prod);
				writeln(productostxt, 'Codigo: ',prod.codProd, ' Nombre: ',prod.nombre, ' Precio: ',prod.precio, ' Stock Actual: ',prod.stockAct, ' Stock Minimo: ',prod.stockMin)
			end;
			writeln('Archivo txt creado exitosamente!');
			close(productos);
			close(productostxt);
		end;
    end;
end.

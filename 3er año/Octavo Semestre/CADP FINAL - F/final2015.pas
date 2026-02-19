public parcialFinal2015

const
    MAX_PROD = 300;

type
    rango = 1..MAX_PROD;
    
    venta = record
        numProd = rango;
        cantVendida = integer;
        nombre = string;
    end;
    
    precios = array[rango] of real;

    listaVentas = ^nodo;
    nodo = record
        dato: venta;
        sig: listaVentas;
    end;

    ventaTotal = record
        precio = real;
        nommbre = string;
    end;

    precioTotal = array[rango] of ventaTotal;

procedure calcularMinimo(p: preTotal; var menorPrecio: string);
var
    min: integer;
begin
    min:= 99999;
    for i:= 1 to MAX_PROD do
    begin
        if (p[i].precio < min) then
        begin
            min:= p[i].precio;
            menorPrecio:= p[i].nombre;
        end;
    end;
end;

procedure calcularMenor(p: precios; L: listaVentas; var menorPrecio: string);
var
    numTotal: integer;
    actual: integer;
    preTotal: precioTotal;
begin
    numTotal:= 0;
    while (L<>nil) do begin
        actual:= L^.dato.numProd;
        numTotal:= 0;
        while (L<>nil) and (actual:= L^.dato.numProd) do begin
            numTotal:= L^.dato.cantVendida * p[L^.dato.numProd];
            preTotal[L^.dato.numProd].precio:= numTotal + preTotal[L^.dato.numProd].precio;
            preTotal[L^.dato.numProd].nombre:= L^.dato.nombre;
        end;
    end;
    calcularMinimo(numTotal, menorPrecio);
end;

var
    p: precios;
    L: listaVentas;
    menorPrecio: string;
begin
    L:= nil;
    cargarVentas(L);
    cargarPrecios(p);
    calcularMenor(p,L,menorPrecio);
    writeln('El nombre del menor producto es: ', menorPrecio);
end.
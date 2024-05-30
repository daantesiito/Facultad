program ej3;
type
    productos = record
        cod: integer;
        nombre: string;
        descripcion: string;
        stockDisp: integer;
        stockMin: integer;
        precio: real;
    end;

    informacion = record
        cod: integer;
        cantVendida: integer;
    end;

    archMaestro = file of producto;

    archDetalle = file of informacion;

    vecArchDetalle = array [1..30] of archDetalle;

    vecRegDetalle = array [1..30] of informacion;

procedure leer(var archD: archDetalle; var i: informacion);
begin
    if not EOF(archD) then 
        read(archD,i);
    else
        i.cod := valoralto;
end; 

procedure minimo(var vecArchDetalle: vecArchDetalle; min: informacion; var vecRegDetalle: vecRegDetalle);
begin
    posMin:= 0;
    min.cod:= valoralto;
    for i:= 1 to 30 do begin
        if (vecRegDetalle[i].cod <> valoralto) then begin
            if (vecRegDetalle[i].cod < min.cod) then begin
                min = vecRegDetalle[i];
                posMin = i;
            end;
        end;
    end;
    if posMin <> 0 then 
        leer(vecArchDetalle[posMin], vecRegDetalle[posMin]);
end;

procedure actualizar(var vecArchDetalle: vecArchDetalle; var vecRegDetalle: vecRegDetalle; var archM: archMaestro);
var
    min: informacion;
    p: productos;
begin
    reset(archM);
    for i:= 1 to 30 do begin
        assign(vecArchDetalle[i], 'detalle' + i) // asigno todos los detalles
        reset(vecArchDetalle[i]); // abro todos los detalles
    end;
    minimo(vecArchDetalle,min,vecRegDetalle); // busco el minimo para empezar
    while (min.cod <> valoralto) do begin // mientras que el codigo sea diferente al corte
        codActual:= min.cod; // guardo el codigo actual para iterar sobre el mismo codigo
        cantVendida:= 0; // variable para conocer la cantidad de ventas de cada producto
        while (codActual == min.cod) do begin // mientras que el codigo actual sea el mismo que se esta buscando
            cantVendida += min.cantVendida; // sumo las ventas
            minimo(vecArchDetalle,min,vecRegDetalle); // llamo al siguiente minimo
        end;
        read(archM,p); // leo el archivo maestro
        while (p.cod <> codActual) do 
            read(archM,p); // mientras que el codigo no sea el que tengo que actualizar que lea el archivo
        seek(archM, filePos(archM)-1); // vuelvo una posicion ya que el read te deja el puntero mirando para el siguiente
        p.stockDisp:= p.stockDisp - cantVendida; // modifico el stock 
        write(archM,p); // escribo el stock modificado
    end;
    close(archM); // cierro el maestro
    for i:= 1 to 30 do begin
        close(vecArchDetalle[i]); // cierro todos los detalles
    end;
end;

procedure pasar_a_txt(var archM: archMaestro; var archTxt: Text);
var
    p: productos;
begin
    reset(archM);
    rewrite(archTxt);
    while not EOF(archM) do begin
        read(archM,p);
        if (p.stockDisp < p.stockMin) then 
            writeln(archTxt, p.nombre, p.descripcion, p.stockDisp, p.precio);
    end;
    close(archM); // cierro el maestro
    close(archTxt); // cierro txt
end;
var
    vecArchDetalle: vecArchDetalle;
    vecRegDetalle: vecRegDetalle;
    archMaestro: archMaestro;
    archTxt: Text;
begin
    assign(archMaestro,'archivo_maestro');
    assign(archTxt,'maestro.txt');
    actualizar(vecArchDetalle,vecRegDetalle,archMaestro);
    pasar_a_txt(archM,archTxt);
end;
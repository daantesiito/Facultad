{Una cadena de tiendas de indumentaria posee un archivo maestro no ordenado con
la información correspondiente a las prendas que se encuentran a la venta. De cada
prenda se registra: cod_prenda, descripción, colores, tipo_prenda, stock y
precio_unitario. Ante un eventual cambio de temporada, se deben actualizar las
prendas a la venta. Para ello reciben un archivo conteniendo: cod_prenda de las
prendas que quedarán obsoletas. Deberá implementar un procedimiento que reciba
ambos archivos y realice la baja lógica de las prendas, para ello deberá modificar el
stock de la prenda correspondiente a valor negativo.
Adicionalmente, deberá implementar otro procedimiento que se encargue de
efectivizar las bajas lógicas que se realizaron sobre el archivo maestro con la
información de las prendas a la venta. Para ello se deberá utilizar una estructura
auxiliar (esto es, un archivo nuevo), en el cual se copien únicamente aquellas prendas
que no están marcadas como borradas. Al finalizar este proceso de compactación
del archivo, se deberá renombrar el archivo nuevo con el nombre del archivo maestro
original}

program ejercicio6;
type
    prenda = record
        cod_prenda: integer;
        descripción: string;
        colores: string;
        tipo_prenda: string;
        stock: integer;
        precio_unitario: integer;
    end;

    archivo = file of prenda;

procedure leer(var arch: archivo, var p: prenda);
begin
    if not EOF(arch) then
        read(arch,p);
    else
        p.cod_prenda:= valoralto;
end;

procedure eliminar(var archM: archivo; cod: integer);
var
    p: prenda;
begin
    reset(archM);
    leer(archM,p);
    while p.cod_prenda <> cod do begin
        leer(archM,p);
    end;
    seek(archM, filePos(archM)-1);
    p.stock:= p.stock * (-1);
    write(archM,p);
    close(archM);
end;

procedure actualizarMaestro(var archM: archivo; var archD: archivo);
var
    p: prenda;
begin
    reset(archD);
    leer(archD,p);
    while (p.cod_prenda <> valoralto) do begin
        eliminar(archM,p.cod_prenda)
        leerM(archM,p);
    end;
    close(archD);
end;

var
    archM, archD: archivo;
begin
    assign(archM, 'maestro');
    assign(archD, 'detalle');
    actualizarMaestro(archM,archD);
end.
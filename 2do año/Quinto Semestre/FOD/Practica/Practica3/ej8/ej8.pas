program ejercicio8;
const
    valoralto = 'zzzz';
type
    distribucion = record
        nombre: string;
        año: integer;
        version: integer;
        cantDes: integer;
        descripcion: integer;
    end;

    archDistribucion = file of distribution;

procedure leer(var archD: archDistribucion; var d: distribucion);
begin
    if not EOF(archD) then
        read(archD,d);
    else
        d.nombre:= valoralto;
end;

function existeDistribucion(nombreBuscar: string; var archD: archDistribucion): boolean;
var
    d: distribucion;
begin
    ExisteDistribucion:= False;
    reset(archD);
    leer(archD,d);
    while (d.nombre <> valoralto) and (not ExisteDistribucion) do begin 
        if (d.nombre == nombreBuscar) then
            ExisteDistribucion:= True;
        leer(archD,d);
    end;
    close(archD);
end;

procedure nuevaDistribucion(var d: distribucion);
begin
    readln(d.nombre);
    readln(d.año);
    readln(d.version);
    readln(d.cantDes);
    readln(d.descripcion);
end;

procedure AltaDistribucion(var archD: archDistribucion);
var
    d,nd,indice: distribucion;
begin
    nuevaDistribucion(nd);
    if existeDistribucion(nd.nombre,archD) then begin
        reset(archD);
        leer(archD,d);
        if (d.cantDes < 0) then begin
            seek(archD,abs(d.cantDes)); // voy a la posicion con espacio libre
            read(archD,indice); // leo el registro que habia y lo guardo en indice
            seek(archD,filepos(archD)-1); // vuelvo una posicion atras ya que lei
            write(archD,nd); // escribo el nuevo registro en la posicion que habia libre
            seek(archD,0); // voy a la posicion 0
            write(archD,indice); // escribo el registro indice que tenia en la posicion que di de alta
        end;
        else
            writeln('No hay posiciones libres!');
        close(archD);
    end;
    else
        writeln('La distribucion: ', nd.nombre, ' ya existe!');
end;

procedure BajaDistribucion(var archD: archDistribucion);
var
    d: distribucion;
    deleteNombre: string;
    ok: boolean;
begin
    writeln('Ingrese el nombre de la distribucion a eliminar: ');
    readln(deleteNombre);
    if existeDistribucion(deleteDist, archD) then begin
        reset(archD);
        leer(archD,indice);
        leer(archD,d);
        while (d.nombre <> valoralto) and not (ok) do begin
            if (deleteNombre = d.nombre) then begin
                ok:= True; // Se encontro el nombre a eliminar
                d.cantDes:= indice.cantDes; // Guardo el valor de posicion del indice en el valor de posicion del registro 
                seek(filepos(archD)-1); // Vuelvo uno atras ya que quedo apuntando hacia adelante por el leer
                indice.cantDes:= filepos(archD) * (-1); // pasamos el valor de posicion que habia en el lugar a eliminar, a negativo para poner en el indice
                write(archD,d); // escribo el registro indice, en la posicion a eliminar para dejar el espacio vacio y reutilizar
                seek(archD,0); // vuelvo al inicio
                write(archD,indice); // escribo el valor de posicion negativa del lugar donde hay un espacio libre.
            end;
            else    
                leer(archD,d);
        end;
        close(archD);
        writeln('Distribucion eliminada.');
    end;
    else
        writeln('No existe la distribucion.');
end;

var
    archD: archDistribucion;
begin
    assign(archD,'distribuciones');
    AltaDistribucion(archD);
    BajaDistribucion(archD);
end.
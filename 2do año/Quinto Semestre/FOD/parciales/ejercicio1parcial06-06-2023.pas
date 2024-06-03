program ej;
const
    valoralto = 9999;
type
    productos = record
        cod: integer;
        nombre: string;
        descripcion: string;
        pcompra: integer;
        pventa: integer;
        ubicacion: string;
    end;

    archProductos = file of productos;

procedure leer(var archP: archProductos; var p: productos);
begin
    if not EOF(archP) then
        read(archP,p);
    else
        p.cod:= valoralto;
end;

procedure crearProducto(var np: productos);
begin
    readln(np.cod);
    readln(np.nombre);
    readln(np.descripcion);
    readln(np.pcompra);
    readln(np.pventa);
    readln(np.ubicacion);
end;

procedure AgregarProducto(var archP: archProductos);
var
    p,np,indice: productos;
begin
    crearProducto(np);
    if existeProducto(np.cod, archP) then begin
        reset(archP);
        leer(archP,p);
        if (p.cod < 0) then begin
            seek(archP,abs(np.cod));
            read(archP,indice);
            seek(archP,filepos(archP)-1);
            write(archP,np);
            seek(archP,0);
            write(archP,indice);
        end;
        else
            writeln('No hay espacio disponible.');
        close(archP);
    end;
    else
        writeln('No existe el producto.');
end;

procedure QuitarProducto(var archP: archProductos);
var
    p,indice: producto
    deleteCod: integer;
    ok: boolean;
begin
    writeln('Ingrese el codigo del producto a eliminar: ');
    readln(deleteCod);
    leer(archP,indice);
    leer(archP,p);
    if (existeProducto(deleteCod,archP)) then begin
        reset(archP);
        while (p.cod <> valoralto) do begin
            if (p.cod = deleteCod) then begin
                ok:= true;
                p.cod:= indice.cod;
                seek(archP,filepos(archP)-1);
                indice.cod:= filepos(archD) * -1;
                write(archP,p);
                seek(archP,0);
                write(archP,indice);
            end;
            else
                leer(archP,p);
        end;
        close(archP);
        writeln('Producto eliminado.');
    end;
    else
        writeln('No existe el producto.');
end;

var
    archP: archProductos;

begin
    assign(archP,'productos');
    AgregarProducto(archP);
    QuitarProducto(archP);
end.
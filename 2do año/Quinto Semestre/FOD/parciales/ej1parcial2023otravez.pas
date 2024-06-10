program ej;
const
    valoralto = 9999;
type
    producto = record
        cod: integer;
        nombre: string;
        descripcion: string;
        precioCompra: real;
        precioVenta: real;
        ubicacion: string;
    end;

    archProductos = file of producto;

procedure leer(var archP: archProductos; var p: producto);
begin
    if not EOF(archP) then
        read(archP,p);
    else
        p.cod:= valoralto;
end;

procedure crearProducto(var np: producto);
begin
    readln(np.cod);
    readln(np.nombre);
    readln(np.descripcion);
    readln(np.precioCompra);
    readln(np.precioVenta);
    readln(np.ubicacion);
end;

procedure agregarProducto(var archP: archProducto);
begin
    crearProducto(np);
    if not existeProducto(np.cod,archP) then begin
        reset(archP);
        leer(archP,p);
        if (p.cod < 0) then begin
            seek(archP,abs(np.cod));
            read(archP,indice);
            seek(archP,filepos(archP)-1);
            write(archP,nd);
            seek(archP,0);
            write(archP,indice);
        end;
        else
            writeln('No hay posiciones libres!');
        close(archP);
    end;
    else
        writeln('El producto ya existe!');
end;

procedure agregarProducto(var archP: archProductos);
begin
    crearProducto(np);
    if not existeProducto(np.cod, archP) then begin
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
            writeln('No hay espacio libre.');
        close(archP);
    end;
    else
        writeln('Producto existente.');
end;

procedure altaLogica(var archP: archProductos);
var
    p,np,indice: producto;
begin
    crearProducto(np);
    if not existeProducto(np.cod, archP) then begin
        reset(archP);
        leer(archP,p);
        if p.cod < 0 then begin
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
        writeln('Ya existe el producto.');
end;

procedure altaLogica(var archP: archProducto);
var
    p,np,indice: producto;
begin
    crearProducto(np);
    if not existeProducto(np.cod, archP) then begin
        reset(archP);
        leer(archP,p);
        if np.cod < 0 then begin
            seek(archP,abs(np.cod));
            read(archP,indice);
            seek(archP,filepos(archP)-1);
            write(archP,np);
            seek(archP,0);
            write(archP,indice);
        end;
        close(archP);
    end;
end;

procedure altaLogica(var archP: archProducto);
var
    p,np,indice: producto;
begin
    crearProducto(np);
    if not existeProducto(np.cod, archP) then begin
        reset(archP);
        leer(archP,p)l
        if p.cod < 0 then begin
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
        writeln('Producto ya existente.');
end;

procedure bajaLogica(var archP: archProducto);
begin
    readln(codEliminar);
    if existeProducto(codEliminar, archP) then begin
        reset(archP);
        leer(archP,indice);
        leer(archP,p);
        while (p.cod <> valoralto) and not (ok) do begin
            if (p.cod = codEliminar) then begin
                ok:= true;
                p.cod:= indice.cod;
                seek(archP,filepos(archP)-1);
                indice.cod:= filepos(archP) * (-1);
                write(archP,p);
                seek(archP,0);
                write(archP,indice);
            end;
            else
                leer(archP,p);
        end;    
    end;
end;

procedure bajaLogica(var archP: archProducto);
begin
    readln(codEliminar);
    if existeProducto(codEliminar, archP) then begin
        reset(archP);
        leer(archP,indice);
        leer(archP,p);
        while (p.cod <> valoralto) and not (ok) do begin
            if codEliminar = p.cod then begin
                ok:= true;
                p.cod:= indice.cod;
                seek(archP,filepos(archP)-1);
                indice.cod:= filepos(archP) * (-1);
                write(archP,p);
                seek(archP,0);
                write(archP,indice);
            end;
            else
                leer(archP,p);
        end;
    end;
end;

program altaLogica(var archP: archProducto);
var
    p,np,indice: producto;
begin
    crearProducto(np);
    if not existeProducto(np.cod,archP) then begin
        reset(archP);
        leer(archP,p);
        if p.cod < 0 then begin
            seek(archP,abs(np.cod));
            read(archP,indice);
            seek(archP,filepos(archP)-1);
            write(archP,np);
            seek(archP,0);
            write(archP,indice);
        end;
        else
            seek(archP,filesize(archP));
            write(archp,np);
        close(archP);
    end;
    else
        writeln('Existe el producto.');
end;

procedure bajaLofica(var archP: archProductos);
begin
    readln(codEliminar);
    if existeProducto(codEliminar,archP) then begin
        reset(archP);
        leer(archP,indice);
        leer(archP,p);
        while (p.cod <> valoralto) and not (ok) do begin
            if (codEliminar = p.cod) then begin
                ok:= true;
                p.cod:= indice.cod;
                seek(archP,filepos(archP)-1);
                indice.cod:= filepos(archP) * (-1);
                write(archP,p);
                seek(archP,0);
                write(archP,indice);
            end;
            else
                leer(archP,p);
        end;
    end;
end;

procedure minimo(var VecArchProductos: VecArchProductos; min: producto; var VecRegProductos: VecRegProductos);
var
    i,posMin: integer;
begin
    posMin:= 0;
    min.cod:= valoralto;
    for i:= 1 to 30 do begin
        if (VecRegProductos[i].cod <> valoralto) then begin
            if (VecRegProductos[i].cod < min.cod) then begin
                min:= VecRegProductos[i];
                posMin:= i;
            end;
        end;
    end;
    if (posMin <> 0) then 
        leer(VecArchProductos[i],VecRegProductos[i]);
end;


procedure altaLogica(var archP: archProducto);
var
    p,np,indice: producto;
begin
    crearProducto(np);
    if not existeProducto(np.cod, archP) then begin
        reset(archP);
        leer(archP,p);
        if p.cod < 0 then begin
            seek(archP,abs(np.cod));
            read(archP,indice);
            seek(archP,filepos(archP)-1);
            write(archP,np);
            seek(archP,0);
            write(archP,indice);
        end;
        else
            writeln('No hay lugar disponible.');
        close(archP);
    end;
    else
        writeln('Producto ya existente.');
end;

procedure bajaLogica(var archP: archProducto);
var
    p,indice: producto;
    codEliminar: integer;
    ok: boolean;
begin
    ok:= False;
    readln(codEliminar);
    if existeProducto(codEliminar,archP) then begin
        reset(archP);
        leer(archP,indice);
        leer(archP,p);
        while (p.cod <> valoralto) and not (ok) do begin
            if (codEliminar = p.cod) then begin
                ok:= true;
                p.cod:= indice.cod;
                seek(archP,filepos(archP)-1);
                indice.cod:= filepos(archP) * (-1);
                write(archP,p);
                seek(archP,0);
                write(archP,indice);
            end;
            else
                leer(archP,p);
        end;
        close(archP);
    end;
end;

procedure bajaFisica(var archP: archProducto);
begin
    readln(codEliminar);
    if existeProducto(codEliminar,archP) then begin
        reset(archP);
        rewrite(archP2);
        leer(archP,indice);
        leer(archP,p);
        while (filepos(archP) <> filesize(archP)-1) do begin
            if (codEliminar = p.cod) then begin
                pos:= filepos(archP);
                seek(archP,filesize(archP));
                read(archP,ultimo);
                seek(archP,filepos(archP)-1);
                seek(archP,pos);
                write(archP,ultimo);
            end;
            else
                write(archP2,p);
                leer(archP,p);
        end;
    end;
end;

procedure bajaFisica(var archP: archProducto);
begin
    readln(codEliminar);
    if existeProducto(codEliminar,archP) then begin
        reset(archP);
        rewrite(archP2);
        leer(archP,indice);
        leer(archP,p);
        while (p.cod <> codEliminar) do begin
            write(archP2,p);
            leer(archP,p)
        end;
        leer(archP,p);
        while (p.cod <> valoralto) do begin
            write(archP2,p);
            leer(archP,p);
        end;
    end;
end;
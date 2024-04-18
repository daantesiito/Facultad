program ejercicio3;
const
    valoralto = 9999;
type
    novela = record
        codigo: integer;
        genero: string;
        nombre: string;
        duracion: integer;
        director: string;
        precio: integer;
    end;

    archivoNovelas = file of novela;

procedure leer(var arch: archivoNovelas; var n: novela);
begin
    if not EOF(arch);
        read(arch,n);
    else
        n.codigo:= valoralto;
end;

procedure leerNovelas(var n: novela);
begin
    with n do begin
        readln(codigo);
        if (codigo <> -1) then begin
            readln(genero);
            readln(nombre);
            readln(duracion);
            readln(director);
            readln(precio);
        end;
    end;
end;

procedure armarArchivo(var arch: archivoNovelas);
var
    n: novela;
begin
    rewrite(arch);
    n.codigo:= 0;
    write(arch,n);
    leer(arch,n);
    while (n.codigo <> valoralto) do begin
        write(arch,n);
        leer(arch,n);
    end;
    close(arch);
end;

var
    arch: archivoNovelas;
    n: novela;
begin
    assign(arch,'novelas');
    armarArchivo(arch); // inciso a.
    
end.
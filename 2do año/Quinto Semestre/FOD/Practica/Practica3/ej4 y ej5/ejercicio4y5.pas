program ejercicio4;
const
    valoralto = 9999;
type
    flor = record
        nombre: String[45];
        codigo:integer;
    end;

    archivoFlores = file of flor;

procedure leerFlores(var f: flor);
begin
    writeln('Ingrese el codigo de la flor: ');
    readln(f.codigo);
    if (f.codigo <> valoralto) then begin
        writeln('Ingrese el nombre de la flor: ');
        readln(f.nombre);
end;

procedure leer(var arch: archivoFlores; var f: flor);
begin
    if not EOF(arch) then
        read(arch,f);
    else
        f.codigo:= valoralto;
end;

procedure crearArchivo(var arch: archivoFlores; var f: flor);
begin
    rewrite(arch);
    f.codigo:= 0;
    f.nombre:= 'Cabecera';
    write(arch,f);
    leerFlores(arch,f);
    while (f.codigo <> valoralto) do begin write
        write(arch,f);
        leerFlores(arch,f);
    end;
    close(arch);
end;

procedure agregarFlor (var arch: archivoFlores; var f: flor; nombre: string; codigo:integer);
begin
    reset(arch);
    read(arch,f);
    if (f.codigo < 0) then begin
        pos:= f.codigo * (-1);
        seek(arch,pos);
        read(arch,indice);
        seek(arch,filePos(arch)-1);
        f.nombre:= nombre;
        f.codigo:= codigo;
        write(arch,f);
        seek(arch,0);
        write(arch,indice);
    end
    else
        writeln('No hay espacio libre.');
    close(arch);
end;

procedure eliminarFlor(var arch: archivoFlores; var f: flor; codigo:integer);
var
    indice: flor;
    ok: boolean;
begin
    ok:= False;
    reset(arch);
    leer(arch,indice);
    leer(arch,f);
    while (f.codigo <> valoralto) or not (ok) do begin
        while (f.codigo <> codigo) do begin
            leer(arch,f);
        ok:= True;
        f.codigo:= indice.codigo
        seek(arch, filePos(arch)-1);
        indice.codigo:= filePos(arch) * (-1);
        write(arch,f);
        seek(arch,0);
        write(arch,indice);
        end;
    end;
    if (ok) then 
		writeln ('FLOR ELIMINADA')
	else
		writeln ('NO SE ENCONTRO FLOR');
    close(arch);
end;

procedure imprimir(var arch:archivoFlores);
var
	f: flor;
begin
	reset(arch);
	seek(arch,1);
	leer(arch,f);
	while (f.codigo <> valorAlto) do begin
        if (f.codigo > 0) then begin
            writeln('Codigo: ', f.codigo);
            writeln('Nombre: ', f.nombre);
		    leer(arch,f);
        end;
	end;
	close(arch);
end;

var
    arch: archivoFlores;
    codigo: integer;
    nombre: string;
    f: flor;
begin
    assign(arch,'flores');

    crearArchivo(arch,f);

    writeln ('AGREGAR');
	writeln('INGRESE CODIGO: ');
    readln(codigo);
	writeln('INGRESE NOMBRE: ');
    readln (nombre);
	writeln (' ');

    agregarFlor(arch,f,nombre,codigo);

	writeln (' ');

    writeln ('ELIMINAR');
	writeln('INGRESE CODIGO: ');
    readln(codigo);

    eliminarFlor(arch,f,nombre,codigo);

	writeln (' ');

    imprimir(arch);
end.
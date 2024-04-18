program ejercicio2;
const
    valoralto = 9999;
type
    asistentes = record
        nro: integer;
        nYa: string;
        email: string;
        numero: integer;
        dni: integer;
    end;

    archivoAsistentes = file of asistentes;

procedure leer(var arch: archivoAsistentes; var a: asistentes);
begin
    if not EOF(arch) then 
        read(arch,a)
    else
        a.nro:= valoralto;
end;

procedure leerAsistentes(var a: asistentes);
begin
    writeln('Ingrese su numero de asistente: ');
    readln(a.nro);
    if (a.nro <> 0) then begin
        writeln('Ingrese su nombre y apellido: ');
        readln(a.nYa);
        writeln('Ingrese su email: ');
        readln(a.email);
        writeln('Ingrese su numero de telefono: ');
        readln(a.numero);
        writeln('Ingrese su DNI: ');
        readln(a.dni);
    end;
end;

procedure armarArchivo(var arch: archivoAsistentes);
var
    a: asistentes;
begin
    rewrite(arch);
    leerAsistentes(a);
    while (a.nro <> 0) do begin
        write(arch,a);
        leerAsistentes(a);
    end;
    writeln('archivo creado');
    close(arch);
end;

procedure eliminarAsistentes(var arch: archivoAsistentes; var a: asistentes);
begin
    reset(arch);
    leer(arch,a);
    while (a.nro <> valoralto) do begin
        if (a.nro < 1000) then begin
            a.nYa:= '@Eliminado';
            seek(arch,filePos(arch)-1);
            write(arch,a);
            writeln('asistente eliminado!');
        end;
        leer(arch,a);
    end;
    writeln('Archivo modificado');
    close(arch);
end;

procedure imprimir(a:asistentes);
begin
	if (a.nYa <> '@Eliminado') then begin
		writeln ('NRO: ',a.nro,' APELLIDO Y NOMBRE: ',a.nYa,' MAIL: ',a.email,' TELEFONO: ',a.numero,' DNI: ',a.dni);
		writeln ('');
	end;
end;

procedure mostrarArchivo(var arch:archivoAsistentes);
var
    a:asistentes;
begin
	reset (arch);
	while not eof (arch) do begin
		read (arch,a);
		imprimir(a);
	end;
	close (arch);
end;

var
    arch: archivoAsistentes;
    a: asistentes;
begin
    assign(arch,'asistentes');
    //armarArchivo(arch);
    eliminarAsistentes(arch,a);
    mostrarArchivo(arch);
end.

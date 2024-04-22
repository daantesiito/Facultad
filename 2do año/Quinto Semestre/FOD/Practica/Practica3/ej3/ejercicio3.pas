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
    if not EOF(arch) then
        read(arch,n)
    else
        n.codigo:= valoralto;
end;

procedure leerNovelas(var n: novela);
begin
    with n do begin
        writeln('Ingrese el codigo de la novela: ');
        readln(codigo);
        if (codigo <> valoralto) then begin
            writeln('Ingrese el genero de la novela: ');
            readln(genero);
            writeln('Ingrese el nombre de la novela: ');
            readln(nombre);
            writeln('Ingrese la duracion de la novela: ');
            readln(duracion);
            writeln('Ingrese el director de la novela: ');
            readln(director);
            writeln('Ingrese el precio de la novela: ');
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
    n.genero:= 'x';
    n.nombre:= 'x';
    n.duracion:= 0;
    n.director:= 'x';
    n.precio:= 0;
    write(arch,n);
    leerNovelas(n);
    while (n.codigo <> valoralto) do begin
        write(arch,n);
        leerNovelas(n);
    end;
    close(arch);
end;

procedure agregarNovela(var arch: archivoNovelas; var n: novela);
var
	pos: integer;
	indice: novela;
begin
    reset(arch);
    leer(arch,n);
    while (n.codigo <> valoralto) do begin
        if (n.codigo < 0) then begin
            pos:= n.codigo * (-1);
            seek(arch,pos);
            read(arch,indice);
            seek(arch,filePos(arch)-1);
            leerNovelas(n);
            write(arch,n);
            seek(arch,0);
            write(arch,indice);
        end
        else
            leer(arch,n);
    end;
    close(arch);
end;

procedure modificacion(var n: novela);
var
    opcion: integer;
begin
    writeln('------------------------------');
    writeln('-Ingrese num para modificar: -');
    writeln('------------------------------');
    writeln('-1. GENERO                   -');
    writeln('-2. NOMBRE                   -');
    writeln('-3. DURACION                 -');
    writeln('-4. DIRECTOR                 -');
    writeln('-5. PRECIO                   -');
    writeln('------------------------------');
    readln(opcion);
    case opcion of
        1:
        begin
            writeln('Ingrese el genero de la novela: ');
            readln(n.genero);
        end;
        2:
        begin
            writeln('Ingrese el nombre de la novela: ');
            readln(n.nombre);
        end;
        3:
        begin
            writeln('Ingrese la duracion de la novela: ');
            readln(n.duracion);
        end;
        4:
        begin
            writeln('Ingrese el director de la novela: ');
            readln(n.director);
        end;
        5:
        begin
            writeln('Ingrese el precio de la novela: ');
            readln(n.precio);
        end;
    end;
end;

procedure modificarNovela(var arch: archivoNovelas; var n: novela);
var
	ok: boolean;
	modificar: integer;
begin
    ok:= False;
    writeln('Ingrese el codigo de la novela a modificar: ');
    readln(modificar);
    reset(arch);
    leer(arch,n);
    while (n.codigo <> valoralto) or not (ok) do begin
        while (n.codigo <> modificar) do begin
            leer(arch,n);
        ok:= True;
        modificacion(n);
        seek(arch, filePos(arch)-1);
        write(arch,n);
        end;
    end;
    if (ok) then 
		writeln ('NOVELA MODIFICADA CON EXITO')
	else
		writeln ('NO SE ENCONTRO NOVELA');
    close(arch);
end;

procedure borrarNovelaConCodigo(var arch: archivoNovelas; var n: novela);
var
    borrar: integer;
    ok: boolean;
    indice: novela;
begin
    ok:= False;
    writeln('Ingrese el codigo de novela a borrar: ');
    readln(borrar);
    reset(arch);
    leer(arch,indice);
    leer(arch,n);
    while (n.codigo <> valoralto) or not (ok) do begin
        while (n.codigo <> borrar) do
			writeln('a');
            leer(arch,n);
        ok:= True;
        n.codigo:= indice.codigo;
        seek(arch, filePos(arch)-1);
        indice.codigo:= filePos(arch) * (-1);
        write(arch,n);
        seek(arch,0);
        write(arch,indice);
    end;
    if (ok) then 
		writeln ('NOVELA BORRADA CON EXITO')
	else
		writeln ('NO SE ENCONTRO NOVELA');
    close(arch);
end;

procedure pasarATXT(var arch: archivoNovela; var n: novela);
var
	novelastxt: Text;
begin	
	assign(novelastxt,'novelas.txt');
	assign(novelas,'novelas');
	rewrite(novelastxt);
	reset(novelas);
	while not EOF(novelas) do begin
		read(novelas,n);
		writeln(novelastxt, 'Codigo: ',n.codigo, ' Genero: ',n.genero, ' Nombre: ',n.nombre, ' Duracion: ',n.duracion, ' Director: ',n.director, ' Precio: ', n.precio);
	end;
	writeln('Archivo txt creado exitosamente!');
	close(novelas);
	close(novelastxt);
end.


var
    arch: archivoNovelas;
    n: novela;
    opcion: integer;
begin
	while True do begin
		assign(arch,'novelas');
		writeln('------------------------------');
		writeln('-Ingrese una opcion:         -');
		writeln('------------------------------');
		writeln('-1. Armar Archivo            -');
		writeln('-2. Agregar Novela           -');
		writeln('-3. Modificar Novela         -');
		writeln('-4. Borrar Novela por codigo -');
        writeln('-5. Pasar a TXT              -');
		writeln('-6. Salir                    -');
		writeln('------------------------------');
		readln(opcion);
		case opcion of
			1:
			begin
				armarArchivo(arch); // inciso a.
			end;
			2:
			begin
				agregarNovela(arch,n); // inciso b.i
			end;
			3:
			begin
				modificarNovela(arch,n); // inciso b.ii
			end;
			4:
			begin
				borrarNovelaConCodigo(arch,n); // inciso b.iii
			end;
            5:
			begin
				pasarATXT(arch,n); // inciso c
			end; 
			6:
			begin
				break;
			end; 
		end;
    end;
end.

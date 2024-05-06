{Se cuenta con un archivo que almacena información sobre especies de aves en vía
de extinción, para ello se almacena: código, nombre de la especie, familia de ave,
descripción y zona geográfica. El archivo no está ordenado por ningún criterio. Realice
un programa que elimine especies de aves, para ello se recibe por teclado las
especies a eliminar. Deberá realizar todas las declaraciones necesarias, implementar
todos los procedimientos que requiera y una alternativa para borrar los registros. Para
ello deberá implementar dos procedimientos, uno que marque los registros a borrar y
posteriormente otro procedimiento que compacte el archivo, quitando los registros
marcados. Para quitar los registros se deberá copiar el último registro del archivo en la
posición del registro a borrar y luego eliminar del archivo el último registro de forma tal
de evitar registros duplicados.
Nota: Las bajas deben finalizar al recibir el código 500000}

program ejercicio7;
const
    valoralto = 9999;
type
    ave = record
        codigo: integer;
        nombre: string;
        familia: string;
        descripcion: string;
        zona: string;
    end;

    archivo = file of ave;

procedure leer(var arch: archivo; var a: ave);
begin
    if not EOF(arch) then
        read(arch,a);
    else
        a.codigo:= valoralto;
end;

procedure eliminar(var archM: archivo; cod: integer);
var
    ok: boolean;
    a: ave;
begin
    reset(archM);
    ok:= false;
    leer(archM,a);
    while (a.codigo <> valoralto) and not (ok) do begin
        if (a.codigo <> cod) then
            leer(archM,a);
        else begin
            seek(archM, filePos(archM)-1);
            a.nombre:= '@ELIMINADO';
            write(archM,a);
            ok:= true;
        end;
    end;
    if (ok) then 
		writeln ('AVE ELIMINADA')
	else
		writeln ('NO SE ENCONTRO AVE');
    close(archM)
end;

{Para quitar los registros se deberá copiar el último registro del archivo en la
posición del registro a borrar y luego eliminar del archivo el último registro de forma tal
de evitar registros duplicados.}

procedure compactar(var archM: archivo);
begin
    reset(archM);
    leer(archM,a);
    while (a.codigo <> valoralto) do begin
        if a.nombre == '@ELIMINADO' then begin
            pos:= filePos(archM)-1;
            seek(archM, fileSize(archM));
            leer(archM,a);
            seek(archM,pos);
            write(archM,a);
            seek(archM, fileSize(archM));
            truncate(archM);
        end;
        leer(archM,a);
    end;
    close(archM);
end;

procedure baja(var archM: archivo);
var
    codEliminar: integer;
begin
    writeln('Ingrese el codigo de un ave a eliminar: ');
    readln(codEliminar);
    while (codEliminar <> 500000) do begin
        eliminar(archM,codEliminar);
        writeln('Ingrese el codigo de un ave a eliminar: ');
        readln(codEliminar);
    end;
    compactar(archM);
end;

var
    archM: archivo;
begin
    assign(archM, 'maestro');
    baja(archM);
end.
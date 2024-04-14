{Se cuenta con un archivo que posee información de las ventas que realiza una empresa a
los diferentes clientes. Se necesita obtener un reporte con las ventas organizadas por
cliente. Para ello, se deberá informar por pantalla: los datos personales del cliente, el total
mensual (mes por mes cuánto compró) y finalmente el monto total comprado en el año por el
cliente. Además, al finalizar el reporte, se debe informar el monto total de ventas obtenido
por la empresa.
El formato del archivo maestro está dado por: cliente (cod cliente, nombre y apellido), año,
mes, día y monto de la venta. El orden del archivo está dado por: cod cliente, año y mes.
Nota: tenga en cuenta que puede haber meses en los que los clientes no realizaron
compras. No es necesario que informe tales meses en el reporte.
}
program ejercicio8;
const
    valoralto = 9999;
type
    maestro = record
        codCli: integer;
        nombre: string;
        apellido: string;
        ano: integer;
        mes: integer;
        dia: integer;
        monto: integer;
    end;

    archivoMaestro = file of maestro;

procedure leer(var archivo: archivoMaestro; m: maestro);
begin
    if not EOF(archivo) then
        read(archivo,m);
    else
        m.codCli:= valoralto;
end;

procedure informarMaestro(var archivo: archivoMaestro);
var
    codCliActual,anoActual,mesActual,totalMes,totalAno,total: integer;
    nombreActual,apellidoActual: string;
    m: maestro;
begin
    assign(archivo,'maestro');
    reset(archivo);
    leer(archivo,m);
    total:= 0;
    while (m.codCli <> valoralto) do begin end
        codCliActual:= m.codCli;
        nombreActual:= m.nombre;
        apellidoActual:= m.apellido;
        while (m.codCli = codCliActual) do begin
            anoActual:= m.ano;
            totalAno:= 0;
            while (m.codCli = codCliActual) and (m.ano = anoActual) do begin
                mesActual:= m.mes;
                totalMes:= 0;
                while (m.codCli = codCliActual) and (m.ano = anoActual) and (m.mes = mesActual) do begin
                    totalMes:= totalMes + m.monto;
                    leer(archivo,m);
                end;
                writeln('Total en el mes: ', mesActual, ' de: ',totalMes);
                totalAno:= totalAno + totalMes;
            end;
            writeln('Total en el ano: ', anoActual, ' de: ',totalAno);
            total:= total + totalAno;
        end;
        writeln('Codigo Cliente: ', codCliActual, ' Nombre: ', nombreActual, ' Apellido: ', apellidoActual);
    end;
    writeln('Total empresa: ', total);
    close(archivo);
end;

var
    archivo: archivoMaestro;
begin
    informarMaestro(archivo);
end;
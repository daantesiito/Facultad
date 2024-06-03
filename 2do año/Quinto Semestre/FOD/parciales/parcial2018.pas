program ej;
const
    valoralto = 9999;
type
    informacion = record
        ano: integer;
        mes: integer;
        dia: integer;
        idUsuario: integer;
        tiempo: integer;
    end;

    archInformacion = file of informacion;

procedure leer(var archI: archInformacion; var i: informacion);
begin
    if not EOF(archI) then
        read(archI,i);
    else
        i.ano:= valoralto;
end;

procedure informar(var archI: archInformacion);
var
    i: informacion;
begin
    reset(archI);
    leer(archI,i);
    while (i.ano <> valoralto) do begin
        anoActual:= i.ano;
        writeln('Año: ', anoActual);
        while (i.ano <> valoralto) and (anoActual = i.ano) do begin
            mesActual:= i.mes;
            writeln('Mes: ', mesActual);
            while (i.ano <> valoralto) and (anoActual = i.ano) and (mesActual = i.mes) do begin
                diaActual:= i.dia;
                writeln('Dia: ', diaActual);
                while (i.ano <> valoralto) and (anoActual = i.ano) and (mesActual = i.mes) and (diaActual = i.dia) do begin
                    writeln('Id Usuario: ', i.idUsuario);
                    writeln('Tiempo total de acceso en el dia: ', diaActual, ' mes: 'mesActual, ' de: ', i.tiempo);
                    tiempoDia:= tiempoDia + i.tiempo;
                    leer(archI,i);
                end;
                writeln('Tiempo total acceso: ', tiempoDia, ' dia: ', diaActual, ' mes: ', mesActual);
                tiempoMes:= tiempoMes + tiempoDia;
            end;
            writeln('Tiempo total acceso: ', tiempoMes, ' mes: ', mesActual);
        end;
    end;
    close(archI);
end;
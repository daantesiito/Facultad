program ejercicio17;
type
    maestro = record
        codLocalidad: integer;
        nombreLocalidad: string;
        codMunicipio: integer;
        nombreMunicipio: string;
        codHospital: integer;
        nombreHospital: string;
        fecha: string;
        casosPositivos: integer;
    end;

    archivoMaestro = file of maestro;

procedure leer(var archivo: archivoMaestro; var m: maestro);
begin
    if not EOF(archivo) then
        read(archivo,m);
    else
        m.codLocalidad = valoralto;
end;

procedure informarMaestro(var archivo: archivoMaestro);
var
    m: maestro;
    archivoTexto: Text;
    locActual,munActual,hospActual,totalCasosHosp,totalCasosProv,totalCasosMuni,totalCasosLoc: integer;
begin
    assign(archivo,'maestro');
    reset(archivo);
    assign(archivoTexto,'maestro.txt');
    rewrite(archivoTexto);
    leer(archivo,m);
    totalCasosProv:= 0;
    while (m.codLocalidad <> valoralto) do begin
        writeln('Nombre Localidad: ', m.nombreLocalidad);
        locActual:= m.codLocalidad;
        nombreLocActual:= m.nombreLocalidad;
        totalCasosLoc:= 0;
        while (m.codLocalidad = locActual) do begin
            writeln('Nombre Municipio: ', m.nombreMunicipio);
            munActual:= m.codMunicipio;
            nombreMunActual:= m.nombreMunicipio;
            totalCasosMuni:= 0;
            while (m.codLocalidad = locActual) and (m.codMunicipio = munActual) do begin
                writeln('Nombre Hospital: ', m.nombreHospital);
                hospActual:= m.codHospital;
                totalCasosHosp:= 0;
                while (m.codLocalidad = locActual) and (m.codMunicipio = munActual) and (m.codHospital = hospActual) do begin
                    totalCasosHosp:= totalCasosHosp + m.casosPositivos;
                    leer(archivo,m);
                end;
                write('Cantidad de casos Hospital: ', totalCasosHosp);
                totalCasosMuni:= totalCasosMuni + totalCasosHosp;
            end;
            if totalCasosMuni > 1500 then
                writeln(archivoTexto,nombreLocActual, ' ' ,nombreMunActual, ' ' ,totalCasosMuni);
            write('Cantidad de casos Municipio: ', totalCasosMuni);
            totalCasosLoc:= totalCasosLoc + totalCasosMuni;
        end;
        write('Cantidad de casos Localidad: ', totalCasosLoc);
        totalCasosProv:= totalCasosProv + totalCasosLoc;
    end;
    writeln('Cantidad de casos totales en Provincia: ', totalCasosProv);
    close(archivo);
    close(archivoTexto);
end;

var
    archivo: archivoMaestro;
begin
    informarMaestro(archivo);
end.
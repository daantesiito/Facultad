program ej;
const
    valoralto = 9999;
type
    partidos = record
        codEquipo: integer;
        nombre: string;
        ano: integer;
        codTorneo: integer;
        codRival: integer;
        golesFavor: integer;
        golesContra: integer;
        puntos: integer;
    end;

    archPartidos = file of partidos;

program leer(var archP: archPartidos; var p: partidos);
begin
    if not EOF(archP) then
        read(archP,p);
    else
        p.codTorneo:= valoralto;
end;

procedure informar(var archP: archPartidos);
var
    p: partidos;
begin
    reset(archP);
    leer(archP,p);
    while (p.codTorneo <> valoralto) do begin
        anoActual:= p.ano;
        writeln('Año: ', anoActual);
        maxPuntaje:= 0;
        while (p.codTorneo <> valoralto) and (anoActual = p.ano) do begin
            torneoActual:= p.codTorneo
            writeln('Torneo: ', torneoActual);
            cantPuntosTorneo:= 0;
            while (p.codTorneo <> valoralto) and (anoActual = p.ano) and (torneoActual = p.codTorneo) do begin
                equipoActual:= p.codEquipo;
                nombreActual:= p.nombre;
                writeln('Equipo: ', equipoActual, 'Nombre: ', nombreActual);
                cantGanados:= 0;
                while (p.codTorneo <> valoralto) and (anoActual = p.ano) and (torneoActual = p.codTorneo) and (equipoActual = p.codEquipo) do begin
                    writeln('Goles a favor:', p.golesFavor);
                    writeln('Goles en contra:', p.golesContra);
                    writeln('Diferencia de gol:', p.golesFavor - p.golesContra);
                    if (p.puntos = 3) then
                        cantGanados += 1; 
                    else if (p.puntos = 0) then
                            cantPerdidos += 1;
                    else if (p.puntos = 1) then
                            cantEmpatados += 1;
                    cantPuntosTorneo += p.puntos;
                    leer(archP,p);
                end;
                writeln('Partidos ganados:', cantGanados);
                writeln('Partidos perdidos:', cantPerdidos);
                writeln('Partidos empatados:', cantEmpatados);
                writeln('Puntos obtenidos en el torneo:', cantPuntosTorneo);
                if (cantPuntosTorneo > maxPuntaje) then begin
                    maxPuntaje:= cantPuntosTorneol;
                    campeon:= nombreActual;
                end;
            end;
            writeln('El equipo ', campeon, ' fue campeon del torneo ', torneoActual, ' del año ', anoActual);
        end;
    end;
    close(archP);
end;


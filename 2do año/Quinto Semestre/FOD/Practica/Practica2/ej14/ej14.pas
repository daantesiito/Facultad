program ej;
const
    valoralto = 9999;
type
    informacionMae = record
        codProv: integer;
        nombreProv: string;
        codLoc: integer;
        nombreLoc: string;
        vSinLuz: integer;
        vSinGas: integer;
        vChapa: integer;
        vSinAgua: integer;
        vSinSanitarios: integer;
    end;

    informacionDet = record
        codProv: integer;
        codLoc: integer;
        vConLuz: integer;
        vConstruidas: integer;
        vConAgua: integer;
        vConGas: integer;
        EntregaSanitarios: integer;
    end;

    archMaestro = file of informacionMae;

    archDetalle = file of informacionDet;

    vecArchDetalle = array [1..10] of archDetalle;

    vecRegDetalle = array [1..10] of informacionDet;

procedure leer(var archD: archDetalle; var d: informacionDet);
begin
    if not EOF(archD) then
        read(archD,d);
    else
        d.codProv:= valoralto;
end;

procedure minimo(var arch: vecArchDetalle; min: informacionDet; var reg: vecRegDetalle);
begin
    minPos:= 0;
    min.codProv:= valoralto;
    for i:= 1 to 10 do begin
        if (reg[i].codProv <> valoralto) then begin
            if (reg[i].codProv < min.codProv) then begin
                min:= reg[i];
                minPos:= i;
            end;
        end;
    end;
    if (minPos <> 0) then
        leer(arch[minPos],reg[minPos]);
end;

procedure actualizar(var archM: archMaestro; var archD: vecArchDetalle; var regD: vecRegDetalle);
begin
    reset(archM);
    for i:= 1 to 10 do begin
        assign(archD[i],'detalle',i);
        reset(archD[i]);
        leer(archD[i],reg[i]);
    end;
    minimo(archD,min,regD);
    while (min.codProv <> valoralto) do begin begin
        codProvActual:= min.codProv;
        vTotalLuz:= 0;
        vTotalCons:= 0;
        vTotalConAgua:= 0;
        vTotalConGas:= 0;
        EntregaSanitarios:= 0;
        while (codProvActual = min.codProv) do begin 
            vTotalLuz:= vTotalLuz + min.vConLuz;
            vTotalCons:= vTotalCons + min.vConstruidas;
            vTotalConAgua:= vTotalConAgua + min.vConAgua;
            vTotalConGas:= vTotalConGas + min.vConGas;
            TotalEntregaSanitarios:= EntregaSanitarios + min.entregaSanitarios;
            minimo(archD,min,regD);
        end;
        read(archM,m);
        while (m.codProv <> min.codProv) do 
            read(archM,m);
        m.vSinLuz-= vTotalLuz;
        m.vSinGas-= vTotalConGas;
        m.vChapa-= vTotalCons;
        m.vSinAgua-= vTotalConAgua;
        m.vSinSanitarios-= TotalEntregaSanitarios;
    end;
end;
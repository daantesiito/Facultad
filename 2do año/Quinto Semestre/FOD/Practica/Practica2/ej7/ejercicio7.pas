program ejercicio7;
const
    N = 10;
    valoralto = 9999;
type
    maestro = record 
        codLocalidad: integer;
        nombreLocalidad: string;
        codCepa: integer;
        nombreCepa: string;
        cantCasosActivos: integer;
        cantCasosNuevos: integer;
        cantCasosRecuperados: integer;
        cantCasosFallecidos: integer;
    end;

    detalle = record
        codLocalidad: integer;
        codCepa: integer;
        cantCasosActivos: integer;
        cantCasosNuevos: integer;
        cantCasosFallecidos: integer;
    end;

    archivoMaestro = file of maestro;

    archivoDetalle = file of detalle;

    vectorArchivoDetalle = array [1..N] of archivoDetalle;

    vectorRegistroDetalle = array [1..N] of detalle;

procedure leer(var archD: archivoDetalle; var d: detalle);
begin
    if not EOF(archD) then
        read(archD,d);
    else
        m.codLocalidad:= valoralto;
end;

procedure minimo(var vAD: vectorArchivoDetalle; var min: detalle; var vRD: vectorRegistroDetalle);
begin
    posMin:= 0;
    min.codLocalidad:= valoralto;
    for i:= 1 to N do begin
        if (vAD[i].codLocalidad <> valoralto) then begin
            if (vAD[i].codLocalidad <= min.codLocalidad) and (vAD[i].codCepa < min.codCepa) then begin
                min:= vRD[i]
                posMin:= i;
            end;
        end;
    end;
    if (posMin <> 0) then
        leer(vAD[posMin],vRD[posMin]);   
end;

procedure actualizarMaestro(var vAD: vectorArchivoDetalle; var vRD: vectorRegistroDet; var archM: archivoMaestro; var cantLoc50CasosActivos: integer);
var
    min: detalle;
    m: maestro;
    i,totalFallecidos,totalRecuperados,totalActivos,totalNuevos,locMas50Act: integer;
begin
    assign(archM,'maestro');
    reset(archM);
    for i:= 1 to N do begin
        Str (i,aString);
        assign(vAD[i],'detalle'+aString);
        reset(vAD[i]);
    end;
    minimo(vAD,min,vRD);
    while (min.codLocalidad <> valoralto) do begin
        locActual:= min.codLocalidad;
        while (min.codLocalidad = locActual) do begin
            cepaAct:= min.codCepa;
            totalFallecidos:= 0;
            totalRecuperados:= 0;
            while (min.codLocalidad = locActual) and (min.codCepa = cepaAct) do begin
                totalFallecidos:= totalFallecidos + min.cantCasosFallecidos;
                totalRecuperados:= totalRecuperados + min.cantCasosRecuperados;
                totalActivos:= min.cantCasosActivos;
                totalNuevos:= min.cantcasosNuevos;
                locMas50Act:= locMas50Act + min.cantCasosActivos;
                minimo(vAD,min,vRD);
            end;
            read(archM,m);
            while m.codLocalidad <> locActual do 
                read(archM,m);
            while m.codCepa <> cepaAct do 
                read(archM,m);
            m.cantCasosActivos:= totalActivos;
            m.cantCasosFallecidos:= totalFallecidos;
            m.cantCasosRecuperados:= totalRecuperados;
            m.cantCasosNuevos:= totalNuevos;
            seek(archM, filePos(archM)-1);
            write(archM,m);
        end;
        if locMas50Act > 50 then 
            cantLoc50CasosActivos:= cantLoc50CasosActivos + 1;
    end;
end;

var
    vAD: vectorArchivoDetalle;
    vRD: vectorRegistroDetalle;
    archM: archivoMaestro;
    cantLoc50CasosActivos: integer;
begin
    cantLoc50CasosActivos:= 0;
    actualizarMaestro(vAD,vRD,archM,cantLoc50CasosActivos)
    writeln('La cantidad de localidades con + de 50 casos activos son: ', cantLoc50CasosActivos);
end.
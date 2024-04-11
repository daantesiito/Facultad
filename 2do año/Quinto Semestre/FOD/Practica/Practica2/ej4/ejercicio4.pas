program ejercicio4;
const
    valoralto = 'xxxx';
type
    provincia = record
        nombre: string;
        totalAlfa: integer;
        totalEncu: integer;
    end;

    agenciaCenso = record
        nombre: string;
        codigo: integer;
        cantAlfa: integer;
        cantEncu: integer;
    end;

    archivo_provincias = file of provincia;

    archivo_agenciaCenso = file of agenciaCenso;

procedure leer(var agenciaCenso: archivo_agenciaCenso; var ac: agenciaCenso);
begin
    if not EOF(agenciaCenso) then begin
        read(agenciaCenso,ac);
    end
    else
        ac.nombre:= valoralto;
end;

procedure minimo(var ac1,ac2,min: agenciaCenso; var agenciaCenso1,agenciaCenso2: archivo_agenciaCenso);
begin
    if ac1.nombre < ac2.nombre then begin
        min:= ac1;
        leer(agenciaCenso1,ac1);
    end
    else begin
        min:= ac2;
        leer(agenciaCenso2,ac2);
    end;
end;

procedure llenarMaestro(var agenciaCenso1,agenciaCenso2: archivo_agenciaCenso; var provincias: archivo_provincias);
var
    p: provincia;
    ac1,ac2,min: agenciaCenso;
    provActual: string;
    cantidadAlfa,cantidadEncu: integer;
begin
    assign(provincias,'provincias');
    assign(agenciaCenso1,'agencia1');
    assign(agenciaCenso2,'agencia2');
    reset(provincias);
    reset(agenciaCenso1);
    reset(agenciaCenso2);
    read(provincias,p);
    minimo(ac1,ac2,min,agenciaCenso1,agenciaCenso2);
    while (min.nombre <> valoralto) do begin 
        provActual:= min.nombre;
        cantidadAlfa:= 0;
        cantidadEncu:= 0;
        while (min.nombre = provActual) do begin
            cantidadAlfa:= cantidadAlfa + min.cantAlfa;
            cantidadEncu:= cantidadEncu + min.cantEncu;
            minimo(ac1,ac2,min,agenciaCenso1,agenciaCenso2);
        end;
        while (p.nombre <> provActual) do 
            read(provincias,p);
        p.totalAlfa:= p.totalAlfa + cantidadAlfa;
        p.totalEncu:= p.totalEncu + cantidadEncu;
        seek(provincias,filePos(provincias)-1);
        write(provincias,p);
        if not EOF(provincias) then
            read(provincias,p);
    end;
    close(provincias);
    close(agenciaCenso1);
    close(agenciaCenso2);
end;

var
    agenciaCenso1,agenciaCenso2: archivo_agenciaCenso;
    provincias: archivo_provincias;
begin
    llenarMaestro(agenciaCenso1,agenciaCenso2,provincias);
end.

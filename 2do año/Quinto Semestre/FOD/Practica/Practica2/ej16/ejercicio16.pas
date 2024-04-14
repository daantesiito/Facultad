{Una concesionaria de motos de la Ciudad de Chascomús, posee un archivo con información
de las motos que posee a la venta. De cada moto se registra: código, nombre, descripción,
modelo, marca y stock actual. Mensualmente se reciben 10 archivos detalles con
información de las ventas de cada uno de los 10 empleados que trabajan. De cada archivo
detalle se dispone de la siguiente información: código de moto, precio y fecha de la venta.
Se debe realizar un proceso que actualice el stock del archivo maestro desde los archivos
detalles. Además se debe informar cuál fue la moto más vendida.
NOTA: Todos los archivos están ordenados por código de la moto y el archivo maestro debe
ser recorrido sólo una vez y en forma simultánea con los detalles.}
program ejercicio16;
const
    ARCHIVOS = 10;
    valoralto = 9999;
type
    maestro = record
        codigo: integer;
        nombre: string;
        descripcion: string;
        modelo: string;
        marca: string;
        stock: integer;
    end;

    detalle = record
        codigo: integer;
        precio: integer;
        fecha: string;
    end;

    archivoMaestro = file of maestro;

    archivoDetalle = file of detalle;

    vectorArchDetalle = array [1..ARCHIVOS] of archivoDetalle;

    vectorRegDetalle = array [1..ARCHIVOS] of detalle;

procedure leer(var archD: archivoDetalle; var d: detalle);
begin
    if not EOF(archD) then
        read(archD,d);
    else
        d.codigo:= valoralto;
end;

procedure minimo(var vAD: vectorArchDetalle; var min: detalle; vRD: vectorRegDetalle);
begin
    codMin:= valoralto;
    posMin:= 0;
    for i:= 1 to ARCHIVOS do begin 
        if (vRD[i].codigo < codMin) then begin
            codMin:= vRD[i].codigo;
            posMin:= i;
        end;
    end;
    min:= vRD[posMin];
    leer(vAD[posMin],vRD[posMin]);
end;

procedure maxMotos(var codigo,maxVentas,maxCodigo: integer; ventas: integer);
begin
    if (ventas > maxVentas) then begin
        maxVentas:= ventas;
        maxCodigo:= codigo;
    end;
end;

procedure actualizarMaestro(var archM: archivoMaestro;var vAD: vectorArchDetalle; var vRD: vectorRegDetalle);
var
    i,ventas,codActual,maxVentas,maxCodigo: integer;
    m: maestro;
begin
    assign(archM,'maestro');
    reset(archM);
    for i:= 1 to ARCHIVOS do begin
        Str (i,aString);
        assign(vAD[i],'detalle'+aString);
        reset(vAD[i]);
    end;
    maxVentas:= 0;
    maxCodigo:= 0;
    read(archM,m);
    minimo(vAD,min,vRD);
    while (min.codigo <> valoralto) do begin
        codActual:= min.codigo;
        ventas:= 0;
        while (min.codigo = codActual) do begin
            ventas:= ventas + 1;
            minimo(vAD,min,vRD);
        end;
        maxMoto(codActual,maxVentas,maxCodigo,ventas);
        while m.codigo <> codActual do 
            read(archM,m);
        m.stock:= m.stock - ventas;
        seek(archM, filePos(archM)-1)
        write(archM,m);
        if not EOF(archM) then 
            read(archM,m);
    end;
    close(archM);
    for i:= 1 to ARCHIVOS do begin
        close(vAD[i]);
    end;
    writeln('La moto mas vendida fue: ', maxCodigo, ' con: ', maxVentas, ' vendidas.');
end;

var
    archM: archivoMaestro;
    vAD: vectorArchDetalle;
    vRD: vectorRegDetalle;
begin
    actualizarMaestro(archM,vAD,vRD);
end;
// Realizar un programa que procese la información de productos de un supermercado. 
// De cada producto se conoce: código, sector (1: limpieza, 2: bebidas ... 10: jardín), descripción, stock actual y precio. 
// La información se encuentra almacenada en una estructura de datos adecuada sin ningún orden. 
// Se pide informar los dos sectores con mayor cantidad de productos en stock.

program final; 
const
    MAX_SECTOR = 10;

type
    rango_sector = 1..MAX_SECTOR;

    producto = record
        codigo: integer;
        sector: rango_sector;
        descripcion: string;
        stock_actual: integer;
        precio: real;
    end;

    lista_productos = ^nodo;
    nodo = record
        dato: producto;
        sig: lista_productos;
    end;

    vector_sectores = array [rango_sector] of integer;

procedure cargarLista(var l: lista_productos); // se dispone

procedure inicializarVector(var v: vector_sectores);
var
    i: integer;
begin
    for i:= 1 to MAX_SECTOR do begin
        v[i]:= 0;
    end;
end;

procedure procesarLista(l: lista_productos; var v: vector_sectores);
begin
    while (l <> nil) do begin
        v[l^.dato.sector]:= v[l^.dato.sector] + 1;
        l:= l^.sig;
    end;
end;

procedure topSectores(v: vector_sectores);
var
    i, sector_max, cant_sector_max, sector_max2, cant_sector_max2: integer;
begin
    sector_max:= -1;
    sector_max2:= -1;
    cant_sector_max:= -1;
    cant_sector_max2:= -1;
    for i:= 1 to MAX_SECTOR do begin
        if (v[i] > cant_sector_max2) then begin
            if (v[i] > cant_sector_max) then begin
                cant_sector_max2:= cant_sector_max;
                sector_max2:= sector_max;
                cant_sector_max:= v[i];
                sector_max:= i;
            end
            else begin
                cant_sector_max2:= v[i];
                sector_max2:= i;
            end;
        end;
    end;
    writeln('Sector maximo 1: ', sector_max, ' con cantidad: ', cant_sector_max);
    writeln('Sector maximo 2: ', sector_max2, ' con cantidad: ', cant_sector_max2);
end;

var
    l: lista_productos;
    v: vector_sectores;
begin
    cargarLista(l);
    inicializarVector(v);
    procesarLista(l,v);
    topSectores(v);
end.
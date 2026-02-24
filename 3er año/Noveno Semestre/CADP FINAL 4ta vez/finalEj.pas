// Una empresa dispone de una estructura de datos con las ventas de su comercio. 
// De cada venta se conoce número de venta, cantidad de productos y tipo de pago (efectivo o tarjeta). 
// Se pide implementar un programa que genere una segunda estructura con las ventas cuya cantidad de productos tenga más dígitos pares que impares. 
// En la estructura generada deben quedar almacenadas las ventas de tipo de pago efectivo antes que las de tipo de pago con tarjeta.

program final;

type
    venta = record
        num: integer;
        cantidad: integer;
        pago: boolean;
    end;

    lista_venta = ^nodo;
    nodo = record
        dato: venta;
        sig: lista_venta;
    end;    

procedure cargarLista(var l: lista_venta); // se dispone

procedure insertarOrdenado(var l: lista_venta; v: venta);
var
    aux, ant, act: lista_venta;
begin
    new(aux);
    aux^.dato := v;
    ant := l;
    act := l;
    
    while (act <> nil) and (v.pago > act^.dato.pago) do begin
        ant := act;
        act := act^.sig;
    end;
    
    if (act = ant) then
        l := aux 
    else
        ant^.sig := aux;
        
    aux^.sig := act;
end;

function masPares(cant: integer): boolean;
var 
    dig, cant_pares, cant_impares: integer; 
begin
    cant_pares := 0;   
    cant_impares := 0;
    masPares:= false;

    while (cant <> 0) do begin
        dig := cant MOD 10; 
        
        if (dig MOD 2 = 0) then
            cant_pares := cant_pares + 1
        else
            cant_impares := cant_impares + 1;
            
        cant := cant DIV 10; 
    end;
    
    if (cant_pares > cant_impares) then
        masPares:= true;
end;

procedure procesarLista(l: lista_venta; var l2: lista_venta);
begin
    while (l <> nil) do begin
        if (masPares(l^.dato.cantidad)) then begin
            insertarOrdenado(l2,l^.dato);
        end;
        l:= l^.sig;
    end;
end;

var
    l: lista_venta;
    l2: lista_venta;
begin
    l:= nil;
    l2:= nil;
    cargarLista(l);
    procesarLista(l,l2);
end.
program parcial;

type
    venta = record
        num: integer;
        cantProd: integer;
        pago: String;
    end;

    lista = ^nodo;
    nodo = record
        dato: venta;
        sig: lista;
    end;

    lista2 = ^nodo2;
    nodo2 = record
        dato: venta;
        sig: lista2;
    end;

// procedure LeerVentas(var v: venta); // SE DISPONE

// procedure CargarVentas(var v: venta; var l: lista) // SE DISPONE

// procedure agregarAdelante(var l: lista; var v: venta); // SE DISPONE

procedure agregarOrdenado(var l: lista2; v: venta);
var
    aux,ant,act: lista2;
begin
    new(aux);
    aux^.dato:= v;
    ant:= l;
    act:= l;
    while (act <> nil) and (v.pago < l^.dato.pago) begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act = ant) then 
        l:= aux;
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;


function digitosPares(var num: integer): boolean;
var
    dig,cantPares: integer;
begin
    cantPares:= 0;
    digitosPares:= false;
    while (num <> 0) and (cantPares < 2) do begin
        dig:= num MOD 10;
        if ((dig mod 2) = 0) then
            cantPares:= cantPares + 1;
        num:= num div 10;
    end;
    if (cantPares >= 2) then
        digitosPares:= true;        
end;

procedure procesarYAgregar(var l2: lista2; v: venta; var l: lista);
begin
    while (l <> nil) do begin
        if digitosPares(l^.dato.cantProd) then begin
            agregarOrdenado(l2,l^.dato)
        end;
        l:= l^.sig;
    end;
end;

var
    v: venta;
    l: lista;
    l2: lista2;
begin
    procesarYAgregar(l2,v,l);
end.
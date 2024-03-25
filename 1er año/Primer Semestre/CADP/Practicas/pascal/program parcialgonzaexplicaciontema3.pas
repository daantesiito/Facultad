{Un servicio de comercio electrónico desea analizar las ventas de notebooks durante la última edición
del Hot Sale. De cada notebook vendida se conoce: código del cliente, código de modelo (entre 1 y 200), marca, 
y el medio de pago utilizado (1. Crédito; 2. Débito; 3. Transferencia; 4. Mercado Pago; 5. Bitcoin; 6. otro). 
Además, el servicio dispone de una tabla con el valor de venta de cada uno de los modelos de notebooks.
1) Realizar un módulo que retorne la información de las ventas de notebooks en una estructura de datos adecuada. La información se ingresa por teclado y debe almacenarse en el orden en que fue leída, La lectura finaliza cuando se ingresa el código de cliente -1.
2) Realizar un módulo que reciba la información obtenida en el inciso anterior y retorne:
    a) Los dos medios de pago que generaron el mayor monto total en ventas
    b) Cantidad de notebooks de marca "Lenovo" vendidas a clientes cuyo código de cliente termina con un dígito par.}


program parcialgonzaexplicaciontema3;
type
    rango: 1..200;

    notebook = record
        cod_cli: integer;
        cod_mod: rango;
        marca: string;
        met_pag: 1..6;
    end;

    lista: ^nodo
    nodo:= record
       dato:= notebook;
       sig: lista;
    end;

    vectorcont = array[1..6] of integer;
    vectorprecio = array[rango] of integer;

//---------------------------------------------------------------------------------------------------------------------
procedure LeerNotebook(var n: notebook);
begin
    write('Ingrese el codigo del cliente: '); readln(n.cod_cli);
    if (n.cod_cli = -1) then
        exit;
    write('Ingrese el codigo del modelo: '); readln(n.cod_mod);
    write('Ingrese la marca: '); readln(n.marca);
    write('Ingrese el metodo de pago: '); readln(n.met_pag);
end;

//---------------------------------------------------------------------------------------------------------------------
procedure AgregarAtras(var l, ult: lista; n: notebook);
var
    aux: lista;
begin
    new(aux);
    aux^.dato := n;
    aux^.sig := nil;
    if (l = nil) then
        l := aux
    else
    begin
        ult^.sig := aux;
        ult := aux;
    end;
end;

//---------------------------------------------------------------------------------------------------------------------
procedure CargarLista(var l: lista);
var
    n: notebook;
    ult: lista;
begin
    LeerNotebook(n);
    while (n.cod_cli <> -1) do
    begin
        AgregarAtras(l, ult, n);
        LeerNotebook(n);
    end;
end;

//---------------------------------------------------------------------------------------------------------------------
procedure RecorrerLista(l: lista);
var
    aux: lista;
begin
    aux := l;
    while (aux <> nil) do
    begin
        InformarVentas()
        aux := aux^.sig;
    end;
end;

// 1) Realizar un módulo que retorne la información de las ventas de notebooks en una estructura de datos adecuada.
// La información se ingresa por teclado y debe almacenarse en el orden en que fue leída, La lectura finaliza cuando se ingresa el código de cliente -1.
//---------------------------------------------------------------------------------------------------------------------
procedure InformarVentas(var l: lista;   var vectorcont: vectorcont;   var vectorprecio: vectorprecio);
var
    aux: lista;
    i: integer;
begin
    aux := l;
    while (aux <> nil) do
    begin
        vectorcont[aux^.dato.met_pag] := vectorcont[aux^.dato.met_pag] + 1;
        vectorprecio[aux^.dato.cod_mod] := vectorprecio[aux^.dato.cod_mod] + aux^.dato.cod_cli;
        aux := aux^.sig;
    end;
end;

// 2) Realizar un módulo que reciba la información obtenida en el inciso anterior y retorne:
//    a) Los dos medios de pago que generaron el mayor monto total en ventas
//    b) Cantidad de notebooks de marca "Lenovo" vendidas a clientes cuyo código de cliente termina con un dígito par.}
procedure InformarVentas2(var vectorcont: vectorcont; var vectorprecio: vectorprecio; var mayor1, mayor2: integer; var cantidad: integer);
var
    i: integer;
begin
    mayor1 := 0;
    mayor2 := 0;
    cantidad := 0;
    for i := 1 to 6 do
    begin
        if (vectorcont[i] > mayor1) then
        begin
            mayor2 := mayor1;
            mayor1 := vectorcont[i];
        end
        else if (vectorcont[i] > mayor2) then
            mayor2 := vectorcont[i];
        cantidad := cantidad + vectorcont[i];
    end;
end;

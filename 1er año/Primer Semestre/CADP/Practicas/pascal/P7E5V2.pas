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
    rango = 1..200;

    notebook = record
        cod_cli: integer;
        cod_mod: rango;
        marca: string;
        met_pag: 1..6;
    end;

    lista = ^nodo;
    nodo = record
       dato: notebook;
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

// 1) Realizar un módulo que retorne la información de las ventas de notebooks en una estructura de datos adecuada.
// La información se ingresa por teclado y debe almacenarse en el orden en que fue leída, La lectura finaliza cuando se ingresa el código de cliente -1.
//---------------------------------------------------------------------------------------------------------------------

procedure InformarVentas(l: lista);
var
	v: vectorcont;
begin
    writeln('Codigo de cleinte: ', l^.dato.cod_cli);
    writeln('Codigo de modelo: ', l^.dato.cod_mod);
    writeln('Marca: ', l^.dato.marca);
    writeln('Metodo de pago: ', v[l^.dato.met_pag]);
end;

// 2) Realizar un módulo que reciba la información obtenida en el inciso anterior y retorne:
//    a) Los dos medios de pago que generaron el mayor monto total en ventas
//    b) Cantidad de notebooks de marca "Lenovo" vendidas a clientes cuyo código de cliente termina con un dígito par.}
//---------------------------------------------------------------------------------------------------------------------
procedure 

//---------------------------------------------------------------------------------------------------------------------
procedure RecorrerLista(l: lista);
var
    aux: lista;
begin
    aux := l;
    while (aux <> nil) do
    begin
        InformarVentas(l);
        aux := aux^.sig;
    end;
end;



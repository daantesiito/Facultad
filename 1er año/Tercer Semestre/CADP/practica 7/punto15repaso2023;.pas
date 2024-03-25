{15. Una fábrica de pastas elabora diversos productos y quiere procesar los pedidos que recibe.
La fábrica ofrece 15 tipos de productos (por ej.: 1. tallarines cinta media; 2. ravioles de verdura; 3. ravioles de ricota; etc.).
Para cada tipo de producto se conoce su nombre, unidades disponibles y el precio unitario del producto. La fábrica dispone de dicha información.
Implementar un programa con:
a) Un módulo que atienda los pedidos. De cada pedido se lee código de pedido, DNI cliente, tipo de producto (de 1 a 15)  y cantidad de unidades pedidas.
La lectura de los pedidos finaliza con el DNI igual a -1.
El módulo debe:
    i- Informar el código del pedido y el monto a pagar, de los pedidos que se pueden
    satisfacer.                                                                                             ?????????????????????????????????????????????????
    ii- Retornar una lista con los pedidos no satisfechos.
    iii- Informar el monto total recaudado con los pedidos que se pudieron satisfacer.
b) Un módulo que retorne la cantidad de productos cuyas unidades disponibles quedaron en
menos de 5 unidades.
c) Un módulo que imprima los códigos de los pedidos no satisfechos donde el DNI del cliente
tenga la misma cantidad de dígitos pares e impares.}

program ejercicio15practica7;
type
    tiposProductos = 1..15;
    producto = record
        nombre: string;
        unidadesDisp: integer;
        precio: integer;
    end;

    vectorTiposDeProducto = array [tiposProductos] of producto;

    pedido = record
        codigo: integer;
        DNI: integer;
        tipo: tiposProductos;
        cantUnidades: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: pedido;
        sig: lista;
    end;

procedure CargarProductos(var v: vectorTiposDeProducto; var p: producto;); // SE DISPONE

procedure LeerPedidos(var p: pedido);
begin
    readln(p.codigo);
    readln(p.DNI);
    readln(p.tipo);
    readln(p.cantUnidades);
end;

procedure AgregarAdelante(var l: lista; p: pedido);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= p;
    aux^.sig:= l;
    l:= l^.sig;
end;

procedure CargarLista(var l: lista);
var
    p: pedido;
begin
    LeerPedidos(p);
    while (l <> nil) and (p.DNI <> -1) do begin
        AgregarAdelante(l,p);
        LeerPedidos(p);
    end;
end;

procedure procesar();
var

begin
    while l <> nil do begin
        if (p.cantUnidades * v[p.tipo].precio) > 30000 then
            writeln('El DNI de la persona que supero los 30k pesos es: ', p.DNI);
        l:= l^.sig;
    end;
end;
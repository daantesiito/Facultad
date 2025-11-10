program final; //no se que tan bien esta, chatgpt tira un par de errores.

type
    producto = record
        codProd: integer;
        precio: real;
        stock: integer;
        codFabricante: integer;
    end;

    listaProductos = ^nodo;
    nodo = record
        dato: producto;
        sig: listaProductos;
    end;

    compra = record
        codProd: integer;
        precio: real;
        cant: integer;
        codFabricante: integer;
    end;

    listaCompra = ^nodo2;
    nodo2 = record
        dato: compra;
        sig: listaCompra;
    end;

    prodComp = record
        codFab: integer;
        cantProd: integer;
    end;

    listaProdComp = ^nodo3;
    nodo3 = record
        dato: prodComp;
        sig: listaProdComp;
    end;

procedure insertarOrdenado(var l: listaCompra; c: compra);
var
    aux,ant,act: listaCompra;
begin
    new(aux);
    aux^.dato:= c;
    ant:= l;
    act:= l;
    while (act <> nil) and (p.codFabricante > act^.dato.codFabricante) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act = ant) then
        l:= aux;
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;

function buscarProducto(l: listaProductos; cod: integer): listaProductos;
begin
    while (l <> nil) and (l^.dato.codProd <> cod) do begin
        l:= l^.sig;
    end;
    buscarProducto:= l;
end;

procedure agregarAdelante(var l: listaProdComp; p: prodComp);
var
    aux: listaProdComp;
begin
    new(aux);
    aux^.dato:= p;
    aux^.sig:= l;
    l:= aux;
end;

function buscarFabricante(l: listaProdComp; codigo: integer): listaProdComp;
begin
    while (l <> nil) and (l^.dato.codFab <> codigo) do begin
        l:= l^.sig;
    end;
    buscarFabricante:= l;
end;

procedure procesarInformacion(l1: listaCompra; var l2: listaProductos; var l3: listaProdComp; var porcentajeAumento: real);
var
    c: compra;
    p: prodComp;
    prod: l2;
    prodAct: integer;
    aumentoPrecio: integer;
begin
    aumentoPrecio:= 0;
    totalCompras:= 0;
    while (l1 <> nil) do begin
        fabAct:= l1^.dato.codFabricante;
        while (l1^.dato.codFabricante = fabAct) do begin
            fab:= buscarFabricante(l3, fabAct);
            if (fab <> nil) then begin
                prodAct:= l1^.dato.codProd;
                while (l1^.dato.codProd = prodAct) do begin
                    prod:= buscarProducto(l2, prodAct);
                    if (prod <> nil) then
                    begin
                        prod^.dato.stock:= prod^.dato.stock + l1^.dato.cant;
                        fab^.dato.cantProd:= fab^.dato.cantProd + l1^.dato.cant;
                        if (prod^.dato.precio < l1^.dato.precio) then begin
                            prod^.dato.precio:= l1^.dato.precio;
                            aumentoPrecio:= aumentoPrecio + 1;
                        end;
                        totalCompras;= totalCompras + 1;
                        l1:= l1^.sig;
                    end;
                end;
                insertarOrdenado(l1,c);
            end;
        end;
        agregarAdelante(l3,p)
    end;
    if (totalCompras > 0) then 
        porcentajeAumento:= aumentoPrecio / totalCompras;
    else
        porcentajeAumento:= 0;
end;

var
    
    l1: listaCompra
    l2: listaProductos
    l3: listaProdComp
    porcentajeAumento: real;
begin
    porcentajeAumento:= 0;
    procesarInformacion(l1,l2,l3,porcentajeAumento);
end.
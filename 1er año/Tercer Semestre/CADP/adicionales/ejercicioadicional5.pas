program ejercicioadicional5;
type
    cantRubros = 1..15;
    producto = record
        nombre: string;
        marca: string;
        rubro: cantRubros;
    end;

    vectorProductos = array [1..2000] of producto;

    pedido = record
        numPedido: integer;
        fecha: integer;
        productos: productoSolicitado;
    end;

    productoSolicitado = record
        codProd: 1..2000;
        cantidad: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: pedido;
        sig: lista;
    end;

    vectorRubros = array [cantRubros] of integer;

procedure LeerProductos(var p: producto); // SE DISPONE;
begin
    readln(p.nombre);
    readln(p.marca);
    readln(p.rubro);
end;

procedure CargarVector(var v: vectorProductos; p: producto); // SE DISPONE
var
    i: integer;
begin
    for i:= 1 to 2000 do begin
        LeerProductos(p);
        v[i].nombre:= p.nombre;
        v[i].marca:= p.marca;
        v[i].rubro:= p.rubro;
    end;
end;

procedure LeerPedidos(var p: pedido);
begin
    readln(p.numPedido);
    readln(p.fecha);
    readln(p.productos);
end;

procedure LeerProductosSolicitados(var ps: productoSolicitado);
begin
    readln(ps.codProd);
    readln(ps.cantidad);
end;

procedure InicializarVectorContador(var v: vectorRubros);
var
    i: integer;
begin
    for i:= 1 to 15 do begin
        v[i]:= 0;
    end;
end;

procedure CargarLista(p: pedido; ps: productoSolicitado; var l: lista;);
var
    numerodepedidos: integer;
begin
    while (l <> nil) and (p.numPedido <> -999) do begin
        LeerPedidos(p);
        numerodepedidos:= 0;
        while (l <> nil) and (p.productos.codProd <> -999) and (numerodepedidos <> p.numPedido) do begin
            numerodepedidos:= numerodepedidos + 1;
            LeerProductosSolicitados(ps);
        end;
    end;
end;

procedure procesar(var l: lista; var v: vectorRubros; pr: producto; pe: pedido);
var
    i: integer;
begin
    while (l <> nil) do begin
        v[pr.rubro]:= v[pr.rubro] + 1;
        if pe.productos > 10 then begin
            writeln(pe.numPedido)
        end;
        l:= l^.sig;
    end;
    for i:= 1 to 15 do begin
        writeln('La cantidad de productos solicitados para el rubro: ', i, ' es de: ', v[i])
    end;
end;
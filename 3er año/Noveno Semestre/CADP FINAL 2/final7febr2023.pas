program final;

type
    cliente = record
        dni: integer;
        fecha: string;
        monto: real;
    end;

    lista_clientes = ^nodo;
    nodo = record
        dato: cliente;
        sig: lista_clientes;
    end;

    clienteAgrupado = record
        dni: integer;
        cant_compras: integer;
        monto_total: real;
    end;

    nueva_lista_clientes = ^nodo2;
    nodo2 = record
        dato: clienteAgrupado;
        sig: nueva_lista_clientes;
    end;

procedure agregarAdelante(var nl: nueva_lista_clientes, c: clienteAgrupado);
var
    aux: nueva_lista_clientes;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= nl;
    nl:= aux;
end;

procedure anadirNuevoCliente(var nl: nueva_lista_clientes; dni: integer; monto: real; cant: integer);
var
    c: clienteAgrupado;
begin
    c.dni := dni;
    c.cant_compras := cant;
    c.monto_total := monto;
    agregarAdelante(nl, c);
end;

procedure nuevaLista(var nl: nueva_lista_clientes; l: lista_clientes);
var
    dniActual, cantCompras: integer;
    montoTotal: real;
begin
    while (l <> nil) do begin
        dniActual:= l^.dato.dni;
        montoTotal:= 0;
        cantCompras:= 0;
        while (l <> nil) and (l^.dato.dni = dniActual) do begin
            montoTotal:= montoTotal + l^.dato.monto;
            cantCompras:= cantCompras + 1;
            l:= l^.sig;
        end;
        if (cantCompras > 5) then
            anadirNuevoCliente(nl,dniActual,montoTotal,cantCompras);
    end;
end;

var
    nl: nueva_lista_clientes;
    l: lista_clientes;
begin
    nl:= nil;
    nuevaLista(nl,l);
end.
{Implementar un programa que lea y almacene información de clientes de una empresa aseguradora automotriz. // LISTA
De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada (1..6) y monto básico que abona mensualmente. // REGISTRO CON COD_CLI, DNI, APE, NOM, COD_POL, MONTO
La lectura finaliza cuando llega el cliente con código 1122, el cual debe procesarse. // REPEAT UNTIL COD_CLI: 1122
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional
que el cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene contratada. // IF COD_POL= X/Y/Z ---- X: $100 Y: $150 Z: $200
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente por su seguro automotriz (monto básico + monto adicional). // MONTO + DATO.^COD_POL
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9. // DESARMAR EL DNI CON MOD 10
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la estructura. // ELIMINAR DE ESTRUCTURA
}
program P7E2;
type
    poliza = 1..6;
    cliente = record
        cod_cli: integer;
        DNI: integer;
        apellido: string;
        nombre: string;
        cod_pol: poliza;
        monto: real;
    end;

    lista = ^nodo;
    nodo = record
        dato: cliente;
        sig: lista;
    end;

    vector = array[1..6] of real;

//----------------------------------------------------------------
procedure inicializarVector(var v: vector);
var
    i: integer;
begin
    for i:= 1 to 5 do
    begin
        v[i]:=0;
    end;
end;

//----------------------------------------------------------------
procedure armarNodo(var l:lista; c: cliente);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= l;
    l := aux;
end;

//----------------------------------------------------------------
procedure LeerClientes(var c: cliente);
begin
    with c do
        writeln('Ingrese el codigo de cliente: '); readln(c.cod_cli);
        writeln('Ingrese su DNI: '); readln(c.DNI);
        writeln('Ingrese su Apellido: '); readln(c.apellido);
        writeln('Ingrese su Nombre: '); readln(c.nombre);
        writeln('Ingrese el codigo de poliza: '); readln(c.cod_pol);
        writeln('Ingrese el monto que abona mensualmente: '); readln(c.monto);
end;

//----------------------------------------------------------------
procedure CargarLista(var l: lista);
var
    c: cliente;
begin
    LeerClientes(c);
    repeat
        armarNodo(l, c);
        LeerClientes(c);
    until (c.cod_cli = 1122);
end;

// a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente por su seguro automotriz (monto básico + monto adicional). // MONTO + DATO.^COD_POL
//----------------------------------------------------------------
procedure InformarA(l: lista; v: vector);
var
    monto_total: real;
begin
    writeln('DNI: ', l^.dato.dni);
    writeln('Apellido: ', l^.dato.apellido);
    writeln('Nombre: ', l^.dato.nombre);
    monto_total := (l^.dato.monto + v[l^.dato.cod_pol]);
    writeln('Monto Total: ', monto_total);
end;

// b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
//----------------------------------------------------------------
procedure InformarB(var l: lista)
var
    suma: integer;
    dig: integer;
    cumple: boolean;
begin
    cumple: false;
    suma:= 0;
    dni:= l^.dato.dni
    while (suma <> 2) and (cumple <> true) and (dni <> 0) do
        dig:= (dni MOD 10)
        if (dig = 9) then begin
            suma:= suma + 1;
        end;
        if (suma = 2) then begin
            cumple: true;
        end;
        dni:= dni DIV 10;
        writeln('El pibardo ', l^.dato.nombre, ' ', l^.dato.apellido, 'tiene al menos 2 digitos '9' en su dni.')
end;
//----------------------------------------------------------------
Procedure InformarC(var l:lista; valor:integer);
Var
    actual,ant: lista;
Begin
    actual:=l; 
    while (actual <> nil) and (actual^.dato.cod_cli <> valor) do begin
        ant:=actual; actual:= actual^.sig;
    end;
    if (actual <> nil) then
        if (actual = l) then begin
			l:= l^.sig; dispose (actual);
        end
    else begin
        ant^.sig:= actual^.sig;
        dispose (actual);
    end;
End;

//----------------------------------------------------------------
var
	l: lista;
	v: vector;
	c: cliente;
begin
    l := nil;
    LeerClientes(c);
    InformarA(l, v);
end.


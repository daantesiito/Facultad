program examen2020tema2;
type
    cantCategorias: 1..20;
    categorias = record
        nombre: string;
        precioxkg: integer;
    end;

    vectorCategorias = array[cantCategorias] of categorias;

    compra = record
        DNI: integer;
        cat: cantCategorias;
        cantKG: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: compra;
        sig: lista;
    end;

    vectorContador = array[cantCategorias] of integer;

procedure LeerCompras(var c: compras);
begin
    readln(c.DNI);
    readln(c.cat);
    readln(c.cantKG);
end;

procedure InicializarVector(var v: vectorCategorias); // se dispone
var
    i: integer;
begin
    for i:= 1 to 20 do begin
        readln(v[i]);
    end;
end;

procedure InicializarVectorContador(var v: vectorCategorias);
var
    i: integer;
begin
    for i:= 1 to 20 do begin
        v[i]:= 0;
    end;
end;

procedure AgregarAdelante(var l: lista; c: compra);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= l;
    l:= l^.sig;
end;

procedure CargarLista(var l: lista; c: compras);
begin
    LeerCompras(c);
    while (c.DNI <> -1) do begin
        AgregarAdelante(l,c);
        LeerCompras(c);
    end;
end;

procedure DNImenor(var SumaTotalDinero: integer; var min1, mini1: integer; dni: integer);
begin
    if SumaTotalDinero < min1 then begin
        min1:= SumaTotalDinero;
        mini1:= dni;
    end;
end;

function DNI5impares(var dni: integer): boolean;
var
    dig, esimpar: integer;
begin
    DNI5impares:= False;
    while (dni <> 0) and (esimpar > 5) do begin
        dig:= dni MOD 10;
        if ((dig MOD 2) = 1) then
            esimpar:= esimpar + 1;
        dni:= dni DIV 10;
    end;
    if esimpar < 5 then
        DNI5impares:= True;
end;

procedure procesar(var l: lista; var vc: vectorContador;);
var
    min1, mini1: integer;
    v: vectorCategorias;
begin
    min1:= 0;
    mini1:= 0;
    while l <> nil do  begin
        DNIactual:= l^.dato.DNI;
        while l <> nil and (l^.dato.DNI = DNIactual) do begin
            SumaTotalDinero:= SumaTotalDinero + (v[l^.dato.cat].precioxkg * l^.dato.cantKG);
            vc[l^.dato.cat]:= vc[l^.dato.cat] + 1;
            if DNI5impares(l^.dato.DNI) then begin
                compras5imp:= compras5imp + 1;
            end;
        end;
        DNImenor(SumaTotalDinero,min1,mini1,l^.dato.DNI);
        l:= l^.sig;
    end;
    writeln('El DNI con mejor dinero gastado es: ', mini1, ' con un monto de: ', min1);
    for i:= 1 to 20 do begin
        writeln('La categoria ', i, ' tiene este total de compras: ', vc[i]);
    end;
    writeln('La cantidad de compras compuesto por 5 digitos es de: ', compras5imp);
end;
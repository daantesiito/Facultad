{3. Un criadero de conejos está analizando ciclos de reproducción. El criadero cuenta con conejas reproductoras
y dispone de una estructura con la información de todas las conejas. De cada coneja se tiene su código, año de
nacimiento, especie (del 1 al 6), nombre, cantidad de partos (entre 1 y 10) y cantidad de crías que tuvo en cada
parto.
a) Realice una función que reciba la información de todas las conejas y retorne el número de especie que tiene
la mayor cantidad de conejas.
b) Realice un módulo que reciba la información de todas las conejas y retorne en una estructura adecuada las
conejas que tuvieron en total más de 35 crías.
c) Realice un módulo que reciba la estructura generada en b) e informe los nombres de las conejas con código
impar, nacidas antes del año 2020.}

program ejercicio3adicional;
type
    cantEspecies = 1..6;
    totalPartos = 1..10;
    coneja = record
        codigo: integer;
        nacimiento: integer;
        especie: cantEspecies;
        nombre: string;
        partos: totalPartos;
    end;

    totalCrias = record
        crias: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: coneja;
        sig: lista;
    end;

    lista2 = ^nodo2;
    nodo2 = record
        dato: totalCrias;
        sig: lista2;
    end;

    vectorConejas = array cantEspecies of integer;

    Conejas35Mas = record
        Conejas: coneja;
    end;

    lista3 = ^nodo3;
    nodo3 = record
        dato: Con35Mas;
        sig: lista3;
    end;

procedure AgregarAdelante(var l: lista2; tc: totalCrias);
var
    aux: lista2;
begin
    new(aux);
    aux^.dato:= tc;
    aux^.sig:= l;
    l:= l^.sig;
end;

procedure LeerConejas(var c: coneja; var tc: totalCrias); // SE DISPONE
var
    i: integer;
begin
    readln(c.codigo);
    readln(c.nacimiento);
    readln(c.especie);
    readln(c.nombre);
    readln(c.partos);
    for i:= 1 to c.partos do begin
        readln(tc.crias);
        AgregarAdelante(l,tc);
    end;
end;

procedure CargarLista(var l: lista; v: vectorConejas); // SE DISPONE

procedure InicializarVectorContador(var v: vectorConejas);
var
    i: integer;
begin
    for i:= 1 to 6 do begin
        v[i]:= 0;
    end;
end;

procedure mayorCantConejas(cant: integer; var max, maxi: integer; especie: integer;);
begin
    if cant > max then begin
        max:= cant;
        maxi:= especie;
    end;
end;

procedure AgregarAdelanteC35(var l: lista3; c35: Conejas35Mas);
var
    aux: lista3;
begin
    new(aux);
    aux^.dato:= c35;
    aux^.sig:= l;
    l:= l^.sig;
end;

procedure puntoa(var l: lista; var l2: lista2;);
begin
    while l <> nil do begin
        v[l^.dato.especie]:= v[l^.dato.especie] + 1;
        
        l:= l^.sig;
    end;
    for i:= 1 to 6 do begin
        mayorCantConejas(v[i],max, maxi, i);
    end;
    writeln('El numero de especie que mas conejas tiene es: ', maxi);
end;
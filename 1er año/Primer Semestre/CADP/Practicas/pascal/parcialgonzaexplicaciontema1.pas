{La FIFA está analizando la información de resultados en los 18 partidos del mundial de fútbol Uruguay 30. 
Para ello, dispone de una estructura de datos con información de los goles realizados en todos los partidos. 
De cada gol se conoce el número de partido (entre 1 y 18) y el equipo que lo realizó. La información se encuentra ordenada por equipo.
Realizar un programa que:
1- Invoque a un módulo que retorne información de los 18 partidos almacenada es una estructura adecuada. 
De cada partido se conoce su número (entre 1 y 18), nombre del estadio donde se jugó, y nombre de los dos equipos o países que participaron. 
Esta información se ingresa por teclado, y se ingresa sin ningún orden en particular.
2- Invoque a un módulo que reciba la información de los goles y la información de los partidos, e informe:
a) Cantidad de partidos con menos de 5 goles.
b) Nombre del equipo con mayor cantidad de goles realizados en el Estadio Centenario.}


program parcialgonzaexplicaciontemaA;
type
	partidos = 1..18;
	gol = record
		num_part: partidos;
		equipo: string;
	end;
	
	partido = record
		num_partidos: partidos;
		estadio: string;
		equipo1: string;
		equipo2: string;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: gol;
		sig: lista;
	end;

	vectorPartido = array[partidos] of partido;
	
//----------------------------------------------------------------------
procedure AgregarOrdenado(var l: lista; g: gol);
var
	nue: lista;
	act, ant: lista;
begin
	new(nue);
	nue^.dato:= g;
	act:= l;
	ant:= l;
	while (act <> nil) and (g.equipo < act^.dato.equipo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if act = ant then
		l:= nue
	else 
		ant^.sig:= nue;
	nue^.sig:= act;
end;
//----------------------------------------------------------------------
procedure CargarGoles(var l: lista); // se dispone
var
	g: gol;
begin
	LeerGoles(g);
	while (g.num_part <> 18) do begin
		AgregarOrdenado(l, g);
		LeerGoles(g);
	end;
end;

//----------------------------------------------------------------------
procedure LeerGoles(g: gol); // se dispone

//----------------------------------------------------------------------
procedure LeerPartido(var p: partido);
begin
	readln(p.partido);
	readln(p.estadio);
	readln(p.equipo1);
	readln(p.equipo2);
end;

//----------------------------------------------------------------------
procedure CargarPartidos(var l: lista); 
var
	p: partido;
begin
	LeerPartido(p);
	while (g.num_part <> 18) do begin
		AgregarOrdenado(l, p);
		LeerPartido(p);
	end;
end;

//----------------------------------------------------------------------
procedure InicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 18 do begin
		v[i]:= 0;
	end;
end;

//----------------------------------------------------------------------
procedure InformarPartidos(v: vectorPartido; p: partido);
begin
	writeln('Numero de partido: ', v[p.partidos])
	writeln('Nombre del estadio donde se jugo: ', v[p.estadio])
	writeln('Nombre del primer equipo: ', v[p.equipo1])
	writeln('Nombre del segundo equipo: ', v[p.equipo1])
end;
//----------------------------------------------------------------------
procedure RecorrerLista(l: lista);
var
    aux: lista;
begin
    aux:= l;
    while aux <> nil do begin
        InformarPartidos(v, p);
        agregarAdelante(l, p)
        aux:= aux^.sig;
    end;
end;
//----------------------------------------------------------------------
procedure agregarAdelante(l: lista; p: partido);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= p
	aux^.sig:= l
	l:= aux;
end;

//----------------------------------------------------------------------
procedure 

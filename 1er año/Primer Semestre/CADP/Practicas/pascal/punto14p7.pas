{El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas,
2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido observados. 
Dicha información se lee hasta encontrar un objeto con código -1 (el cual no
debe procesarse). La estructura generada debe mantener el orden en que fueron leídos los datos.
B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares.}
program punto6p7;
type
	rango_max = 7
	rangocat = 1..rango_max;
	objeto = record
		codigo: integer;
		categoria: rangocat;
		nombre: string;
		distancia: real;
		descubridor: string;
		aniodesc: integer;
	end;
	vectorCategorias = array[rangocat] of integer;
	
	lista_observaciones = ^nodo;
	nodo = record
		dato: objeto;
		sig: lista_observaciones;
	end;

procedure inicializarVector(v: vectorCategorias)
var
	i:= integer;
begin
	for i:= 1 to n do begin
		v[i]:= 0
	end;
end;

procedure leerObjetos(var obj: objeto)
begin
	readln(obj.codigo);
	readln(obj.categoria);
	readln(obj.nombre);
	readln(obj.distancia);
	readln(obj.descubridor);
	readln(obj.aniodesc);
end;

procedure insertarAtras();

begin
	new(nue);
	nue^.dato = obj;
	nue^.sig = ;
end;

procedure cargarlista_observacionesDeObjetos(l: lista_observaciones);
var
	observacion: objeto
	codigo_objeto = integer
begin
	codigo_objeto = 0
	while codigo_objeto <> -1 do begin
		leerObjetos(observacion);
		if observacion.codigo <> -1 do begin
			agregarAtras(observacion)
			end 
		codigo_objeto = observacion.codigo
	
	end;
end;



























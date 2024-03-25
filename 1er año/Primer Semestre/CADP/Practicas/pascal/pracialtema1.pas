{Una panaderia artesanal de La Plata vende productos de elaboración propia. La panaderia agrupa a sus productos en 26 categorias (por ej.: 1. Pan; 2. Medialunas; 3. Masas finas; etc.). Para cada categoria se conoce su nombre y el precio por kilo del producto.
La panaderia dispone de la información de todas las compras realizadas en el último año. De cada compra se conoce el DNI del cliente, la categoría del producto (entre 1 % 26) y la cantidad de kilos comprados. La información se encuentra ordenada por DNI del cliente.
a) Realizar un módulo que retorne la información de las categorias en una estructura de datos adecuada. La información se lee por teclado y sin ningún orden en particular. De cada categoría se lee el nombre, el código (1 a 26) y el precio por kilo.
b) Realizar un módulo que reciba la información de todas las compras, la información de las categorias, y retorne:
1. DNI del cliente que más compras ha realizado.
2. Monto total recaudado por cada categoría
3. Cantidad tolal de compras de olientes con DM/ compuesto par, al menos, 3 digitos pares.
NOTA: Implementar el programa principal.}
program parcialtema1;
const
	rango = 26;
type
	categoria = record
		nombre: string;
		precioxkg: real;
	end;
	rangoCategorias = 1..rango;
	vectorCategorias = array[rangoCategorias] of categoria;
	
	compra = record
		DNI: integer;
		categoria: rangoCategorias;
		cantidadkg: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: compra;
		sig: lista;
	end;
	vectorMontos = array[rangoCategorias] of real;

{(L: lista, vec: vectorCategorias, var DNImax: integer, var montos: vectorMontos, var cantCompras: integer)}

{a) Realizar un módulo que retorne la información de las categorias en una estructura de datos adecuada. ---------> cargarCategorias
La información se lee por teclado y sin ningún orden en particular. 
De cada categoría se lee el nombre, el código (1 a 26) y el precio por kilo. ----------> leerCategorias}
//A) EMPIEZA
procedure leerCategorias(var cat: categoria, var cod: rangoCategorias);
begin
	readln(cat.nombre);
	readln(cat.preciokg);
	readln(cod);
end;

procedure cargarCategorias(var v: vectorCategorias);
var
	cat: categoria
	i, cod: rangoCategorias
begin
	for i:= 1 to cantCategorias do begin
		leerCategorias(cat,cod);
		v[cod]:= cat
	end;
end;
//A) TERMINA

{b) Realizar un módulo que reciba la información de todas las compras(L que esta en la lista de compras), la información de las categorias(el vector de las categorias), y retorne:
1. DNI del cliente que más compras ha realizado.(DNImax)
2. Monto total recaudado por cada categoría.(montos que es tipo vectorMontos) (INICIARLIZAR VECTOR)
3. Cantidad tolal de compras de olientes con DM/ compuesto par, al menos, 3 digitos pares.(cant compras)
NOTA: Implementar el programa principal.}
procedure inicializarVector(var v: vectorMontos);
var
	i: rangoMontos
begin
	for i:= 1 to rangoCategorias do v[i]:= 0;
end;

function tiene3pares(num: integer): boolean;
var
	contPares, dig: integer;
begin
	while (num <> 0) and (cantPares = 3)do begin
		dig:= (num MOD 10);
		if (dig MOD 2 = 0) do begin
			cantPares:= cantPares + 1;
		dig:= (num DIV 10);
	end;
	if cantPares = 3 do begin
		tiene3pares:= true;
	else;
		tiene3pares:= false;
	end; 
end;

actualizarMax(dni, cantCompras: integer, car maxDNI, maxCompras: integer);
begin
	if (cantCompras > maxCompras) then begin
	maxCompras:= cantCompras;
	maxDNI:= dni;
end;

procedure procesarCompras(L: lista, vec: vectorCategorias, var DNImax: integer, var montos: vectorMontos, var cantCompras: integer)
var
	DNIactual, cantComprasActual, cantComprasMax: integer;
begin
	cantCompras:= 0;
	inicializarVector(montos)
	cantComprasMax:= 0;
	
	while L <> NIL do begin
		DNIactual:= L^.dato.DNI;
		cantComprasActual:= 0;
		while (L <> NIL) and (DNIactual = L^.dato.DNI) do begin
			cantComprasActual:= cantComprasActual + 1;
			montos[L^.dato.categoria]:= montos[L^.dato.categoria] + [L^.dato.cantidadkg]*vec[L^.dato.categoria].precio;
			If tiene3pares(L^.dato.DNI) do begin
				cantCompras:= cantCompras + 1
			end;
			L:= L^.sig;
		end;
		actualMAX(DNIactual, cantComprasMax,DNImax, cantComprasActual);
	end;
end;

var
	l: lista;
	vec: vectorCategorias;
	DNImax, cantCompras: integer;
	montos: vectorMontos;
begin
	L:= NIL;
	cargarLista(L); // se dispone
	cargarCategorias(vec);
	procesarCompras(l, vec, DNImax, montos, cantCompras);
end.


























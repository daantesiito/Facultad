{Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales. De
cada evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2: cine, 
3: obra de teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de personas permitidas
para el evento y costo de la entrada. 
Se pide:
1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada venta se
debe guardar: código de venta, número de evento (1..100), DNI del comprador y cantidad de
entradas adquiridas. La lectura de las ventas finaliza con código de venta -1.
2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que
impares y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
personas permitidas.}

program punto11;

type
	tipoEventos = 1..5;
	numEventos = 1..100;
	evento = record
		nombre: string;
		tipo: tipoEventos;
		lugar: string;
		maxp: integer;
		costo: integer;
	end;
	
	vectorTipo = array[tipoEventos] of integer;
	
	venta = record
		cod_venta: integer;
		num_evento: numEventos;
		DNI: integer;
		cant_entradas: integer;
	end;
	
	vectorNumEvento = array[numEventos] of evento;
	
	lista = ^nodo;
	nodo = record
		dato: venta;
		sig: lista;
	end;
	
// procedure LeerEventos(var e: evento); - se dispone

procedure LeerVentas(var v: venta);
begin
	readln(v.cod_venta);
	readln(v.num_evento);
	readln(v.DNI);
	readln(v.cant_entradas);
end;

procedure AgregarAdelante(var l: lista; v: venta);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= v;
	aux^.sig:= l;
	l:= aux;
end;

procedure CargarLista(var l: lista);
var
	v: venta;
begin
	l:= nil;
	LeerVentas(v);
	while (v.cod_venta <> -1) do begin
		AgregarAdelante(l,v);
		LeerVentas(v);
	end;
end;

procedure procesar();
var
	min1, min2: integer;
begin
	while (l <> nil) do begin
		v[]
	end;
end;

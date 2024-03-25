program untitled;

type

	producto = record
		codigo: integer;
		totalvendidos: integer;
		montototal: integer;
	end;
	
	venta = record
		codigoventa: integer;
		codigoproducto: integer;
		unidadesvendidas: integer;
		precio: integer;
	end;

	arbol = ^nodo;
	nodo = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;


procedure leerventas(var v: venta);
begin
	writeln('codigo de venta: ');
	readln(v.codigoventa);
	if v.codigoventa <> -1 then begin
		writeln('codigo de producto: ');
		readln(v.codigoproducto);
		writeln('unidades vendidas: ');
		readln(v.unidadesvendidas);
		writeln('precio: ');
		readln(v.precio);
	end;
end;

procedure agregar(var a: arbol; v: venta);
begin
	if (a = nil) or (v.codigoproducto = a^.dato.codigo) then begin
		if a = nil then begin
			new(a);
			a^.dato.codigo:= v.codigoproducto;
			a^.dato.totalvendidos:= v.unidadesvendidas;
			a^.dato.montototal:= (v.unidadesvendidas * v.precio);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			a^.dato.totalvendidos:= a^.dato.totalvendidos + v.unidadesvendidas;
			a^.dato.montototal:= a^.dato.montototal + (v.unidadesvendidas * v.precio);
		end
	end
	else if (v.codigoproducto <= a^.dato.codigo) then
		agregar(a^.HI, v)
	else 
		agregar(a^.HD, v);
end;


{procedure agregar(var a: arbol; v: venta);
begin
	if a = nil then begin
		if (v.codigoproducto = a^.dato.codigo) then begin
			a^.dato.totalvendidos:= a^.dato.totalvendidos + v.unidadesvendidas;
			a^.dato.montototal:= a^.dato.montototal + (v.unidadesvendidas * v.precio);
		end
		else begin
			new(a);
			a^.dato.codigo:= v.codigoproducto;
			a^.dato.totalvendidos:= v.unidadesvendidas;
			a^.dato.montototal:= (v.unidadesvendidas * v.precio);
			a^.HI:= nil;
			a^.HD:= nil;
		end;	
	end
	else if (v.codigoproducto <= a^.dato.codigo) then
		agregar(a^.HI, v)
	else 
		agregar(a^.HD, v);
end;}


procedure imprimirarbol(a: arbol);
begin
	if a <> nil then begin
		imprimirarbol(a^.HI);
		writeln('codigo: ');
		writeln(a^.dato.codigo);
		writeln('total vendidos: ');
		writeln(a^.dato.totalvendidos);
		writeln('monto total: ');
		writeln(a^.dato.montototal);
		imprimirarbol(a^.HD);
	end;
end;

procedure mayorcantvendidas(a: arbol; var max,maxcode: integer);
begin
	if a <> nil then begin
		if a^.dato.totalvendidos > max then begin
			max:= a^.dato.totalvendidos;
			maxcode:= a^.dato.codigo;
		end;
		mayorcantvendidas(a^.HI, max,maxcode);
		mayorcantvendidas(a^.HD, max,maxcode);
	end;
end;

procedure buscarcodmenor (a: arbol; cod: integer; var cantcod: integer);
begin
	if a <> nil then begin
		if a^.dato.codigo < cod then begin
			cantcod:= cantcod + 1;
			buscarcodmenor(a^.HI,cod,cantcod);
			buscarcodmenor(a^.HD,cod,cantcod);
		end
		else
			buscarcodmenor(a^.HI,cod,cantcod);
	end;
end;

procedure buscarmontototal2cod(a: arbol; var cod1, cod2, sumamonto: integer);
begin
	if (a <> nil) then begin
		if a^.dato.codigo > cod1 then begin
			if a^.dato.codigo < cod2 then begin
				sumamonto:= sumamonto + a^.dato.montototal;
				buscarmontototal2cod(a^.HI, cod1, cod2, sumamonto);
				buscarmontototal2cod(a^.HD, cod1, cod2, sumamonto);
			end
			else
				buscarmontototal2cod(a^.HI, cod1, cod2, sumamonto);
		end
		else
			buscarmontototal2cod(a^.HD, cod1, cod2, sumamonto);
	end;
end;

var
	v: venta;
	a: arbol;
	max,maxcode,cod,cantcod,cod1, cod2, sumamonto: integer;
BEGIN
	leerventas(v);
	while v.codigoventa <> -1 do begin
		agregar(a,v);
		leerventas(v);
	end;
	imprimirarbol(a);
	max:= 0;
	mayorcantvendidas(a,max,maxcode);
	writeln('CODIGO CON MAS CANT VENDIDAS: ', maxcode, ' CON: ', max);
	writeln('Ingrese un codigo: ');
	readln(cod);
	cantcod:= 0;
	buscarcodmenor(a,cod,cantcod);
	writeln('La cantidad de codigos menores que hay son: ', cantcod);
	sumamonto:= 0;
	writeln('Inserte un codigo: ');
	readln(cod1);
	writeln('Inserte otro codigo: ');
	readln(cod2);
	buscarmontototal2cod(a, cod1, cod2, sumamonto);
	writeln('El monto total entre esos dos codigos es de: ', sumamonto);
END.


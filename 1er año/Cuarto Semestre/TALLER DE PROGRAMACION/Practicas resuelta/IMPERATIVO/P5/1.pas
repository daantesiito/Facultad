program p1prac5;
const
	dimF = 300;
type
	oficina = record
		codigo: integer;
		DNI: integer;
		valor: integer;
	end;
	
	vector = array [1..dimF] of oficina;
	
procedure leerOficinas(var o: oficina);
begin
	writeln('Ingrese el codigo de identificacion: ');
	readln(o.codigo);
	if (o.codigo <> -1) then begin
		writeln('Ingrese el DNI del propietario: ');
		readln(o.DNI);
		writeln('Ingrese el valor de la expensa: ');
		readln(o.valor);
	end;
end;

procedure LlenarVector(var v: vector; var dimL: integer);
var
	o: oficina;
begin
	leerOficinas(o);
	while (o.codigo <> -1) and (dimL <> 300) do begin
		dimL:= dimL + 1;
		v[dimL].codigo:= o.codigo;
		v[dimL].DNI:= o.DNI;
		v[dimL].valor:= o.valor;
		leerOficinas(o);
	end;
end;

procedure seleccion(var v: vector; dimL: integer);
var
	i, j, pos: integer;
	item : oficina;	
		
begin
	for i:=1 to dimL - 1 do begin
		pos := i;
		for j:= i+1 to dimL do
			if v[j].codigo < v[pos].codigo then pos:= j;
		item := v[pos];   
		v[pos] := v[i];   
		v[i] := item;
      end;
end;

procedure informarVector(v: vector; dimL: integer);
var
	i: integer;
begin
	for i := 1 to dimL do begin
		writeln(v[i].codigo);
		writeln(v[i].DNI);
		writeln(v[i].valor);
		writeln('');
	end;
end;

procedure buscarnumoficina(v: vector; dimL: integer; codOfi: integer; var posVec,dniVec: integer; var encontro: boolean);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		if (v[i].codigo = codOfi) then begin
			encontro:= True;
			posVec:= i;
			writeln(i);
			dniVec:= v[i].DNI
		end;
	end;
end;

procedure expensasTotal(v: vector; dimL,i: integer; var montoTotal: integer);
begin
	if (dimL <> 0) then begin
		i:= i + 1;
		dimL:= dimL - 1;
		montoTotal:= montoTotal + v[i].valor;
		expensasTotal(v,dimL,i,montoTotal);
	end;
end;

var
	v: vector;
	dimL,codOfi,posVec,dniVec,i,montoTotal: integer;
	encontro: boolean;
BEGIN
	dimL:= 0;
	encontro:= False;
	LlenarVector(v,dimL);
	
	writeln('---------------------------------------');
	
	seleccion(v,dimL);
	informarVector(v,dimL);
	
	writeln('---------------------------------------');
	
	writeln('Ingrese un Codigo a buscar: ');
	readln(codOfi);
	posVec:= 0;
	dniVec:= 0;
	buscarnumoficina(v,dimL,codOfi,posVec,dniVec,encontro);
	if encontro = True then begin
		writeln('Oficina encontrada, posicion: ', posVec);
		writeln('DNI del dueno: ', dniVec);
	end
	else begin
		writeln(posVec);
		writeln('Oficina NO encontrada');
		end;
		
	writeln('---------------------------------------');
	
	i:= 0;
	montoTotal:= 0;
	expensasTotal(v,dimL,i,montoTotal);
	writeln('La suma de las expensas es de: ', montoTotal);
	
END.

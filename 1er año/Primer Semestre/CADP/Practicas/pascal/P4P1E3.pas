{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y desde la
mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la posición
X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere que,
dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}

program P4P1E3;

const
	dimF = 10;
	
type
	vector = array [1..dimF] of integer;

//----------------------------------------------
procedure cargar(var v:vector; var dimL:integer);
var
	dato:integer;
begin
	dimL:=0;
	ReadLn(dato);
    while (dimL<dimF) do begin
        dimL:=dimL+1;
        v[dimL]:=dato;
        ReadLn(dato);
    end;
end;

//----------------------------------------------
procedure puntoA(var v:vector; var dimL2:integer);
var
	i: integer;
begin
	for i := 1 to dimL2 do begin
		writeln(v[i])
		end;
end;

//----------------------------------------------
procedure puntoB(var v:vector; var dimL2:integer);
var
	i: integer;
begin
	for i := dimL2 downto 1 do begin
		writeln(v[i])
		end;
end;

//----------------------------------------------
procedure puntoC(var v:vector; var dimL2:integer);
var
	i: integer;
	middle: integer;
begin
	middle:= (dimL2 DIV 2);
	for i := middle downto 1 do begin
		writeln(v[i])
		end;
end;

//----------------------------------------------
procedure puntoC2(var v:vector; var dimL2:integer);
var
	i: integer;
	middle: integer;
begin
	middle:= (dimL2 DIV 2 + 1);
	for i := middle to dimL2 do begin
		writeln(v[i]);
		end;
end;

//----------------------------------------------
procedure puntoD(var v:vector; var dimL3:integer);
var
	x, y: integer;
begin
	writeln('Inserte un X: ');
	readln(x);
	writeln('Inserte un Y: ');
	readln(y);
	if (x<y) then begin
		while (x<=y) do begin
			writeln(v[x]);
			x:= x + 1;
		end;
	end
	else begin
		while (x>=y) do begin
			writeln(v[x]);
			x:= x - 1;
		end;
	end;
end;

//----------------------------------------------
var
	dimL: integer;
	v: vector;
begin
	cargar(v,dimL);
	writeln('-----------------------------------------------');
	puntoA(v,dimL);
	writeln('-----------------------------------------------');
	puntoB(v,dimL);
	writeln('-----------------------------------------------');
	puntoC(v,dimL);
	writeln('-----------------------------------------------');
	puntoC2(v,dimL);
	writeln('-----------------------------------------------');
	puntoD(v,dimL);
end.

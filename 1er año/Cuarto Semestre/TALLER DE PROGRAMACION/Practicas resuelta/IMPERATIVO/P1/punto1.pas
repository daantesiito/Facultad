program ej1;
const
	dimF = 10;
type 
	cod = 1..15;
	cant= 1..99;
	productos = record
		dia: integer;
		codigo: cod;
		cantvendida: cant;
	end;
	
	vector = array [1..dimF] of productos;
	
procedure llenarVec(var v:vector);
var 
	i:integer;
	p:productos;
begin
	for i:= 1 to dimF do begin
		p.dia:= Random(31);
		p.codigo:= Random(16);
		//writeln('Ingrese la cant vendida');
		//readln(p.cantvendida);
		p.cantvendida:= Random(100);
		v[i]:=p;
	end;
end;

procedure imprimirA(v:vector);
var i:integer;
begin
	for i:= 1 to dimF do begin
		writeln(i);
		writeln('dia:', v[i].dia);
		writeln('cod. ',v[i].codigo);
		writeln('cantven: ', v[i].cantvendida);
		writeln('------------')
	end;
end;


procedure insercion( var v:vector);
var
	i,j:integer;
	p:productos;
begin
	for i:= 2 to dimF do begin
		p:= v[i];
		j:= i - 1;
		while (j >0) and (v[j].codigo > p.codigo) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= p;
  end;
end;
	
procedure eliminar(var v:vector; var dimL:integer);
var 
	pi,pf,salto:integer;
	i,j:integer;
	p1,p2:cod;
begin
	writeln('Ingrese desde que codigo quiere eliminar');
	readln(p1);
	writeln('hasta');
	readln(p2);
	i:=1;
	while (p1 > v[i].codigo) do i+=1;
	pi:=i;
	writeln('Pi: ',pi);
	while (v[i].codigo <= p2) do i+=1;
	pf:=i-1;
	writeln('Pf: ',pf);
		salto:= pf-pi+1;
	dimL:= dimF-salto;
	for j:= pf+1 to dimF do begin
		v[j-salto]:=v[j];
	end;
end;

procedure imprimirE(v:vector; dimL:integer);
var i:integer;
begin
	for i:= 1 to dimL do begin
		writeln(i);
		writeln('dia:', v[i].dia);
		writeln('cod. ',v[i].codigo);
		writeln('cantven: ', v[i].cantvendida);
		writeln('------------')
	end;
end;

function codigopar(num: integer): boolean;
var
	dig: integer;
begin
	codigopar:= False;
	dig:= num MOD 10;
	if ((dig MOD 2) = 0) then
		codigopar:= True;
end;

procedure imprimirG(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		if (codigopar(v[i].codigo) = True) then
			writeln('Codigo par: ', v[i].codigo, ' y Productos vendidos: ', v[i].cantvendida);
	end;
end;


VAR
	v:vector;
	dimL:integer;
Begin
	Randomize;
	llenarVec(v);
	imprimirA(v);
	writeln('___________________________________________________________');
	insercion(v);
	imprimirA(v);
	writeln('___________________________________________________________');
	eliminar(v,dimL);
	imprimirE(v,dimL);
	writeln('___________________________________________________________');
	imprimirG(v,dimL);
end.



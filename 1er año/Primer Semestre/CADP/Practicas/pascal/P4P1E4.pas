program P4P1E4;
const
	dimF= 100;
type
	vector = array [1..dimF] of integer;
//----------------------------------------------
procedure cargar(var v:vector; var dimL:integer);
var
	i: integer;
begin
	for i:= dimL to dimF do begin
		v[i]:=i;
	end;
end;

//----------------------------------------------
procedure posicion(var v:vector; var dimL:integer; var encX:integer);
var
	i, x: integer;
begin
	i:= 0;
	writeln('Ingrese un X: ');
	readln(x);
	for i:= dimL to dimF do begin
		v[i]:=i;
	end;
end;












begin

end.

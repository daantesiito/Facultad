program final;
type
	VectorContador = array['a'..'z'] of integer;
	
	vectorCaracteres = array [1..100] of char; // se dispone
		
procedure inicializarVector(var v: vectorContador);
var
	i: char;
begin
	for i:= 'a' to 'z' do begin
		v[i]:= 0;
	end;
end;

procedure llenarVectorContador(dimL: integer; var vCont: vectorContador; v: vectorCaracteres);
var
	i: integer;
	charActual: char;
begin
	i:= 0;
	while i < dimL do begin
		charActual:= v[i];
		while v[i] = charActual do begin
			vCont[v[i]]:= vCont[v[i]] + 1;
			i += 1;
		end;
	end;
end;

var
	v: vectorCaracteres;
	vCont: vectorContador;
	i: char;
	dimL: integer;
begin
	// llenarVectorCaracteres(v,dimL); se dispone
	inicializarVector(vCont);
	llenarVectorContador(dimL,vCont,v);
	for i:= 'a' to 'z' do begin
		writeln(vCont[i])
	end;
end.

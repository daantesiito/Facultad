program prueba;
var
	d: array [1..100] of integer;
	i: integer;
begin
	for i:= 1 to 100 do begin
		d[i]:= i;
	end;
	for i:= 1 to 100 do begin
		writeln(d[i]);
	end;
end.

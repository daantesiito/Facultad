program P1E5;
var
	num1, num2: real;
	contador: integer;
begin;
	writeln('Ingrese el primer numero: ');
	readln(num1);
	
	contador := 0;
	
	repeat;
		begin
			writeln('Ingrese un numero: ');
			readln(num2);
			contador := contador + 1;
		end;
	until (num2 = (num1 * 2)) or (contador = 10)
end.

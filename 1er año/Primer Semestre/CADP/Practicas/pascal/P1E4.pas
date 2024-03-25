program P1E4;
var
	num1, num2: real;
begin;
	writeln('Ingrese el primer numero: ');
	readln(num1);
	
	repeat
		begin
			writeln('Ingrese un numero: ');
			readln(num2);
		end
	until num2 = (num1 * 2);
end.

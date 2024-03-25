program P0E3;

var
	num1, num2, divi: real;
	
BEGIN
	writeln('Ingrese un numero: ');
	readln(num1);
	writeln('Ingrese un numero: ');
	readln(num2);
	
	divi := (num1 / num2);
	
	writeln('El resultado de la division es: ');
	writeln (divi:1:2);
END.

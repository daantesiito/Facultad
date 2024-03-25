program P0E2;

var
	num1, num2, suma: integer;
	
BEGIN
	writeln('Ingrese un numero: ');
	readln(num1);
	writeln('Ingrese un numero: ');
	readln(num2);
	
	suma := (num1 + num2);
	
	write('El resultado de la suma es: ', suma);
END.

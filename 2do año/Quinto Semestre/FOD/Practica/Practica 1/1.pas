// 1. Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
// incorporar datos al archivo. Los números son ingresados desde teclado. La carga finaliza
//  cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del
//  archivo debe ser proporcionado por el usuario desde teclado.

program ejercicio1;
type
	archivo_numeros = file of integer;
var
	numeros: archivo_numeros;
	nombre_fisico: string[12];
	num: integer;
begin
	write('Ingrese el nombre del archivo: ');
	readln(nombre_fisico);
	
	assign(numeros, nombre_fisico);
	rewrite(numeros);
	
	writeln('Ingrese un numero para agregar: ');
	readln(num);
	
	while (num <> 30000) do begin
		write(numeros,num);
		writeln('Ingrese un numero para agregar: ');
		readln(num);
	end;
	close(numeros);
end.

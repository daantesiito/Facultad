{2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creado en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el
promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla.}

program ejercicio2;
type	
	archivo_numeros = file of integer;
var
	numeros: archivo_numeros;
	nombre_fisico: string;
	i,total_numeros,suma_numeros,menores_a_1500: integer;
	promedio_numeros: real;
	
begin
	i:= 0;
	total_numeros:= 0;
	suma_numeros:= 0;
	menores_a_1500:= 0;
	promedio_numeros:= 0;
	writeln('Ingrese nombre del archivo: ');
	readln(nombre_fisico);
	
	assign(numeros,nombre_fisico);
	
	reset(numeros);
	
	while not EOF(numeros) do begin
		read(numeros,i);
		writeln(i); // Imprime en pantalla cada numero.
		total_numeros:= total_numeros + 1;
		suma_numeros:= suma_numeros + i;
		if i < 1500 then 
			menores_a_1500:= menores_a_1500 + 1;
	end;
	
	promedio_numeros:= suma_numeros / total_numeros;
	
	writeln('Promedio de todos los numeros: ', promedio_numeros);
	
	writeln('Numeros menores a 1500: ', menores_a_1500);
	
	close(numeros);
end.

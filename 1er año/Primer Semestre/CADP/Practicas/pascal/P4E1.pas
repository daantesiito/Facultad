// 10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo sumo 300 empleados). 
// La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se completa el vector.
// Una vez finalizada la carga de datos se pide:
// a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
// módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
// retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
// b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.

program P4E10
const
	max: 300
type
	rango: 1..max
	salario: array[rango] of integer;

var
	

procedure leer(var s: salario);
var
	i: integer;
begin
	i:= 0;
	for i: 1 to max do begin
		while (i[s] < 300) or (salario = 0) do begin
		writeln('Ingrese su salario: ');
		readln(salario);
		
		
		
		if (distancia <> 0) then begin
			writeln('Ingrese monto de dinero transportado: ');
			readln(dinero);
			writeln('Ingrese el dia del viaje: ');
			readln(dia);
		end;
	end;
end;


begin

end.

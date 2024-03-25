{3. Realizar un programa que presente un menú con opciones para:
a. Crear un archivo de registros no ordenados de empleados y completarlo con
datos ingresados desde teclado. De cada empleado se registra: número de
empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con
DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido.}

program ejercicio3a;
type
	empleado = record
		num: integer;
		apellido: string;
		nombre: string;
		edad: integer;
		DNI: integer;
	end;
	
	archivo_empleados = file of empleado;
var	
	empleados: archivo_empleados;
	nombre_fisico: string;
	emp: empleado;
	
procedure LeerEmpleados(var emp: empleado);
begin
	writeln('Ingrese su apellido: ');
	readln(emp.apellido);
	if (emp.apellido <> 'fin') then begin
		writeln('Ingrese su nombre: ');
		readln(emp.nombre);
		writeln('Ingrese su numero de empleado: ');
		readln(emp.num);
		writeln('Ingrese su edad: ');
		readln(emp.edad);
		writeln('Ingrese su DNI: ');
		readln(emp.DNI);
	end;
end;

begin
	writeln('Ingrese nombre de archivo: ');
	readln(nombre_fisico);
	
	assign(empleados,nombre_fisico);
	rewrite(empleados);
	
	LeerEmpleados(emp);
	while (emp.apellido <> 'fin') do begin
		write(empleados, emp);
		LeerEmpleados(emp);
	end;
	
	close(empleados);
end.

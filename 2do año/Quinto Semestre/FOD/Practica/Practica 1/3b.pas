{3b. Abrir el archivo anteriormente generado y
i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
determinado, el cual se proporciona desde el teclado.
ii. Listar en pantalla los empleados de a uno por línea.
iii. Listar en pantalla los empleados mayores de 70 años, próximos a jubilarse.}

program ejercicio3b;
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
	opcion, nom_o_ape: string;

procedure MostrarPantalla(emp: empleado);
begin
	writeln('-----------------------------');
	write('Numero de empleado: ');
	writeln(emp.num); // se lee el empleado
	write('Apellido: ');
	writeln(emp.apellido); // se lee el empleado
	write('Nombre: ');
	writeln(emp.nombre); // se lee el empleado
	write('Edad: ');
	writeln(emp.edad); // se lee el empleado
	write('DNI: ');
	writeln(emp.DNI); // se lee el empleado
end;
	
begin
	writeln('Ingrese el nombre del archivo: ');
	readln(nombre_fisico);
	
	assign(empleados,nombre_fisico);
	
	reset(empleados);
	
	writeln('Elija una opcion: (1, 2, 3): ');
	readln(opcion);
	
	case opcion of
		'1':
			begin
				writeln('Ingrese el nombre o apellido a buscar: ');
				readln(nom_o_ape);
				while not EOF(empleados) do begin
					read(empleados,emp);
					if (emp.nombre = nom_o_ape) or (emp.apellido = nom_o_ape) then begin
						MostrarPantalla(emp);
					end;
				end;
			end;
		'2':
			begin
				while not EOF(empleados) do begin
					read(empleados,emp); // se recorre el archivo EMPLEADOS con la i iterando.
					MostrarPantalla(emp);
				end;
			end;
		'3':
			begin
				while not EOF(empleados) do begin
					read(empleados,emp);
					if (emp.edad > 70) then begin
						MostrarPantalla(emp);
					end;
				end;
			end;
	end;
	
	close(empleados);
	
end.

{3b. Abrir el archivo anteriormente generado y
i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
determinado, el cual se proporciona desde el teclado.
ii. Listar en pantalla los empleados de a uno por línea.
iii. Listar en pantalla los empleados mayores de 70 años, próximos a jubilarse.}

program ejercicio1practica3;
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
	empMod: integer;
	carga: Text;
	cargado: boolean;

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

function EmpleadoExistente(var emp: archivo_empleados; numEmp: integer): boolean;
var
	e: empleado;
begin
	EmpleadoExistente:= False;
	seek(emp,0);
	while not EOF(emp) do begin
		read(emp,e);
		if (e.num = numEmp) then begin
			EmpleadoExistente:= True;
			break
		end;
	end;
end;

begin
	writeln('Ingrese el nombre del archivo: ');
	readln(nombre_fisico);
	
	assign(empleados,nombre_fisico);
	
	reset(empleados);
	
	writeln('Elija una opcion: (1, 2, 3, 4, 5, 6, 7, 8): ');
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
		'4': // inciso 4.a
			begin
				LeerEmpleados(emp);
				while (emp.apellido <> 'fin') do begin
					seek(empleados,fileSize(empleados));
					if not EmpleadoExistente(empleados,emp.num) then
						write(empleados, emp);
					LeerEmpleados(emp);
				end;
			end;
		'5': // inciso 4.b
			begin
				writeln('Ingrese un numero de empleado para modificar su edad: ');
				readln(empMod);
				while not EOF(empleados) do begin
					read(empleados,emp);
					if (emp.num = empMod) then begin
						seek(empleados, filePos(empleados)-1);
						writeln('Ingrese la edad de ', emp.nombre, ' para modificarla: ');
						readln(emp.edad);
						write(empleados, emp);
						writeln('Hecho!');
					end;
				end;
			end;
		'6': // inciso 4.c
			begin
				
				nombre_fisico := 'todos_empleados.txt';
				
				assign(carga, nombre_fisico);
				
				rewrite(carga);
				
				while not EOF(empleados) do begin
					read(empleados,emp);
					writeln(carga, 'Num: ',emp.num, ' Apellido: ',emp.apellido, ' Nombre: ',emp.nombre, ' Edad: ',emp.edad, ' DNI: ',emp.DNI);
				end;
				
				writeln('Archivo: "todos_empleados.txt" creado!');
				
				close(carga);
			end;
		'7': // inciso 4.d
			begin
				nombre_fisico := 'faltaDNIEmpleado.txt';
				
				assign(carga,nombre_fisico);
				
				rewrite(carga);
				
				cargado:= False;
				
				while not EOF(empleados) do begin
					read(empleados,emp);
					if (emp.DNI = 0) then
						writeln(carga, 'Num: ',emp.num, ' Apellido: ',emp.apellido, ' Nombre: ',emp.nombre, ' Edad: ',emp.edad, ' DNI: ',emp.DNI);
						cargado:= True;
				end;
				
				if cargado = True then
					writeln('Archivo: "faltaDNIEmpleado.txt" creado!')
				else
					writeln('Archivo: "faltaDNIEmpleado.txt" no creado ya que no hay empleados con DNI 0.');
				
				close(carga);
			end;
		'8':
			begin
				ok:= False;
				seek(empleados, fileSize(empleados)-1);
				read(empleados, datoFinal);
				seek(empleados, 0);
				while not EOF(empleados) and not ok do begin
					read(empleados,emp);
					if emp.num = 0 then begin
						seek(empleados,filePos(empleados-1));
						write(empleados,datoFinal);
						seek(empleados,fileSize(empleados)-1);
						truncate(empleados);
					end;
				end;
				if ok then
					writeln('Archivo truncado');
				else
					writeln('Archivo no truncado');
			end;
	end;
	
	close(empleados);
	
end.

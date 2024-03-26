program ej1;
const
	valor_alto = 9999;
type
	empleado = record
		codigo: integer;
		nombre: string;
		monto: integer;
	end;
	
	archivo_empleados = file of empleado;
	
	archivo_comisiones = file of empleado;
	
procedure leer(var empleados: archivo_empleados; var emp: empleado);
begin
	if (not(EOF(empleados))) then 
		read (empleados, emp)
	else 
		emp.codigo := valor_alto;
end;

procedure compactarArchivo(var empleados: archivo_empleados; var comisiones: archivo_comisiones);
var
	emp: empleado;
	nombre_fisico: String;
	regActual: empleado;
begin
	writeln('Ingrese el archivo de empleados a compactar: ');
	readln(nombre_fisico);
	assign(empleados,nombre_fisico);
	writeln('Ingrese el nombre del archivo a crear compactado: ');
	readln(nombre_fisico);
	assign(comisiones,nombre_fisico);
	reset(empleados);
	rewrite(comisiones);
	leer(empleados, emp);
	while (emp.codigo <> valor_alto) do begin
		regActual.codigo:= emp.codigo;
		regActual.monto:= 0;
		while (regActual.codigo = emp.codigo) do begin
			regActual.monto:= regActual.monto + emp.monto;
			leer(empleados,emp);
		end;
		write(comisiones,regActual)
	end;
	close(empleados);
	close(comisiones);
end;

var
	empleados: archivo_empleados;
	comisiones: archivo_comisiones;
begin
	compactarArchivo(empleados,comisiones);
end.

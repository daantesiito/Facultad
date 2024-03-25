program ejercicio5parte2;
type
	celular = record
		codigo: integer;
		nombre: string;
		descripcion: string;
		marca: string;
		precio: integer;
		stockMinimo: integer;
		stockDisponible: integer;
	end;
	
	archivo_celulares = file of celular;

procedure ImprimirOpciones(var opcion: integer);
begin
	writeln('************************************************');
	writeln('*               ELIJA UNA OPCION               *');
	writeln('*----------------------------------------------*');
	writeln('*1: Crear binario por txt                      *');
	writeln('*                                              *');
	writeln('*2: Listar stock menor a disponible            *');
	writeln('*                                              *');
	writeln('*3: Listar descripciones                       *');
	writeln('*                                              *');
	writeln('*4: Crear txt por binario                      *');
	writeln('*                                              *');
	writeln('*5: Agregar celulares                          *');
	writeln('*                                              *');
	writeln('*6: Modificar Stock de un celular existente    *');
	writeln('*                                              *');
	writeln('*7: Exportar celulares sin stock               *');
	writeln('*                                              *');
	writeln('*8: Salir                                      *');
	writeln('************************************************');
	
	readln(opcion);
	
end;

procedure CargarArchivoBin(var celulares: archivo_celulares; var celularestxt: Text);
var
	cel: celular;
	nombre_fisico: string;
begin
	writeln('Ingrese el nombre del archivo binario nuevo: ');
	readln(nombre_fisico);
	assign(celulares, nombre_fisico);
	assign(celularestxt, 'celulares.txt'); // Se asigna el nombre del archivo de texto
	reset(celularestxt); // Se abre el archivo de texto
	reset(celulares);
	while not EOF(celularestxt) do begin
		readln(celularestxt, cel.codigo, cel.precio, cel.marca);
		readln(celularestxt, cel.stockDisponible, cel.stockMinimo, cel.descripcion);
		readln(celularestxt, cel.nombre);
		write(celulares, cel);
	end;
	writeln('Archivo cargado con exito!');
	close(celulares);
	close(celularestxt); // Se cierra el archivo de texto
end;

procedure ListarStockMenor();
var
	cel: celular;
	celulares: archivo_celulares;
	nombre_fisico: string;
begin
	writeln('Ingrese el nombre del archivo binario a analizar: ');
	readln(nombre_fisico);
	assign(celulares,nombre_fisico);
	reset(celulares);
	while not EOF(celulares) do begin
		read(celulares,cel);
		if (cel.stockDisponible < cel.stockMinimo) then begin
			writeln('Codigo: ', cel.codigo, 'Precio: ', cel.precio, 'Marca: ', cel.marca);
			writeln('Stock Disponible: ', cel.stockDisponible,'Stock Minimo: ', cel.stockMinimo,'Descripcion: ', cel.descripcion);
			writeln('Nombre: ', cel.nombre);
		end;
	end;
	close(celulares);
end;

procedure ListarDescripcion();
var
	cel: celular;
	descComparar: string;
	celulares: archivo_celulares;
	nombre_fisico: string;
begin
	writeln('Ingrese el nombre del archivo binario a analizar: ');
	readln(nombre_fisico);
	assign(celulares,nombre_fisico);
	reset(celulares);
	writeln('Ingrese una cadena a comparar: ');
	readln(descComparar);
	while not EOF(celulares) do begin
		read(celulares,cel);
		if pos(descComparar,cel.descripcion) > 0 then begin
			writeln('Codigo: ', cel.codigo, 'Precio: ', cel.precio, 'Marca: ', cel.marca);
			writeln('Stock Disponible: ', cel.stockDisponible,'Stock Minimo: ', cel.stockMinimo,'Descripcion: ', cel.descripcion);
			writeln('Nombre: ', cel.nombre);
		end;
	end;
	close(celulares);
end;

procedure ExportarATexto();
var
	celulares: archivo_celulares;
	nombre_fisico: string;
	celularestxt: Text;
	cel: celular;
begin
	writeln('Ingrese el nombre del binario a pasar a txt: ');
	readln(nombre_fisico);
	assign(celulares,nombre_fisico);
	reset(celulares);
	assign(celularestxt,'celulares.txt');
	rewrite(celularestxt);
	while not EOF(celulares) do begin
		read(celulares,cel);
		writeln(celularestxt,cel.codigo,' ',cel.precio,' ',cel.marca);
		writeln(celularestxt,cel.stockDisponible,' ',cel.stockMinimo,' ',cel.descripcion);
		writeln(celularestxt,cel.nombre);
	end;
	writeln('Archivo pasado a txt!');
	close(celulares);
	close(celularestxt);
end;

procedure LeerCelulares(var cel: celular);
begin
	writeln('Ingrese el codigo del celular: ');
	readln(cel.codigo);
	if (cel.codigo <> 0) then begin
		writeln('Ingrese el nombre del celular: ');
		readln(cel.nombre);
		writeln('Ingrese la descripcion del celular: ');
		readln(cel.descripcion);
		writeln('Ingrese la marca del celular: ');
		readln(cel.marca);
		writeln('Ingrese el precio del celular: ');
		readln(cel.precio);
		writeln('Ingrese el stock minimo del celular: ');
		readln(cel.stockMinimo);
		writeln('Ingrese el stock disponible del celular: ');
		readln(cel.stockDisponible);		
	end;
end;

procedure AnadirCelulares();
var
	cel: celular;
	celulares: archivo_celulares;
	nombre_fisico: string;
begin
	writeln('Ingrese el nombre del archivo a modificar: ');
	readln(nombre_fisico);
	assign(celulares,nombre_fisico);
	reset(celulares);
	LeerCelulares(cel);
	if (cel.codigo <> 0) then begin
		seek(celulares,filesize(celulares));
		write(celulares,cel);
		writeln('Celular añadido correctamente! ');
	end;
	close(celulares);
end;

procedure ModificarStock();
var
	cel: celular;
	celulares: archivo_celulares;
	nombre_fisico: string;
	codModificar: integer;
	stockModificar: integer;
begin
	writeln('Ingrese el nombre del archivo a modificar: ');
	readln(nombre_fisico);
	assign(celulares,nombre_fisico);
	reset(celulares);
	writeln('Ingrese un codigo para modificar su stock disponible: ');
	readln(codModificar);
	while not EOF(celulares) do begin
		read(celulares,cel);
		if (codModificar = cel.codigo) then begin
			writeln('Ingrese el stock modificado de ', cel.nombre, ': ');
			readln(stockModificar);
			cel.stockDisponible:= stockModificar;
			seek(celulares,filepos(celulares)-1);
			write(celulares,cel);
			writeln('Stock modificado correctamente! ');
		end;
	end;
	close(celulares);
end;

procedure ExportarATextoSinStock();
var
	cel: celular;
	celulares: archivo_celulares;
	nombre_fisico: string;
	celularestxt: Text;
begin
	writeln('Ingrese el nombre del archivo binario a exportar a txt: ');
	readln(nombre_fisico);
	assign(celulares,nombre_fisico);
	reset(celulares);
	assign(celularestxt,'SinStock.txt');
	rewrite(celularestxt);
	while not EOF(celulares) do begin
		read(celulares,cel);
		if (cel.stockDisponible = 0) then begin
			writeln(celularestxt,cel.codigo,' ',cel.precio,' ',cel.marca);
			writeln(celularestxt,cel.stockDisponible,' ',cel.stockMinimo,' ',cel.descripcion);
			writeln(celularestxt,cel.nombre);
			writeln('Archivo SinStock.txt creado con celulares dentro. ');
		end;
	end;
	close(celulares);
	close(celularestxt);
end;

var
	celularestxt: Text;
	celulares: archivo_celulares;
	opcion: integer;
	
begin
	while True do begin
		ImprimirOpciones(opcion);
		case opcion of
			1: // inciso 5a
			begin
				CargarArchivoBin(celulares,celularestxt);
			end;
			2: // inciso 5b
			begin				
				ListarStockMenor();
			end;
			3: // inciso 5c
			begin
				ListarDescripcion();
			end;
			4: // inciso 5d
			begin
				ExportarATexto();
			end;
			5: // inciso 6a
			begin
				AnadirCelulares();
			end;
			6: // inciso 6b
			begin
				ModificarStock();
			end;
			7: // inciso 6c
			begin
				ExportarATextoSinStock();
			end;
			8: // Romper el while True.
			begin
				break;
			end;
		end;
	end;
end.

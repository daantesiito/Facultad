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
	writeln('****************************');
	writeln('*     ELIJA UNA OPCION     *');
	writeln('*                          *');
	writeln('*1: Crear binario por txt  *');
	writeln('*                          *');
	writeln('*2: Listar stock menor     *');
	writeln('*   a disponible           *');
	writeln('*                          *');
	writeln('*3: Listar descripciones   *');
	writeln('*                          *');
	writeln('*4: Crear txt por binario  *');
	writeln('*                          *');
	writeln('*5: Salir                  *');
	writeln('****************************');
	
	readln(opcion);
	
end;

procedure CargarArchivoBin(var celulares: archivo_celulares; var celularestxt: Text);
var
	cel: celular;
	nombre_fisico: string;
begin
	writeln('Ingrese el nombre del archivo binario nuevo: ');
	readln(nombre_fisico);
	assign(celulares,nombre_fisico);
	assign(celularestxt,'celulares.txt');
	reset(celularestxt);
	rewrite(celulares);
	while not EOF(celularestxt) do begin
		readln(celularestxt,cel.codigo,cel.precio,cel.marca);
		readln(celularestxt,cel.stockDisponible,cel.stockMinimo,cel.descripcion);
		readln(celularestxt,cel.nombre);
		write(celulares,cel);
	end;
	writeln('Archivo cargado con exito!');
	close(celulares);
	close(celularestxt);
end;

procedure ListarStockMenor(var celularestxt: Text);
var
	cel: celular;
begin
	assign(celularestxt,'celulares.txt');
	reset(celularestxt);
	while not EOF(celularestxt) do begin
		readln(celularestxt,cel.codigo,cel.precio,cel.marca);
		readln(celularestxt,cel.stockDisponible,cel.stockMinimo,cel.descripcion);
		readln(celularestxt,cel.nombre);
		if (cel.stockDisponible < cel.stockMinimo) then begin
			writeln('Codigo: ', cel.codigo, 'Precio: ', cel.precio, 'Marca: ', cel.marca);
			writeln('Stock Disponible: ', cel.stockDisponible,'Stock Minimo: ', cel.stockMinimo,'Descripcion: ', cel.descripcion);
			writeln('Nombre: ', cel.nombre);
		end;
	end;
	close(celularestxt);
end;

procedure ListarDescripcion(var celularestxt: Text);
var
	cel: celular;
	descComparar: string;
begin
	assign(celularestxt,'celulares.txt');
	reset(celularestxt);
	writeln('Ingrese una cadena a comparar: ');
	readln(descComparar);
	while not EOF(celularestxt) do begin
		readln(celularestxt,cel.codigo,cel.precio,cel.marca);
		readln(celularestxt,cel.stockDisponible,cel.stockMinimo,cel.descripcion);
		readln(celularestxt,cel.nombre);
		if pos(descComparar,cel.descripcion) > 0 then begin
			writeln('Codigo: ', cel.codigo, 'Precio: ', cel.precio, 'Marca: ', cel.marca);
			writeln('Stock Disponible: ', cel.stockDisponible,'Stock Minimo: ', cel.stockMinimo,'Descripcion: ', cel.descripcion);
			writeln('Nombre: ', cel.nombre);
		end;
	end;
	close(celularestxt);
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
		writeln(celularestxt,cel.codigo,cel.precio,cel.marca);
		writeln(celularestxt,cel.stockDisponible,cel.stockMinimo,cel.descripcion);
		writeln(celularestxt,cel.nombre);
	end;
	writeln('Archivo pasado a txt!');
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
			1: // inciso a
			begin
				CargarArchivoBin(celulares,celularestxt);
			end;
			2: // inciso b
			begin				
				ListarStockMenor(celularestxt);
			end;
			3: // inciso c
			begin
				ListarDescripcion(celularestxt);
			end;
			4: // inciso d
			begin
				ExportarATexto();
			end;
			5: // Romper el while True.
			begin
				break;
			end;
		end;
	end;
end.

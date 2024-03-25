program ejercicio7parte2;
type
	novela = record
		codigo: integer;
		nombre: string;
		genero: string;
		precio: integer;
	end;
	
	archivo_novelas = file of novela;

procedure ImprimirOpciones(var opcion: integer);
begin
	writeln('************************');
	writeln('*   ELIJA UNA OPCION   *');
	writeln('*----------------------*');
	writeln('*1: Exportar txt a bin *');
	writeln('*                      *');
	writeln('*2: Agregar Novela     *');
	writeln('*                      *');
	writeln('*3: Modificar Novela   *');
	writeln('*                      *');
	writeln('*4: Exportar bin a txt *');
	writeln('*                      *');
	writeln('*5: Salir              *');
	writeln('*                      *');
	writeln('************************');
	readln(opcion);
end;

procedure CargarBinarioDesdeTXT(var novelastxt: Text; var novelas: archivo_novelas);
var
	nov: novela;
	nombre_fisico: string;

begin
	writeln('Ingrese el nombre del nuevo archivo binario: ');
	readln(nombre_fisico);
	assign(novelas,nombre_fisico);
	assign(novelastxt,'novelas.txt');
	reset(novelastxt);
	rewrite(novelas);
	while not EOF(novelastxt) do begin
		readln(novelastxt,nov.codigo,nov.precio,nov.genero);
		readln(novelastxt,nov.nombre);
		write(novelas,nov);
	end;
	writeln('Archivo binario cargado con exito!');
	close(novelas);
	close(novelastxt);
end;

procedure LeerNovelas(var nov: novela);
begin
	writeln('Ingrese el codigo de la novela: ');
	readln(nov.codigo);
	if nov.codigo <> 0 then begin
		writeln('Ingrese el nombre de la novela: ');
		readln(nov.nombre);
		writeln('Ingrese el genero de la novela: ');
		readln(nov.genero);
		writeln('Ingrese el precio de la novela: ');
		readln(nov.precio);
	end;
end;

procedure AgregarNovela();
var
	nov: novela;
	novela: archivo_novelas;
	nombre_fisico: string;
begin
	writeln('Ingrese el nombre del archivo binario para añadir una novela: ');
	readln(nombre_fisico);
	assign(novela,nombre_fisico);
	reset(novela);
	LeerNovelas(nov);
	if (nov.codigo <> 0) then begin
		seek(novela,filesize(novela));
		write(novela,nov);
		writeln('Novela agregada correctamente');
	end;
	close(novela);
end;

procedure ModificarNovela();
var
	nov: novela;
	novelas: archivo_novelas;
	nombre_fisico: string;
	codModificar: integer;
begin
	writeln('Ingrese el nombre del archivo a modificar: ');
	readln(nombre_fisico);
	assign(novelas,nombre_fisico);
	reset(novelas);
	writeln('Ingrese el codigo de la novela a modificar: ');
	readln(codModificar);
	while not EOF(novelas) do begin
		read(novelas,nov);
		if (nov.codigo = codModificar) then begin
			LeerNovelas(nov);
			seek(novelas,filepos(novelas)-1);
			write(novelas,nov);
			writeln('Novela modificada correctamente!');
		end;
	end;
	close(novelas);
end;

procedure ExportarATexto();
var
	nov: novela;
	novelas: archivo_novelas;
	nombre_fisico: string;
	novelastxt: Text;
begin
	writeln('Ingrese el nombre del binario a pasar a txt: ');
	readln(nombre_fisico);
	assign(novelas,nombre_fisico);
	reset(novelas);
	assign(novelastxt,'novelas.txt');
	rewrite(novelastxt);
	while not EOF(novelas) do begin
		read(novelas,nov);
		writeln(novelastxt,nov.codigo,' ',nov.precio,' ',nov.genero);
		writeln(novelastxt,nov.nombre);
	end;
	writeln('Archivo pasado a txt!');
	close(novelas);
	close(novelastxt);
end;

var
	novelastxt: Text;
	novelas: archivo_novelas;
	opcion: integer;
begin
	while True do begin
		ImprimirOpciones(opcion);
		case opcion of
			1:
			begin
				CargarBinarioDesdeTXT(novelastxt,novelas);;
			end;
			2:
			begin
				AgregarNovela();
			end;
			3:
			begin
				ModificarNovela();
			end;
			4:
			begin
				ExportarATexto();
			end;
			5:
			begin
				break;
			end;
		end;
	end;
end.



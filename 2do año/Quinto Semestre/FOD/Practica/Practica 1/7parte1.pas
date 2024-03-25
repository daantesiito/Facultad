program ejercicio7parte1;
type
	novela = record
		codigo: integer;
		nombre: string;
		genero: string;
		precio: integer;
	end;
	
	archivo_novelas = file of novela;
	
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

procedure CargarTXT(var novelastxt: Text);
var
	nov: novela;
begin
	assign(novelastxt,'novelas.txt');
	rewrite(novelastxt);
	LeerNovelas(nov);
	while (nov.codigo <> 0) do begin
		writeln(novelastxt,nov.codigo,' ',nov.precio,' ',nov.genero);
		writeln(novelastxt,nov.nombre);
		LeerNovelas(nov);
	end;
	close(novelastxt);
end;

var
	novelastxt: Text;
begin
	CargarTXT(novelastxt);
end.

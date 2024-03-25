program ejercicio5PrimeraParte;
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

var
	cel: celular;
	celularestxt: Text;
	nombre_fisico: string;

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

BEGIN
	nombre_fisico:= 'celulares.txt';
	
	assign(celularestxt,nombre_fisico);
	
	rewrite(celularestxt);
	
	LeerCelulares(cel);
	while (cel.codigo <> 0) do begin
		writeln(celularestxt, ' ',cel.codigo, ' ',cel.precio, ' ',cel.marca, ' ',cel.stockDisponible, ' ',cel.stockMinimo, ' ',cel.descripcion, ' ',cel.nombre);
		LeerCelulares(cel);
	end;
	
	close(celularestxt);
END.


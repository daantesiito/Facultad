program ejercicio4crear;
const
	valoralto = 'xxxx';
type
	provincia = record
        nombre: string;
        totalAlfa: integer;
        totalEncu: integer;
    end;

    agenciaCenso = record
        nombre: string;
        codigo: integer;
        cantAlfa: integer;
        cantEncu: integer;
    end;
	
	archivo_provincias = file of provincia;

    archivo_agenciaCensos = file of agenciaCenso;

procedure LeerProvincias(var p: provincia);
begin
	writeln('Ingrese el nombre de la provincia: ');
	readln(p.nombre);
	if (p.nombre <> 'zzz') then begin
		p.totalAlfa:= 0;
		p.totalEncu:= 0;
	end;
end;

procedure LeerCensos(var ac: agenciaCenso);
begin
    writeln('Ingrese el nombre de la provincia: ');
    readln(ac.nombre);
    if (ac.nombre <> 'zzz') then begin
        writeln('Ingrese el codigo de la provincia: ');
        readln(ac.codigo);
        writeln('Ingrese la cantidad de alfabetizados: ');
        readln(ac.cantAlfa);
        writeln('Ingrese la cantidad de encuestados: ');
        readln(ac.cantEncu);
    end;
end;

var
    p: provincia;
    ac: agenciaCenso;
    provincias: archivo_provincias;
    agenciaCensos: archivo_agenciaCensos;
    opcion: integer;
    nombre_fisico: string;
    provinciastxt: Text;
begin
    writeln('Archivo PROVINCIAS (1) / Archivo CENSOS (2) / Crear TXT de provincias (3)');
    readln(opcion);
    case opcion of
        1:
        begin
            writeln('Ingrese el nombre del archivo de provincias: ');
            readln(nombre_fisico);
            assign(provincias,nombre_fisico);
            rewrite(provincias);
            LeerProvincias(p);
            while (p.nombre <> 'zzz') do begin
                write(provincias,p);
                LeerProvincias(p);
            end;
            writeln('Archivo productos creado exitosamente!');
            close(provincias);
        end;
        2:
        begin
            writeln('Ingrese el nombre del archivo de agenciaCenso: ');
            readln(nombre_fisico);
            assign(agenciaCensos,nombre_fisico);
            rewrite(agenciaCensos);
            LeerCensos(ac);
            while (ac.nombre <> 'zzz') do begin
                write(agenciaCensos,ac);
                LeerCensos(ac);
            end;
            writeln('Archivo ventas creado exitosamente!');
            close(agenciaCensos);
        end;
        3:
		begin
			//writeln('Ingrese el nombre del archivo txt nuevo: ');
			//readln(nombre_fisico);
			assign(provinciastxt,'provincias.txt');
			assign(provincias,'provincias');
			rewrite(provinciastxt);
			reset(provincias);
			while not EOF(provincias) do begin
				read(provincias,p);
				writeln(provinciastxt, 'Nombre: ',p.nombre, ' Total Alfabetizados: ',p.totalAlfa, ' Total Encuestados: ',p.totalEncu);
			end;
			writeln('Archivo txt creado exitosamente!');
			close(provincias);
			close(provinciastxt);
		end;
    end;
end.

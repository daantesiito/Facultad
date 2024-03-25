program ej1;
type
		vectorApro = array [1..36] of integer;

		alumnos = record
				apellido: string;
				nmero: integer;
				ingreso: integer;
				matAprobadas: integer;
				nota: vectorApro;
		end;
		
		lista = ^nodo;
		nodo = record
			dato: alumnos;
			sig: lista;
		end;
		
		procedure cargarlista(var l:lista; d:alumnos);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:= d;
			nue^.sig:=l;
			l:=nue;
		end;
		
		procedure leer(var a:alumnos);
		var
			n,i:integer;
			
		begin 
			readln(a.apellido);
			readln(a.nmero);
			readln(a.ingreso);
			readln(a.matAprobadas);
			if (a.matAprobadas>0) then
				for i:= 1 to a.matAprobadas do begin
					readln(n);
					a.nota[i]:= n;
				end;
		end;
		
		procedure procesarAlumnos(var l:lista);
		var 
			a:alumnos;
		begin
			repeat
				leer(a);
				cargarlista(l,a);
			until a.nmero = 11111;
		end;
		
		procedure promedio(l:lista);
		var
			prom:real;
			suma,i:integer;
		begin
			while (l<>nil) do begin
				suma:=0;
				for i:=1 to l^.dato.matAprobadas do suma+= l^.dato.nota[i];
				prom:= suma/l^.dato.matAprobadas;
				writeln(prom,l^.dato.nmero);
				l:=l^.sig;
				prom:=0;
			end;
		end;
		
		var
		l:lista;
		begin
			l:=nil;
			procesarAlumnos(l);
			promedio(l);
		end.

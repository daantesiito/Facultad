program P0E4;

var
	diametro, radio, area, perimetro: real;
	
BEGIN
	writeln('Ingrese el diametro: ');
	readln(diametro);
	
	radio:= (diametro / 2);
	
	area:= (pi * (radio*radio));
	
	perimetro:= (diametro * pi);
	
	writeln('El radio es: ', radio:1:2);
	writeln('El area es: ', area:1:2);
	writeln('El perimetro es: ', perimetro:1:2);
END.

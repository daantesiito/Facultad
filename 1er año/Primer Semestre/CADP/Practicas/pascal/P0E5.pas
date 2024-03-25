program P0E5;

var
	cca, ccl, cuentadu, cuentacl: integer;
	dinero: real;
BEGIN
	writeln('Cantidad de caramelos que posee: ');
	readln(cca);
	
	writeln('Cantidad de clientes: ');
	readln(ccl);
	
	cuentacl:=(cca div ccl);
	
	cuentadu:=(cca mod ccl);
	
	dinero:=((cuentacl * 1.6) * ccl);
	
	writeln('Cantidad para cada cliente: ', cuentacl);
	
	writeln('Cantidad que sobra: ', cuentadu);
	
	writeln('Cantidad de dinero q le queda: ', dinero:1:2);
END.

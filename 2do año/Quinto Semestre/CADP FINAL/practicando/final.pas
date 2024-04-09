{
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la
transferencia (1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios).
Esta estructura no posee orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las
que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe
estar ordenada por número de cuenta origen
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares.
}


program final;
type
	motivos = 1..7;
	transferencia = record;
		cuentaOrigen: integer;
		DNIOrigen: integer;
		cuentaDestino: integer;
		DNIDestino: integer;
		fecha: string;
		hora: string;
		monto: integer;
		codigoMotivo: motivos;
	end;
	
	listaTransferencias = ^nodo;
	nodo = record
		dato: transferencia;
		sig: listaTransferencias;
	end;
	
	listaTerceros = ^nodo2;
	nodo2 = record
		dato: transferencia;
		sig: listaTerceros;
	end;
	
// se dispone: procedure LeerTransferencias(var t: transferencia); 

// se dispone: procedure AgregarAdelante(var l: listaTransferencias; t: transferencias); 

// se dispone: procedure llenarListaTransferencias(var l: listaTransferencias; var t: transferencias); 

procedure InsertarOrdenado(var l: listaTerceros; t: transferencia);
var
	aux,act,ant: listaTerceros;
begin
	new(aux);
	aux^.dato:= t;
	act:= l;
	ant:= l;
	while (act <> nil) and (t.cuentaOrigen > act^.dato.cuentaOrigen) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then 
		l:= aux;
	else
		ant^.sig:= aux;
	aux^.sig:= act;
end;

procedure llenarListaTerceros(var l: listaTerceros; lt: listaTransferencias; t: transferencia);
begin
	while (lt <> nil) do begin
		if (lt^.dato.DNIOrigen <> lt^.dato.DNIDestino) then begin
			p:= lt^.dato;
			InsertarOrdenado(l,t);
		end;
		lt:= lt^.sig;
	end;
end;

var
	l: listaTerceros;
	lt: listaTransferencias;
	t: transferencias;
begin
	llenarListaTransferencias(lt,t);
	llenarListaTerceros(l,lt,t)
end.




























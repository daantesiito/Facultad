program final;

const
  TEMA_MAX = 15;

type
  rangoTemas = 1..TEMA_MAX;

  prestamos = record
    codTema : rangoTemas;
    fecha   : string[10];
    codLibro: integer;
  end;

  listaPrestamos = ^nodo;
  nodo = record
    dato: prestamos;
    sig : listaPrestamos;
  end;

procedure procesar(l: listaPrestamos);
var
    cantTema, cantMaxTema: integer;
    temaAct, maxTema: rangoTemas;
begin
    cantMaxTema := -1;  
    while (l <> nil) do
    begin
        temaAct:= l^.dato.codTema;
        cantTema:= 0;
        while (l <> nil) and (l^.dato.codTema = temaAct) do begin
            inc(cantTema);
            l:= l^.sig;
        end;
        if (cantTema > cantMaxTema) then begin
            cantMaxTema:= cantTema;
            maxTema:= temaAct;
        end;
        writeln('Tema ', temaAct, '. Cantidad de préstamos: ', cantTema);
    end;

    if (cantMaxTema <> -1) then
        writeln('Código de tema con más préstamos: ', maxTema, ' (', cantMaxTema, ')')
    else
        writeln('No hay préstamos cargados.');
end;

var
  l: listaPrestamos;
begin
  l := nil;
  cargarLista(l);  //se dispone
  procesar(l);
end.

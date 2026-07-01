Process Deportista[id: 0..P] {

    Entrenador!agarrarBici(id);

    Entrenador?esperarBici();

    usarBici();

    Entrenador!dejarBici(id);

}


Process Entrenador {
    int llegaron = 0;
    int usaron = 0;
    cola cola;
    int id_deportista_usar;
    int id_deportista_dejar;
    boolean libre = true;

    do (llegaron < P); Deportista[*]?agarrarBici(id_deportista_usar) ->
        llegaron:= llegaron + 1;

        if (libre) {
            libre = false;
            Deportista[id_deportista_usar]!esperarBici();
        } else {
            insertar(cola, id_deportista_usar);
        }       

    [] (usaron < P); Deportista[*]?dejarBici(id_deportista_dejar) ->
        usaron:= usaron + 1;

        if (not empty (cola)) {
            sacar(cola, id_deportista_dejar);
            Deportista[id_deportista_dejar]!esperarBici();
        } else {
            libre = true;
        }
    od 
}
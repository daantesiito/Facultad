Process Deportista[id: 0..P-1] {

    Entrenador!llegue(id);

    Entrenador?usarBici();

    Entrenador!dejarBici();
}

Process Entrenador {
    boolean libre = true;
    int id_deportista_usar;
    int id_deportista;
    int terminados = 0;
    cola cola;

    do (terminados < P); Deportista[*]?llegue(id_deportista) ->
        if (libre = true) {
            libre = false;
            Deportista[id_deportista]!usarBici();
        } else {
            Insertar(cola, id_deportista);
        }
    [] (terminados < P); Deportista[*]?dejarBici() ->
        if (not empty(cola)) {
            Sacar(cola, id_deportista_usar);
            Deportista[id_deportista_usar]!usarBici();
        } else {
            libre:= true;
        }
        terminados++;
    od
}
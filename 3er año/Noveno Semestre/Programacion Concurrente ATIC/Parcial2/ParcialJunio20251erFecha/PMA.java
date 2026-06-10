chan llegue(int);
chan empezar[E](text);
chan termine(int, text);
chan recibirNota[E](int);

Process Estudiante[id: 0..E-1] {
    text parcial;
    text parcial_resuelto;
    int nota;

    send llegue(1);

    receive empezar[id](parcial);

    parcial_resuelto = resolverParcial(parcial); // Resolver parcial;

    send termine(id, parcial_resuelto);

    receive recibirNota[id](nota);
}

Process Profesor {
    text parcial;
    text parcial_corregir;
    int id_estudiante;
    int nota;
    int basura;

    for (i = 1 to E) {
        receive llegue(basura);
    }

    for (i = 0 to E-1) {
        send empezar[i](parcial);
    }

    for (i = 0 to E-1) {
        receive termine(id_estudiante, parcial_corregir);
        nota = corregir(parcial_corregir);
        send recibirNota[id_estudiante](nota);
    }

}
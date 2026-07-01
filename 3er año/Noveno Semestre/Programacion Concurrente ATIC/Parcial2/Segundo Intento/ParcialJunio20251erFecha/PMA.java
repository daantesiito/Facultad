chan llegue(int);
chan empezarExamen[E](text);
chan corregirExamen(int, text);
chan notaFinal[E](int);

Processs Estudiante[id: 0..E-1] {
    text examen;
    text ex_resuelto;
    int nota;

    send llegue(id);

    receive empezarExamen[id](examen);

    ex_resuelto = resolver(examen);

    send corregirExamen(id, ex_resuelto);

    receive notaFinal[id](nota);
}

Process Profesor {
    text examen;
    text ex_resuelto;
    int id_est;
    int nota;

    for i = 1 to E {
        receive llegue(id_est);
    }

    for i = 0 to E-1 {
        send empezarExamen[i](examen);
    }

    for i = 1 to E {
        receive corregirExamen(id_est, ex_resuelto);
        nota = corregir(ex_resuelto);
        send notaFinal[id_est](nota);
    }

}
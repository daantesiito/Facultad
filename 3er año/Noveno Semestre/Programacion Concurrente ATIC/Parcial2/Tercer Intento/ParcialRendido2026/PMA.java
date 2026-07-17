chan analizarAlta(int, string, string);
chan analizarMedia(int, string, string);
chan analizarBaja(int, string, string);
chan resultado[C](string);

Process Servidor {
    res: string;
    sec1: string;
    sec2: string;
    id_c: integer;

    while true {
        if (not empty(analizarAlta)) ->
            receive analizarAlta(id_c, sec1, sec2);
            res = analizar(sec1, sec2);
            send resultado[id_c](res);
        [] (empty(analizarAlta) and not empty(analizarMedia)) ->
            receive analizarMedia(id_c, sec1, sec2);
            res = analizar(sec1, sec2);
            send resultado[id_c](res);
        [] (empty(analizarAlta) and empty(analizarMedia) and not empty(analizarBaja)) ->
            receive analizarBaja(id_c, sec1, sec2);
            res = analizar(sec1, sec2);
            send resultado[id_c](res);
        [] (empty(analizarAlta) and empty(analizarMedia) and empty(analizarBaja)) ->
            delay(600);
        fi
    }       
}

Process Cliente[id: 0..C-1] {
    while true {
        prio = getPrioridad();
        sec1 = getSec1();
        sec2 = getSec2();

        if (prio = 0) {
            send analizarAlta(id, sec1, sec2);
        } else if (prio = 1) {
            send analizarMedia(id, sec1, sec2);
        } else {
            send analizarBaja(id, sec1, sec2);
        }

        receive resultado[id](res);
    }
}
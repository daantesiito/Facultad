chan analizarAlta(string, string, string);
chan analizarMedia(string, string, string);
chan analizarBaja(string, string, string);
chan resultado[int](string);


Process Cliente[0..C] {
    sec1: String;
    sec2: String;
    prio: String;
    res: String;

    while true {
        sec1 = generarSecuencia();
        sec2 = generarSecuencia();

        prio = generarPrioridad();
        
        if (prio = "alta") {
            send analizarAlta(id, sec1, sec2);
        } else if (prio = "media"){
            send analizarMedia(id, sec1, sec2);
        } else {
            send analizarBaja(id, sec1, sec2);
        }

        receive resultado[id](res);
    }
}

Process Servidor {
    id_cliente: integer;
    sec1: String;
    sec2: String;
    similitud: String;

    while true {

        if (not empty(analizarAlta)) {
            receive analizarAlta(id_cliente, sec1, sec2);
            similitud = analizar(sec1, sec2);
            send resultado[id_cliente](similitud);
        } else if (not empty(analizarMedia)) {
            receive analizarMedia(id_cliente, sec1, sec2);
            similitud = analizar(sec1, sec2);
            send resultado[id_cliente](similitud);
        } else if (not empty(analizarBaja)) {
            receive analizarBaja(id_cliente, sec1, sec2);
            similitud = analizar(sec1, sec2);
            send resultado[id_cliente](similitud);
        } else {
            delay(600);
        }

    }

}
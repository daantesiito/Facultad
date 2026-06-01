// INCISO A

chan colaBanco(int);
chan respuesta[N](text);

Process Cliente[id: 0..N-1] {

    text mi_respuesta;

    send colaBanco(id);

    receive respuesta[id](mi_respuesta);
}

Process Empleado {

    text resolucion;
    int id_usar;

    while (true)
        receive colaBanco(id_usar);

        resolucion = ResolverTramite();

        send respuesta[id_usar](resolucion);
}

// INCISO B

chan colaBanco(int);
chan respuesta[N](text);

Process Cliente[id: 0..N-1] {

    text mi_respuesta;

    send colaBanco(id);

    receive respuesta[id](mi_respuesta);
}

Process Empleado[id: 0..1] {

    text resolucion;
    int id_usar;

    while (true)
        receive colaBanco(id_usar);

        resolucion = ResolverTramite();

        send respuesta[id_usar](resolucion);
}

// INCISO C

chan colaBanco(int);
chan respuesta[N](text);

Process Cliente[id: 0..N-1] {

    text mi_respuesta;

    send colaBanco(id);

    receive respuesta[id](mi_respuesta);
}

Process Empleado[id: 0..1] {

    text resolucion;
    int id_usar;

    while (true)
        if (not empty(colaBanco)) {
            receive colaBanco(id_usar);

            resolucion = ResolverTramite();

            send respuesta[id_usar](resolucion);
        } else {
            Delay(15);
        }
}
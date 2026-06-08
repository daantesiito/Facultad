chan req_cabina(int);
chan rta_cabina[N](int);
chan pagar_cabina(int, int);
chan rta_ticket[N](text);
chan Aviso(int);

Process Cliente[id: 0..N-1] {
    int id_usar_cab;
    text ticket;

    send req_cabina(id);
    send aviso(1);
    receive rta_cabina[id](id_usar_cab);

    usarCabina();

    send pagar_cabina(id, id_usar_cab);
    send aviso(1);
    receive rta_ticket[id](ticket);
}

Process Empleado {
    int id_cab;
    int id_usar_cli;
    int libres = 10;
    cola cabinas_libres;
    cola fila_cabina;
    text ticket;

    while (true) {

        receive aviso(señal);

        if (not empty(pagar_cabina)) ->
            receive pagar_cabina(id_usar_cli, id_cab);
            ticket = cobrar();
            send rta_ticket[id_usar_cli](ticket);

            if (not empty(fila_cabina)) {
                Sacar(fila_cabina, id_usar_cli);
                send rta_cabina[id_usar_cli](id_cab);
            } else {
                Insertar(cabinas_libres, id_cab);
                libres++;
            }
        [] (not empty(req_cabina) and empty(pagar_cabina)) ->
            receive req_cabina(id_usar_cli);

            if (libres > 0) {
                Sacar(cabinas_libres, id_cab);
                libres--;
                send rta_cabina[id_usar_cli](id_cab);
            } else {
                Insertar(fila_cabina, id_usar_cli);
            }
        fi
    }

}
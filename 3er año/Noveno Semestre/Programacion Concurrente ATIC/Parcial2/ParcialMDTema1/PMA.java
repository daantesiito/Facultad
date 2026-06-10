chan llegue(int, text);
chan recibirEntrada[P](text);

Process Asistente[id: 0..P-1] {
    int mi_dni;
    text ticket;

    mi_dni = obtenerDNI();

    send llegue(id, mi_dni);
    
    receive recibirEntrada[id](ticket);
}

Process Empleado[id: 0..2] {
    text entrada;
    int id_asistente;
    int dni_asistente;

    while (true) {
        receive llegue(id_asistente, dni_asistente);

        entrada = obtenerEntrada(dni_asistente);

        send recibirEntrada[id_asistente](entrada);
    }
}

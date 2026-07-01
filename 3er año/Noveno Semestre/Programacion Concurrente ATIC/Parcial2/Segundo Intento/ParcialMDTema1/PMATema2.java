




Process Persona[id: 0..P] {

    dni = obtenerDNI();

    send retirarEntrada(dni, id);

    receive recibirEntrada(entrada);

}

Process Empleado[id: 0..2] {

    receive retirarEntrada(dni_p, id_p);

    entrada = obtenerEntrada(dni_p);

    send recibirEntrada[id_p](entrada);

}
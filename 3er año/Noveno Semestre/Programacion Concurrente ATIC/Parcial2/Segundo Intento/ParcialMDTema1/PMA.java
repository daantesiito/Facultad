chan pedirEntrada(int, int);
chan retirarEntrada[P](text);

Process Persona[id: 0..P] {
    int id;
    int dni;
    text mi_entrada;
    
    dni = obtenerDNI();

    send pedirEntrada(id, dni);

    receive retirarEntrada[id](mi_entrada);

}

Process Boleteria[id: 0..2] {
    int id_persona;
    int dni_persona;
    text entrada;

    for i = 1 to P {

        receive pedirEntrada(id_persona, dni_persona);

        entrada = obtenerEntrada(dni_persona);

        send retirarEntrada[id_persona](entrada);

    }

}
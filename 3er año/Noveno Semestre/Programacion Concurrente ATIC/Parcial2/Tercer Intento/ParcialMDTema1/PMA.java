chan pedirEntrada(int, int);
chan recibirEntrada[P](string);


Process Persona[id: 0..P-1] {
    dni: int;
    entrada: string;

    dni = obtenerDNI(id);

    send pedirEntrada(dni, id);

    receive recibirEntrada[id](entrada);
}

Process Boleteria[id: 0..2] {
    dni_p: int;
    id_p: int;
    entrada: string;

    while true {

        receive pedirEntrada(dni_p, id_p);

        entrada = obtenerEntrada(dni);

        send recibirEntrada[id_p](entrada);
    }
}
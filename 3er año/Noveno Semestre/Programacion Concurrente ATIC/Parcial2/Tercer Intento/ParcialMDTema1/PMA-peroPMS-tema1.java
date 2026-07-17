Process Persona[id: 0..P-1] {
    int dni;
    string entrada;

    dni = obtenerDNI();

    Administrador!pedirEntrada(dni, id);

    Empleado[*]?recibirEntrada(entrada);
}

Process Empleado[id: 0..2] {
    int id_p;
    int dni_p;
    string entrada;

    while (true) {

        Administrador!siguiente(id);

        Administrador?recibirPedido(dni_p, id_p);

        entrada = obtenerEntrada(dni_p);

        Persona[id_p]!recibirEntrada(entrada);
    }
}

Process Administrador {
    int atendidos = 0;
    int dni_p;
    int id_p;
    int id_e;
    cola cola;

    do (atendidos < P); Persona[*]?pedirEntrada(dni_p, id_p) ->
        insertar(cola, dni_p, id_p);
    [] (not empty(cola)); Empleado[*]?siguiente(id_e) ->
        sacar(cola, dni_p, id_p);
        Empleado[id_e]!recibirPedido(dni_p, id_p);
        atendidos++;
    od
}

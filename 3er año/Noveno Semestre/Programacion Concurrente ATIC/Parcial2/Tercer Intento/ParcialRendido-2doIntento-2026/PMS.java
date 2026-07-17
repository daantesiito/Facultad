Process Empleado {
    text datos_c;
    text linea;
    int id_c;

    for (i = 1 to C) {
        Administrador!avisoListo();

        Administrador?nuevoCliente(datos_c, id_c);

        linea = getLinea(datos_c);

        Cliente[id_c]!entregaLinea(linea);
    }
}

Process Administrador {
    text datos_c;
    int id_c;
    int solicitados = 0;
    int atendidos = 0;
    cola cola;

    while (atendidos < C) {
        if (solicitados < C); Cliente[*]?avisoCompra(datos_c, id_c) ->
            solicitados++;
            insertar(cola, datos_c, id_c);
        [] (atendidos < C AND not empty(cola)); Empleado?avisoListo() ->
            sacar(cola, datos_c, id_c);
            Empleado!nuevoCliente(datos_c, id_c);
            atendidos++;
    }

}

Process Cliente[id: 0..C-1] {
    text datos;
    text linea;

    datos = datos();

    Administrador!avisoCompra(datos, id);

    Empleado?entregaLinea(linea);
}
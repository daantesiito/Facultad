chan req_pedido(int, text);
chan give_pedido[C](text);

chan pedir_trabajo(int);
chan tomar_pedido[3](int, text);

chan cola_cocineros(int, text);


Process Cliente[id: 0..C-1] {
    text miPedido;
    text miComida;

    send req_pedido(id, miPedido);

    receive give_pedido[id](miComida);
}

Process Vendedor[id: 0..2] {
    int id_usar;
    text pedido;

    while (true) {
        send pedir_trabajo(id);
 
        receive tomar_pedido[id](id_usar, pedido);

        if (id_usar != -1) ->
            send cola_cocineros(id_usar, pedido);
        [] else ->
            delay(1 a 3 minutos);
        fi
    }
}

Process Coordinador {
    int id_usar_v, id_usar_c;
    text pedido;

    while (true) {
        receive pedir_trabajo(id_usar_v);

        if (not empty(req_pedido)) ->
            receive req_pedido(id_usar_c, pedido);
            send tomar_pedido[id_usar_v](id_usar_c, pedido);
        [] else ->
            send tomar_pedido[id_usar_v](-1, "vacio");
        fi
    }
}

Process Cocinero[id: 0..1] {
    int id_usar;
    text pedido;
    text comida_lista;

    while (true) {
        receive cola_cocineros(id_usar, pedido);

        comida_lista = cocinar(pedido); // COCINAR PEDIDO

        send give_pedido[id_usar](comida_lista);
    }

}
chan req_admin(int, int);
chan rta_caja[P](int);       

chan colaCaja[4](int);       
chan respuesta[P](text);     

Process Cliente[id: 0..P-1] {
    text comprobante;
    int num_caja;

    send req_admin(0, id);
    receive rta_caja[id](num_caja);
    
    send colaCaja[num_caja](id);
    receive respuesta[id](comprobante);
}

Process Cajas[id: 0..4] {
    int id_usar;
    text comprobante_entregar;

    while (true) {
        receive colaCaja[id](id_usar);

        comprobante_entregar = Atender();

        send respuesta[id_usar](comprobante_entregar);
        send req_admin(1, id);
    }
}

Process Administrador {
    int codigo;
    int id_usar;
    int caja_min;
    int esperando[4] = ([4] 0); 

    while (true) {
        receive req_admin(codigo, id_usar);

        if (codigo == 0) {
            caja_min = 0;
            for (int i = 1; i < 5; i++) { 
                if (esperando[i] < esperando[caja_min]) {
                    caja_min = i;
                }
            }

            esperando[caja_min]++;

            send rta_caja[id_usar](caja_min);
        } else {
            esperando[id_usar]--;
        }
    }
}
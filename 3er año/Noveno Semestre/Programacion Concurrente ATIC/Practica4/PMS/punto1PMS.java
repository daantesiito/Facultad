// INCISO B

Process Examinador[id: 0..R-1] {
    text direccion;

    while (true) {
        direccion = buscar_sitio();
        Analizador!sitio(direccion); 
    }
}

Process Analizador {
    text dir_evaluar;

    while (true) {
        Examinador[*]?sitio(dir_evaluar); 
        
        evaluar_sitio(dir_evaluar);
    }
}

// INCISO C

Process Examinador[id: 0..R-1] {
    text direccion;

    while (true) {
        direccion = buscar();
        Admin!sitio(direccion);
    }
}

Process Analizador {
    text dir_evaluar;

    while (true) {
        Admin!pedido();
        Admin?entregar(dir_evaluar)
        evaluar_sitio(dir_evaluar);
    }

}

Process Admin {
    text dir_guardar, dir_analizar;
    Cola cola;

    do true ->
        Examinador[*]?sitio(dir_guardar);
        Insertar(cola, dir_guardar);
    
    [] (not empty(cola)); Analizador?pedido() ->
        Sacar(cola, dir_analizar);
        Analizador!entregar(dir_analizar);
    od
}
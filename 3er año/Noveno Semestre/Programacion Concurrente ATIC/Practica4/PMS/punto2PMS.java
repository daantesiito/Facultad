Process Empleado1 {
    text muestraADN;
    
    while (true) {
        muestraADN = prepararMuestra();

        Admin!envioMuestra(muestraADN);
    }
}

Process Empleado2 {
    text muestraADN;
    text setAnalisis;
    text resultado;

    while (true) {
        Admin!pedido();

        Admin?tomarMuestra(muestraADN);

        setAnalisis = armarSetAnalisis(muestraADN);

        Empleado3!enviarAnalisis(setAnalisis);

        Empleado3?recibirResultado(resultado);

        archivar(resultado);
    }

}

Process Empleado3 {
    text analisis_listos, analisis_revisar;

    while (true) {

        Empleado2?enviarAnalisis(analisis_revisar);

        analisis_listos = realizarAnalisis(analisis_revisar);

        Empleado2!recibirResultado(analisis_listos);
    }

}

Process Admin {
    cola cola;
    text muestra_g, muestra_e;

    do Empleado1?envioMuestra(muestra_g) ->

        Insertar(cola, muestra_g);


    [] (not empty(cola)); Empleado2?pedido() ->
        Sacar(cola, muestra_e);

        Empleado2!tomarMuestra(muestra_e);
    od
}
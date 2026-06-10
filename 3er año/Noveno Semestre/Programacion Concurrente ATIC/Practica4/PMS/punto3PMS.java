// INCISO A

Process Alumno[id: 0..N-1] {
    text examen;
    text examen_resuelto;
    text examen_corregido;

    examen_resuelto = resolverExamen(examen);

    Admin!enviarExamenR(id, examen_resuelto);

    Profesor?recibirResultado(examen_corregido)
}

Process Profesor {
    text examen;
    text examen_corregido;
    int id_alumno;

    for i = 1 to N {

        Admin!pedido();

        Admin?corregirExamen(id_alumno, examen);

        examen_corregido = corregirExamen(examen);

        Alumno[id_alumno]!recibirResultado(examen_corregido);
    }
}

Process Admin {
    text examen_resuelto_enviar;
    text examen_resuelto_guardar;
    int id_alumno;
    int recibidos;
    int entregados;
    cola cola;

    do (recibidos < N); Alumno[*]?enviarExamenR(id_alumno, examen_resuelto_guardar) ->
        Insertar(cola, id_alumno, examen_resuelto_guardar);
        recibidos++;
    
    [] (entregados < N) and (not empty(cola)); Profesor?pedido() ->
        Sacar(cola, id_alumno, examen_resuelto_enviar);
        Profesor!corregirExamen(id_alumno, examen_resuelto_enviar);
        entregados++;    
    od
}


// INCISO B

Process Alumno[id: 0..N-1] {
    text examen;
    text examen_resuelto;
    text examen_corregido;

    examen_resuelto = resolverExamen(examen);

    Admin!enviarExamenR(id, examen_resuelto);

    Profesor[*]?recibirResultado(examen_corregido)
}

Process Profesor[id: 0..P-1] {
    text examen;
    text examen_corregido;
    int id_alumno;
    boolean seguir = true;

    while (seguir) {

        Admin!pedido(id);

        Admin?corregirExamen(id_alumno, examen);

        if (id_alumno != -1) {
            examen_corregido = corregirExamenAlumno(examen);

            Alumno[id_alumno]!recibirResultado(examen_corregido);
        } else {
            seguir = false;
        }
    }
}

Process Admin {
    text examen_resuelto_enviar;
    text examen_resuelto_guardar;
    int id_alumno;
    int id_profesor;
    int recibidos = 0;
    int entregados = 0;
    cola cola;

    do (recibidos < N); Alumno[*]?enviarExamenR(id_alumno, examen_resuelto_guardar) ->
        Insertar(cola, id_alumno, examen_resuelto_guardar);
        recibidos++;
    
    [] (entregados < N and not empty(cola)); Profesor[*]?pedido(id_profesor) ->
        Sacar(cola, id_alumno, examen_resuelto_enviar);
        Profesor[id_profesor]!corregirExamen(id_alumno, examen_resuelto_enviar);
        entregados++;    
    od

    // Cortar Profesores
    for i = 1 to P {
        Profesor[*]?pedido(id_profesor);
        Profesor[id_profesor]!corregirExamen(-1, "fin");
    }
}


// INCISO C

Process Alumno[id: 0..N-1] {
    text examen;
    text examen_resuelto;
    text examen_corregido;

    Barrera!llegue();

    Barrera?empezar();

    examen_resuelto = resolverExamen(examen);

    Admin!enviarExamenR(id, examen_resuelto);

    Profesor[*]?recibirResultado(examen_corregido);
}

Process Barrera {

    for i = 1 to N {
        Alumno[*]?llegue();
    }
    
    for i = 0 to N-1 {
        Alumno[i]!empezar();
    }

}

Process Profesor[id: 0..P-1] {
    text examen;
    text examen_corregido;
    int id_alumno;
    boolean seguir = true;

    while (seguir) {

        Admin!pedido(id);

        Admin?corregirExamen(id_alumno, examen);

        if (id_alumno != -1) {
            examen_corregido = corregirExamenAlumno(examen);

            Alumno[id_alumno]!recibirResultado(examen_corregido);
        } else {
            seguir = false;
        }
    }
}

Process Admin {
    text examen_resuelto_enviar;
    text examen_resuelto_guardar;
    int id_alumno;
    int id_profesor;
    int recibidos = 0;
    int entregados = 0;
    cola cola;

    do (recibidos < N); Alumno[*]?enviarExamenR(id_alumno, examen_resuelto_guardar) ->
        Insertar(cola, id_alumno, examen_resuelto_guardar);
        recibidos++;
    
    [] (entregados < N and not empty(cola)); Profesor[*]?pedido(id_profesor) ->
        Sacar(cola, id_alumno, examen_resuelto_enviar);
        Profesor[id_profesor]!corregirExamen(id_alumno, examen_resuelto_enviar);
        entregados++;    
    od

    // Cortar Profesores
    for i = 1 to P {
        Profesor[*]?pedido(id_profesor);
        Profesor[id_profesor]!corregirExamen(-1, "fin");
    }
}
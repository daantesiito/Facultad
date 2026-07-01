chan pedirDiscapacitado(int, int);
chan pedirAnciano(int, int);
chan pedirAdultoOJoven(int, int);
chan aviso(int);
chan recibirPack[P](text, text);


Process Persona[id: 0..P] {
    integer mi_dni, mi_prioridad, senal;
    text remera, chip;

    mi_dni = obtenerDNI();
    mi_prioridad = obtenerPrioridad();

    if (mi_prioridad == 0) {
        send pedirDiscapacitado(id, mi_dni);
    } else if (mi_prioridad == 1) {
        send pedirAnciano(id, mi_dni);
    } else if (mi_prioridad == 2) {
        send pedirAdultoOJoven(id, mi_dni);
    } 

    send aviso(senal);

    receive recibirPack[id](remera, chip);
}

Process Organizador {
    text remera, chip;
    int dni_persona, id_persona;
    int senal;

    for i = 1 to P {

        receive aviso(senal);

        if (not empty(pedirDiscapacitado)) ->
            receive pedirDiscapacitado(id_persona, dni_persona);
            remera:= obtenerRemera(dni_persona);
            chip:= obtenerChip(dni_persona);
            send recibirPack[id_persona](remera, chip);
        
        [] (not empty(pedirAnciano) and (empty pedirDiscapacitado)) ->
            receive pedirAnciano(id_persona, dni_persona);
            remera:= obtenerRemera(dni_persona);
            chip:= obtenerChip(dni_persona);
            send recibirPack[id_persona](remera, chip);

        [] (not empty(pedirAdultoOJoven) and (empty pedirDiscapacitado) and (empty pedirAnciano)) ->
            receive pedirAdultoOJoven(id_persona, dni_persona);
            remera:= obtenerRemera(dni_persona);
            chip:= obtenerChip(dni_persona);
            send recibirPack[id_persona](remera, chip);
        fi
    }   
}
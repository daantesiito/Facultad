Process Paciente[id: 0..14] {
    text tratamiento;

    Administrador!llegada(id);

    Medico?tratamiento(tratamiento);

}


Process Medico {
    text tratamiento;
    int id_p;

    Administrador!pedido();

    Administrador?siguiente(id_p);

    tratamiento = atender();

    Paciente[id_p]!tratamiento(tratamiento);

}


Process Administrador {
    cola cola;
    int llegados = 0;
    int id_p;

    do (llegados < 15); Paciente[*]?llegada(id_p) ->
        insertar(cola, id_p)
        llegados++;
    [] (not empty (cola)); Medico?pedido() ->
        sacar(cola, id_p);
        Medico!siguiente(id_p);
    od
}
Process Paciente[id: 0..14] {
    text mi_tratamiento;

    Admin!llegue(id);
    
    // Medico atiende

    Medico?esperarResultado(mi_tratamiento);
}

Process Medico {
    int id_paciente;
    text resultados;

    for (i = 1 to 15) {
        Admin!otroPaciente(1);

        Admin?enviarPaciente(id_paciente);

        resultados = atender(); // Atender paciente
    
        Paciente[id_paciente]!esperarResultado(resultados);
    }

}

Process Admin {
    int llegaron = 0;
    int atendidos = 0;
    cola cola;
    int id_paciente_enviar;
    int id_paciente_guardar;
    int basura;

    do (llegaron < 15); Paciente[*]?llegue(id_paciente_guardar) ->
        Insertar(cola, id_paciente_guardar);
        llegaron++;
    [] (atendidos < 15 and not empty(cola)); Medico?otroPaciente(basura) ->
        Sacar(cola, id_paciente_enviar);
        Medico!enviarPaciente(id_paciente_enviar);
        atendidos++;
    od
}
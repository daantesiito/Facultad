

Process Paciente[id: 0..14] {
    text mi_estudio;
    text mi_resultado;

    mi_estudio = obtenerEstudio();
    
    Medico!llegue(mi_estudio);

    Medico?esperarResultado(mi_resultado);
}

Process Medico {
    text est_paciente;
    text resultado;

    for (i = 0 to 14) {
       
        Paciente[i]?llegue(est_paciente);

        resultado = revisarEstudio(estudio);

        Paciente!esperarResultado(resultado);
    }
}
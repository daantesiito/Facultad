Process Medico {
    text estudios;
    text resultado;

    for i in 1..15 {
        Paciente[i]?enviar(estudios);

        resultado:= revisarEstudio(estudio);

        Paciente[i]!resultado(resultado);
    }
}

Process Paciente[id: 1..15] {
    text estudios;
    text resultado;

    estudios:= obtenerEstudios();

    Medico!enviar(estudios);

    Medico?resultado(resultado);
}
Procedure parcial is

    TASK Medico IS
        ENTRY AtenderUrgencia(receta: IN text; medicacion: OUT text);
        ENTRY AtenderGeneral(receta: IN text; medicacion: OUT text);
        ENTRY AtenderAmbulatorio(receta: IN text; medicacion: OUT text);
    END Medico;

    TASK TYPE Paciente;

    arrPacientes = array 1..P of Paciente;

    TASK BODY Medico IS
    BEGIN
        LOOP
            SELECT
                ACCEPT AtenderUrgencia(receta: IN text; medicacion: OUT text) =>
                    medicacion:= dispensarMedicamento(receta);
                END AtenderUrgencia;
            OR
                WHEN (AtenderUrgencia'count = 0) DO
                    ACCEPT AtenderGeneral(receta: IN text; medicacion: OUT text) =>
                        medicacion:= dispensarMedicamento(receta);
                END AtenderGeneral;
            OR
                WHEN (AtenderUrgencia'count = 0) and (AtenderGeneral'count = 0) DO
                    ACCEPT AtenderAmbulatorio(receta: IN text; medicacion: OUT text) =>
                        medicacion:= dispensarMedicamento(receta);
                END AtenderAmbulatorio;
            END SELECT;
        END LOOP;
    END Medico;

    TASK BODY Paciente IS
        text receta;
        int prioridad;
        text medicacion;
    BEGIN
        receta:= obtenerReceta();
        prioridad:= obtenerPrioridad();

        if (prioridad = 0) then
            Medico.AtenderUrgencia(receta, medicacion);
        else if (prioridad = 1) then
            Medico.AtenderGeneral(receta, medicacion);
        else 
            Medico.AtenderAmbulatorio(receta, medicacion);
        end if

    END Paciente;

BEGIN
    null
end parcial;
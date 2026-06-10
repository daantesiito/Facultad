Procedure Parcial is

   TASK Empleado IS
      ENTRY AtencionUrgencia(receta: IN text; medicamentos: OUT text);
      ENTRY AtencionAmbulatorio(receta: IN text; medicamentos: OUT text);
      ENTRY AtencionGeneral(receta: IN text; medicamentos: OUT text);
   END Empleado;

   TASK TYPE Paciente;

   arrPaciente = array (1..P) of Paciente;

   TASK BODY Empleado IS
   BEGIN
      FOR i in 1..P LOOP
         SELECT
            ACCEPT AtencionUrgencia(receta: IN text; medicamentos: OUT text) DO
               medicamentos:= dispensarMedicamento(receta);
            END AtencionUrgencia;
         OR
            WHEN (AtencionUrgencia`count = 0) =>
               ACCEPT AtencionAmbulatorio(receta: IN text; medicamentos: OUT text) DO
                  medicamentos:= dispensarMedicamento(receta);
               END AtencionAmbulatorio;
         OR 
            WHEN (AtencionUrgencia`count = 0) and (AtencionAmbulatorio`count = 0) ->
               ACCEPT AtencionGeneral(receta: IN text; medicamentos: OUT text) DO
                  medicamentos:= dispensarMedicamento(receta);
               END AtencionGeneral;
         END SELECT;
      END LOOP;
   END Empleado;

   TASK BODY Paciente IS
      mis_medicamentos: text;
      prioridad: integer;
      receta: text;
   BEGIN   
      prioridad := obtenerPrioridad();
      receta := obtenerReceta();

      if (prioridad = 0) then
         Empleado.AtencionUrgencia(receta, mis_medicamentos);
      elsif (prioridad = 1) then
         Empleado.AtencionAmbulatorio(receta, mis_medicamentos);
      else
         Empleado.AtencionGeneral(receta, mis_medicamentos);
      end if;
   END Paciente;

Begin
   null;
END Parcial;
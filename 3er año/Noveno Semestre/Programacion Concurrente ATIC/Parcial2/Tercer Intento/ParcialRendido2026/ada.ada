Procedure parcial is

   TASK TYPE Administrador IS
      ENTRY Consultar(consulta: IN text; id: IN int);
      ENTRY Siguiente(id_est: OUT int; consulta: OUT text)
   END Administrador;

   TASK TYPE Docente

   TASK TYPE Estudiante IS
      ENTRY Identificacion(id: IN integer);
      ENTRY Respuesta(resp: IN text);
   END Estudiante;

   arrEstudiantes = array 1..E of Estudiante;

   arrDocente = array 1..3 of Docente;

   TASK BODY Estudiante IS
      mi_id: integer;
      mi_resp: text;
      mi_consulta: text;

   BEGIN
      ACCEPT Identificacion(id: IN integer) DO
         mi_id:= id;
      END Identificacion;

      LOOP
         mi_consulta = getConsulta();

         Administrador.Consultar(mi_consulta, mi_id);

         ACCEPT Respuesta(resp: IN text) DO
            mi_resp:= resp;
         END Respuesta;
      END LOOP;
   END Estudiante;

   TASK BODY Docente IS
      resp: text;
      id_est: integer;
      cons: text;
      
   BEGIN
      LOOP
         Administrador.Siguiente(id_est, cons);

         resp:= AtenderConsulta(cons);

         arrEstudiantes(id_est).Respuesta(cons);
      END LOOP
   END Docente;

   TASK BODY Administrador IS
   BEGIN
      LOOP
         ACCEPT Siguiente(id_est: OUT int; consulta_est: OUT text) =>
            ACCEPT Consultar(consulta: IN text; id: IN int) =>
               consulta_est:= consulta;
               id_est:= id;
            END Consultar;
         END Siguiente;
      END LOOP;
   END Administrador;

BEGIN
   for i = 1 to E loop
      Estudiante.Identificacion(i);
   end loop
END Parcial;
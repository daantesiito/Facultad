Procedure parcial is

   TASK Administrador IS
      ENTRY Pedido(id_estudiante: IN integer; cons: IN text);
      ENTRY Siguiente(id: OUT integer; cons: OUT text);
   END Administrador

   TASK TYPE Estudiante IS
      ENTRY Identificacion(id: IN integer);
      ENTRY Respuesta(res: IN text);
   END Estudiante

   TASK TYPE Docente;

   arrEstudiantes: array (1..E) of Estudiante;
   arrDocentes: array (1..3) of Docente;

   TASK BODY Estudiante IS
      mi_id: integer;
      mi_resp: text;
      mi_consulta: text;

   BEGIN
      ACCEPT Identificacion(id: IN integer) DO
         mi_id:= id;
      END Identificacion;

      LOOP
         mi_consulta:= "consulta";

         Administrador.Pedido(mi_id, mi_consulta);

         ACCEPT Respuesta(res: IN text) DO
            mi_resp:= res;
         END Respuesta;
      END LOOP      
   END Estudiante;

   TASK BODY Administrador IS
   BEGIN
      LOOP
         ACCEPT Siguiente(idC: OUT integer; cons: OUT text) DO
            ACCEPT Pedido(id_estudiante: IN integer; cons_est: IN text) DO
               idC:= id_estudiante;
               cons:= cons_est;
            END Pedido;
         END Siguiente;
      END LOOP;
   END Administrador;

   TASK BODY Docente IS
      id: integer;
      cons: text;
      res: text;
   BEGIN
      LOOP
         Administrador.Siguiente(id,cons);

         res:= AtenderConsulta(cons);

         arrEstudiantes(id).Respuesta(res);
      END LOOP
   END Docente;

BEGIN
   for i in 1..E loop
      arrEstudiantes(i).Identificacion(i);
   end loop;
END parcial;
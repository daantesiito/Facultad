Procedure Parcial is
   TASK Coordinador IS
      ENTRY Entregar(sol: IN text; res: OUT text; orden: OUT integer);
      ENTRY PedirProblema(prob: OUT text);
   END Coordinador;

   TASK TYPE Participante;

   arrParticipante = array (1..P) of Participante;

   TASK BODY Coordinador IS
      entregados: integer:= 0;
      pedidos: integer:= 0;
      orden_actual: integer:= 0;
      problema: text;

   BEGIN
      WHILE (entregados < P) LOOP
         SELECT
            WHEN (pedidos < P) =>
               ACCEPT PedirProblema(prob: OUT text) DO 
                  prob:= problema;
               END PedirProblema;
               pedidos:= pedidos + 1;
         OR
            WHEN (entregados < P) =>
               ACCEPT Entregar(sol: IN text; res: OUT text; orden: OUT integer);
                  orden := orden_actual;
                  res:= corregir(sol);
               END Entregar;

               orden_actual:= orden + 1;
               entregados:= entregados + 1;
         END SELECT;
      END LOOP;
   END Coordinador;

   TASK BODY Participante IS
      mi_problema: text;
      mi_solucion: text;
      mi_resultado: text;
      mi_orden: integer;
   BEGIN
      Coordinador.PedirProblema(mi_problema);

      mi_solucion:= resolver(mi_problema);

      Coordinador.Entregar(mi_solucion, mi_resultado, mi_orden);
   END Participante;

Begin
   null;
END Parcial;
         

            
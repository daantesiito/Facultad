Procedure parcial is

   TASK TYPE Servidor IS
      ENTRY PedidoUrgente(sec1, sec2: IN text; res: OUT integer);
      ENTRY PedidoRegular(sec1, sec2: IN text; res: OUT integer);
   END Servidor

   TASK TYPE Cliente

   arrCliente = array [1..C] of Cliente;

   TASK BODY Servidor IS
   BEGIN
      LOOP
         SELECT
            ACCEPT PedidoUrgente(sec1, sec2: IN text; res: OUT integer) DO
               res:= analizar(sec1, sec2);
            END PedidoUrgente;
         OR
            WHEN (PedidoUrgente'count = 0) =>
               ACCEPT PedidoRegular(sec1, sec2: IN text; res: OUT integer) DO
                  res:= analizar(sec1, sec2);
               END PedidoRegular;
         ELSE
            DELAY(300);
         END SELECT;
      END LOOP;
   END Servidor;

   TASK BODY Cliente IS
      prio: string;
      sec1: string;
      sec2: string;
      res: integer;
   BEGIN
      LOOP
         prio = getPrioridad();
         sec1 = getSec1();
         sec2 = getSec2();

         IF (prio = 0) DO
            Servidor.PedidoUrgente(sec1, sec2, res);
         ELSE 
            SELECT
               Servidor.PedidoRegular(sec1, sec2, res);
            OR DELAY(1800);
               null;
         FI
      END LOOP;
   END Cliente;

BEGIN
   null;
END Parcial;
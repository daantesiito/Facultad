Procedure Ejercicio3 IS

   TASK Central IS
      ENTRY Senal1 (dato: IN text);
      ENTRY Senal2 (dato: IN text);
      ENTRY FinTiempo;
   END Central;

   TASK Periferico1;
   TASK Periferico2;

   TASK Timer IS
      ENTRY Iniciar;
   END Timer;

   TASK BODY Timer IS
   BEGIN
      LOOP
         ACCEPT Iniciar;
         DELAY 180.0;
         Central.FinTiempo;
      END LOOP;
   END Timer;

   TASK BODY Central IS
      dato_recibido: text;
      seguir: boolean;
   BEGIN
      ACCEPT Senal1(dato: IN text) DO
         dato_recibido:= dato;
      END Senal1;
      LOOP
         SELECT
            ACCEPT Senal1(dato: IN text) DO
               dato_recibido:= dato;
            END Senal1;
         OR
            ACCEPT Senal2(dato: IN text) DO
               dato_recibido:= dato;
            END Senal2;

            Timer.Iniciar;
            seguir = true;

            WHILE (seguir) LOOP
               SELECT
                  ACCEPT Senal2(dato: IN text) DO
                     dato_recibido:= dato;
                  END Senal2;
               OR
                  ACCEPT FinTiempo DO
                     seguir:= false;
                  END FinTiempo;
               END SELECT;
            END LOOP;
         END SELECT;
      END LOOP;
   END Central;

   TASK BODY Periferico1 IS
      mi_senal: text;
   BEGIN
      LOOP
         mi_senal:= generarSenal();
         SELECT 
            Central.Senal1(mi_senal);
         OR DELAY 120.0
            null;
         END SELECT;
      END LOOP;
   END Periferico1;

   TASK BODY Periferico2 IS
      mi_senal: text;
      enviado: boolean;
   BEGIN
      LOOP
         mi_senal = generarSenal();
         enviado:= false;
         WHILE (not enviado) LOOP
         SELECT
            Central.Senal2(mi_senal);
            enviado:= true;
         ELSE
            DELAY 60.0;
      END LOOP;
   END Periferico2;

Begin
   null;
END Ejercicio3;
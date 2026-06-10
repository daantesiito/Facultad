Procedure Ejercicio4 is

   TASK Coordinador IS
      ENTRY Terminar(numero: IN float);
   END Coordinador;

   TASK Worker IS
      ENTRY Empezar;
   END Worker;

   arrWorkers = array (1..10) of Worker;

   TASK BODY Worker IS
         vector: array (1..100000) of integer;
         suma_local: integer;
      BEGIN
         ACCEPT Empezar DO;
            for i = 1 to 100000 LOOP
               suma_local:= suma_local + vector(i);
            END LOOP;
            Coordinador.Terminar(suma_local);
         END Empezar;
   END Worker;

   TASK BODY Coordinador IS
      BEGIN
         for i = 1 to 10 LOOP
            arrWorkers(i).Empezar;
         END LOOP;

         for i = 1 to 10 LOOP
            ACCEPT Terminar(numero: IN float) DO
               suma_total:= suma_total + numero;
            END Terminar;
         END LOOP;

         promedio:= suma_total / 1000000.0;
   END Coordinador;

Begin
   null;
END Ejercicio4;
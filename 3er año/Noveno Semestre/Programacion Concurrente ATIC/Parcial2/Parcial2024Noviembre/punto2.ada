Procedure Parcial is

   TASK Sucursal IS
      ENTRY Atender(QR: IN text; paquete: OUT text);
   END Sucursal;

   TASK TYPE Cliente1;
   TASK TYPE Cliente2;

   arrClientes1: array (1..N1) of Cliente1;
   arrClientes2: array (1..N2) of Cliente2;

   TASK BODY Sucursal IS
   BEGIN
      LOOP
         SELECT
            ACCEPT Atender(QR: IN text; paquete: OUT text) DO
               paquete:= obtenerPaquete(QR);
            END Atender;
         END SELECT;
      END LOOP;
   END Sucursal;

   TASK BODY Cliente1 IS
      atendido: boolean:= false;
      mi_qr: text;
      mi_paquete: text;
      intentos: integer:= 0;

   BEGIN
      mi_qr:= obtenerQR();

      WHILE (atendido = false) AND (intentos < 3) LOOP
         SELECT
            Sucursal.Atender(mi_qr,mi_paquete);
            atendido:= true;
         OR DELAY 600.0
            intentos:= intentos + 1;
            if (intentos < 3) then
               caminata();
            END IF;
         END SELECT;
      END LOOP;
   END Cliente1;

   TASK BODY Cliente2 IS
      mi_qr: integer;
      intentos: integer:= 0;
      mi_paquete: text;
      atendido: boolean:= false;

   BEGIN
      mi_qr:= obtenerQR();

      WHILE (atendido = false) AND (intentos < 3) LOOP
         SELECT
            Sucursal.Atender(mi_qr,mi_paquete);
            atendido:= true;
         ELSE
            intentos:= intentos + 1;
            if (intentos < 3) then
               caminata();
            END IF;
         END SELECT;
      END LOOP;
   END Cliente2;
         
Begin
   null;
END Parcial;
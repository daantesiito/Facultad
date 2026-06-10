Procedure Parcial is 

   TASK Organizador IS 
      ENTRY AtenderAnciano(DNI: IN int; remera: OUT text; chip: OUT text);
      ENTRY AtenderGeneral(DNI: IN int; remera: OUT text; chip: OUT text);
      ENTRY AtenderDiscapacitado(DNI: IN int; remera: OUT text; chip: OUT text);
   END Organizador;

   TASK TYPE Persona;

   arrPersona: array (1..P) of Persona;

   TASK BODY Organizador IS
   BEGIN
      FOR i in 1..P LOOP
         SELECT
            ACCEPT AtenderDiscapacitado(DNI: IN int; remera: OUT text; chip: OUT text) DO
               remera:= obtenerRemera(DNI);
               chip:= obtenerChip(DNI);
            END AtenderDiscapacitado;
         OR
            WHEN (AtenderDiscapacitado`count = 0) =>
               ACCEPT AtenderAnciano(DNI: IN int; remera: OUT text; chip: OUT text) DO
                  remera:= obtenerRemera(DNI);
                  chip:= obtenerChip(DNI);
               END AtenderAnciano;
         OR
            WHEN (AtenderDiscapacitado`count = 0) AND (AtenderAnciano`count = 0) =>
               ACCEPT AtenderGeneral(DNI: IN int; remera: OUT text; chip: OUT text) DO
                  remera:= obtenerRemera(DNI);
                  chip:= obtenerChip(DNI);
               END AtenderGeneral;
         END SELECT;
      END LOOP;
   END Organizador;

   TASK BODY Persona IS
      mi_dni: int;
      mi_prioridad: int;
      mi_remera: text;
      mi_chip: text;
   BEGIN
      mi_DNI:= obtenerDNI();

      mi_prioridad:= obtenerPrioridad();

      if (mi_prioridad = 0) then
         Organizador.AtenderDiscapacitado(mi_DNI, mi_remera, mi_chip);
      elsif (mi_prioridad = 1) then
         Organizador.AtenderAnciano(mi_DNI, mi_remera, mi_chip);
      else 
         Organizador.AtenderGeneral(mi_DNI, mi_remera, mi_chip);
   END Persona;

Begin
   null;
END Parcial;
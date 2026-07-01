Procedure parcial is

    TASK Organizador IS
        ENTRY PedirDiscapacitado(id_persona: IN integer);
        ENTRY PedirAnciano(id_persona: IN integer);
        ENTRY PedirAdulto(id_persona: IN integer);
        ENTRY PedirJoven(id_persona: IN integer);
    END Organizador

    TASK Persona IS
        ENTRY Identificarse(id: IN integer);
        ENTRY RecibirPack(remera: IN text; chip: IN text);
    END Persona

    arrPersonas = array 1..P of Persona;

    TASK BODY Persona IS
        mi_id: integer;
        prioridad: integer;
        mi_remera: text;
        mi_chip: text;

        BEGIN
            ACCEPT Identificarse(id: IN integer) DO
                mi_id:= id;
            END Identificarse;

            prioridad:= obtenerPrioridad();

            if (prioridad == 0) then
                Organizador.PedirDiscapacitado(mi_id);
            else if (prioridad == 1) then
                Organizador.PedirAnciano(mi_id);
            else if (prioridad == 2) then
                Organizador.PedirAdulto(mi_id);
            else
                Organizador.PedirJoven(mi_id);
            end if;

            ACCEPT RecibirPack(remera: IN text; chip IN text) do
                mi_remera:= remera;
                mi_chip:= chip;
            END RecibirPack;
        END Persona;

    TASK BODY Organizador IS
        remera: text;
        chip: text;

        BEGIN
            FOR i in 1..P LOOP
                SELECT
                    ACCEPT PedirDiscapacitado(id_persona: IN integer) DO
                        remera:= obtenerRemera(id_persona);
                        chip:= obtenerChip(id_persona);
                        arrPersonas(id_persona).RecibirPack(remera,chip);
                    END PedirDiscapacitado;
                OR
                    WHEN (PedirDiscapacitado'count = 0) =>
                        ACCEPT PedirAnciano(id_persona: IN integer) DO
                            remera:= obtenerRemera(id_persona);
                            chip:= obtenerChip(id_persona);
                            arrPersonas(id_persona).RecibirPack(remera,chip);
                        END PedirAnciano;
                OR
                    WHEN (PedirDiscapacitado'count = 0) AND (PedirAnciano'count = 0) =>
                        ACCEPT PedirAdulto(id_persona: IN integer) DO
                            remera:= obtenerRemera(id_persona);
                            chip:= obtenerChip(id_persona);
                            arrPersonas(id_persona).RecibirPack(remera,chip);
                        END PedirAdulto;
                OR
                    WHEN (PedirDiscapacitado'count = 0) AND (PedirAnciano'count = 0) AND (PedirAdulto'count = 0) =>
                        ACCEPT PedirJoven(id_persona: IN integer) DO
                            remera:= obtenerRemera(id_persona);
                            chip:= obtenerChip(id_persona);
                            arrPersonas(id_persona).RecibirPack(remera,chip);
                        END PedirJoven;
                END SELECT
            END LOOP
        END Organizador;

BEGIN 
    FOR i in 1..P LOOP
        Persona(i).Identificarse(i);
    END LOOP
END Parcial
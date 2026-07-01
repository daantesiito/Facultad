Procedure parcial is

    TASK Coordinador IS
        ENTRY PedirProblema(problema: OUT text);
        ENTRY EntregarResolucion(resolucion: IN text; nota: OUT integer; orden: OUT integer);
    END Coordinador;

    TASK TYPE Participante;

    arrParticipantes = array [1..P] of Participante;

    TASK BODY Coordinador IS
    BEGIN
        FOR i IN (1..(P*2)) LOOP
            SELECT
                WHEN (entregados < P) =>
                    ACCEPT PedirProblema(problema: OUT text) DO
                        problema:= enunciado;
                    END PedirProblema;
                    entregados:= entregados + 1;
            OR
                WHEN (recibidos < P) =>
                    ACCEPT EntregarResolucion(resolucion: IN text; nota: OUT integer; orden: OUT integer) =>
                        recibidos:= recibidos + 1;
                        nota:= corregir(resolucion);
                        orden:= recibidos;
                    END EntregarResolucion;
            END SELECT;
        END LOOP;
    END Coordinador;


    
    TASK BODY Participante IS
        problema: text;
        res: text;
        mi_nota: integer;
        mi_orden: integer;
    BEGIN
        Coordinador.PedirProblema(problema);

        res = resolver(problema);

        Coordinador.EntregarResolucion(res, mi_nota, mi_orden);
    END Participante;

BEGIN
    null;
END Parcial;
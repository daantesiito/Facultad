Process parcial is

    TASK Empleado IS
        ENTRY Atender(QR: IN text; paquete_cliente: OUT text);
    END Empleado;

    TASK TYPE ClienteAnsioso;
    TASK TYPE ClientePaciente;

    arrClientesPacientes = array 1..N1 of ClientePaciente;
    arrClientesAnsiosos = array 1..N2 of ClienteAnsioso;

    TASK BODY Empleado IS
    BEGIN
        LOOP
            ACCEPT Atender(QR: IN text; paquete_cliente: OUT text) DO
                paquete_cliente:= obtenerPaquete(QR);
            END Atender;
        END LOOP
    END Empleado;
    
    TASK BODY ClienteAnsioso IS
    BEGIN
        intentos:= 0
        mi_QR:= obtenerQR();
        WHILE (not atendido) and (intentos < 3) LOOP
            SELECT
                Empleado.Atender(mi_QR, mi_paquete);
                atendido = true;
            ELSE
                intentos++;
                IF (intentos < 3) THEN
                    VueltaALaPlaza();
                END IF;
            END SELECT;
        END LOOP;
    END ClienteAnsioso;

    TASK BODY ClientePaciente IS
    BEGIN
        intentos:= 0;
        mi_QR:= obtenerQR();
        WHILE (not atendido) and (intentos < 3) LOOP
            SELECT
                Empleado.Atender(mi_QR, mi_paquete);
                atendido = true;
            OR DELAY(600)
                intentos++;
                IF (intentos < 3) THEN
                    VueltaALaPlaza();
                END IF;
            END SELECT;
        END LOOP;
    END ClientePaciente;
                
BEGIN
    null;
END parcial;
--------------------------------------------------------------------------
-- INCISO A

TASK Empleado IS
    ENTRY Pagar(monto: IN float; comp: OUT text);
END Empleado;

TASK TYPE Cliente;

arrClientes: array (1..N) of Cliente;

TASK BODY Empleado IS
BEGIN
    LOOP
        ACCEPT Pagar(monto: IN float; comp: OUT text) DO
            comp:= generarComprobante(monto);
        END Pagar;
    END LOOP;
END Empleado;

TASK BODY Cliente IS
    mi_comprobante: text;
    mi_monto: float := 100.0;
BEGIN
    Empleado.Pagar(mi_monto, mi_comprobante);
END Cliente;

--------------------------------------------------------------------------
-- INCISO B

TASK Empleado IS
    ENTRY Pagar(monto: IN float; comp: OUT text);
END Empleado;

TASK TYPE Cliente;

arrClientes: array (1..N) of Cliente;

TASK BODY Empleado IS
BEGIN
    LOOP
        ACCEPT Pagar(monto: IN float; comp: OUT text) DO
            comp:= generarComprobante(monto);
        END Pagar;
    END LOOP;
END Empleado;

TASK BODY Cliente IS
    mi_comprobante: text;
    mi_monto: float := 100.0;
BEGIN
    SELECT
        Empleado.Pagar(mi_monto, mi_comprobante);
    OR DELAY 600.0
        null;
    END SELECT;
END Cliente;

--------------------------------------------------------------------------
-- INCISO C

TASK Empleado IS
    ENTRY Pagar(monto: IN float; comp: OUT text);
END Empleado;

TASK TYPE Cliente;

arrClientes: array (1..N) of Cliente;

TASK BODY Empleado IS
BEGIN
    LOOP
        ACCEPT Pagar(monto: IN float; comp: OUT text) DO
            comp:= generarComprobante(monto);
        END Pagar;
    END LOOP;
END Empleado;

TASK BODY Cliente IS
    mi_comprobante: text;
    mi_monto: float := 100.0;
BEGIN
    SELECT
        Empleado.Pagar(mi_monto, mi_comprobante);
    ELSE 
        null;
    END SELECT;
END Cliente;

--------------------------------------------------------------------------
-- INCISO D

TASK Empleado IS
    ENTRY Pagar(monto: IN float; comp: OUT text);
END Empleado;

TASK TYPE Cliente;

arrClientes: array (1..N) of Cliente;

TASK BODY Empleado IS
BEGIN
    LOOP
        ACCEPT Pagar(monto: IN float; comp: OUT text) DO
            comp:= generarComprobante(monto);
        END Pagar;
    END LOOP;
END Empleado;

TASK BODY Cliente IS
    mi_comprobante: text;
    mi_monto: float := 100.0;
BEGIN
    SELECT
        Empleado.Pagar(mi_monto, mi_comprobante);
    OR DELAY 600.0
        SELECT 
            Empleado.Pagar(mi_monto, mi_comprobante);
        ELSE
            null;
        END SELECT;
    END SELECT;
END Cliente;

--------------------------------------------------------------------------
-- INCISO A

TASK Puente IS
    ENTRY EntrarAuto;
    ENTRY EntrarCamioneta;
    ENTRY EntrarCamion;
    ENTRY Salir(peso: IN integer);
END Puente;

TASK TYPE Auto;
TASK TYPE Camioneta;
TASK TYPE Camion;

arrAutos: array (1..A) of Auto;
arrCamioneta: array (1..B) of Camioneta;
arrCamion: array (1..C) of Camion;

TASK BODY Puente IS
    peso_actual: integer:= 0;
BEGIN
    LOOP
        SELECT
            WHEN (peso_actual + 1 <= 5) => ACCEPT EntrarAuto DO
                                                peso_actual:= peso_actual + 1;
                                            END EntrarAuto;
        OR      
            WHEN (peso_actual + 2 <= 5) => ACCEPT EntrarCamioneta DO
                                                peso_actual:= peso_actual + 2;
                                            END EntrarCamioneta;
        OR
            WHEN (peso_actual + 3 <= 5) => ACCEPT EntrarCamion DO
                                                peso_actual:= peso_actual + 3;
                                            END EntrarCamion;
        OR
            ACCEPT Salir(peso: IN integer) DO
                peso_actual:= peso_actual - peso;
            END Salir;
        END SELECT;
    END LOOP;
END Puente;

TASK BODY Auto IS
BEGIN
    Puente.EntrarAuto;
    // Cruzar Puente;
    Puente.Salir(1); // Sale y manda su peso
END Auto;

TASK BODY Camioneta IS
BEGIN
    Puente.EntrarCamioneta;
    //Cruzar
    Puente.Salir(2);
END Camioneta;

TASK BODY Camion IS
BEGIN
    Puente.EntrarCamion;
    //Cruzar;
    Puente.Salir(3);
END Camion;

--------------------------------------------------------------------------
-- INCISO B

TASK Puente IS
    ENTRY EntrarAuto;
    ENTRY EntrarCamioneta;
    ENTRY EntrarCamion;
    ENTRY Salir(peso: IN integer);
END Puente;

TASK TYPE Auto;
TASK TYPE Camioneta;
TASK TYPE Camion;

arrAutos: array (1..A) of Auto;
arrCamioneta: array (1..B) of Camioneta;
arrCamion: array (1..C) of Camion;

TASK BODY Puente IS
    peso_actual: integer:= 0;
BEGIN
    LOOP
        SELECT
            WHEN (peso_actual + 3 <= 5) => ACCEPT EntrarCamion DO
                                                peso_actual:= peso_actual + 3;
                                            END EntrarCamion;
        OR      
            WHEN (peso_actual + 2 <= 5) AND (EntrarCamion`count = 0) => ACCEPT EntrarCamioneta DO
                                                peso_actual:= peso_actual + 2;
                                            END EntrarCamioneta;
        OR
            WHEN (peso_actual + 1 <= 5) AND (EntrarCamion`count = 0) => ACCEPT EntrarAuto DO
                                                peso_actual:= peso_actual + 1;
                                            END EntrarAuto;
        OR
            ACCEPT Salir(peso: IN integer) DO
                peso_actual:= peso_actual - peso;
            END Salir;
        END SELECT;
    END LOOP;
END Puente;

TASK BODY Auto IS
BEGIN
    Puente.EntrarAuto;
    // Cruzar Puente;
    Puente.Salir(1); // Sale y manda su peso
END Auto;

TASK BODY Camioneta IS
BEGIN
    Puente.EntrarCamioneta;
    //Cruzar
    Puente.Salir(2);
END Camioneta;

TASK BODY Camion IS
BEGIN
    Puente.EntrarCamion;
    //Cruzar;
    Puente.Salir(3);
END Camion;

--------------------------------------------------------------------------
// La  UNLP  está  organizando  su  maratón  anual  y  P  personas  que  deben  pasar  a  retirar  su  remera  y  chip  antes  de  la
// carrera. Para ello, los corredores deben dirigirse al edificio de Rectorado, donde habrá un organizador que los atenderá.
// Los corredores son atendidos de acuerdo con el orden de llegada, teniendo prioridad los corredores ancianos sobre los
// jóvenes y adultos. Adicionalmente, los corredores con discapacidad tienen prioridad sobre todos los anteriores. Para ser
// atendidos,  los  corredores entregan  su DNI  al  organizador,  quien  como  respuesta  les  entrega  la  remera  oficial  y  el chip
// asociado.  Implemente  un  programa  que  permita  resolver  el  problema  anterior  usando  PMA.  Notas:  para  conocer  su
// prioridad,  cada  corredor  puede  llamar  a  la  función  obtenerPrioridad(),  la  cual  retorna  0  si  la  persona  tiene  alguna
// discapacidad, 1 si es  anciana, o 2 en otro caso; la función  obtenerRyC(dni) retorna la remera y el chip asociado para el
// DNI recibido como entrada; la función obtenerDNI() retorna el DNI para el corredor que la invoca.

Process Corredor[id: 0..P] {

    mi_prio = obtenerPrioridad();
    mi_dni = obtenerDNI();

    Administrador!llegue(id, prio, mi_dni)
    
    Organizador?recibirPack(RyC);

}

Process Administrador {
    int llegados = 0;

    do (llegados < P); Corredor[*]?llegue(id_c, prio_c, dni_c) =>
        
        if (prio_c = 0) {
            insertar(colaDisc, id_c, dni_c);
        } else if (prio_C = 1) {
            insertar(colaAnc, id_c, dni_c);
        } else {
            insertar(colaJyA, id_c, dni_c);
        }
    
    [] (not empty (colaDisc) or (not empty colaAnc) or (not empty colaJyA)); Organizador?pedido(); =>
        
        if (not empty(colaDisc)) {
            sacar(colaDisc, id_c, dni_c);
        } else if (not empty(colaAnc)) {
            sacar(colaAnc, id_c, dni_c);
        } else {
            sacar(colaJyA, id_c, dni_c);
        }

        Organizador!siguiente(id_c, dni_c);
    od 
}

Process Organizador {

    for i = 1 to P {
        
        Administrador!pedido();
        Administrador?siguiente(id_c, dni_c);

        RyC = obtenerRyC(dni_c);

        Corredor[id_c]!recibirPack(RyC)

    }
}
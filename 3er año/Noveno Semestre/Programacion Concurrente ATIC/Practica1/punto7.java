// Dada la siguiente solución para el Problema de la Sección Crítica entre dos procesos
// (suponiendo que tanto SC como SNC son segmentos de código finitos, es decir que terminan
// en algún momento), indicar si cumple con las 4 condiciones requeridas:

int turno = 1

Process SC1::
{ while (true)
    {while (turno == 2) skip;
        SC; // SECCION CRITICA
        turno = 2;
        SNC; // SECCION NO CRITICA
    }
}

Process SC2::
{ while (true)
    {while (turno == 1) skip;
        SC; // SECCION CRITICA
        turno = 1;
        SNC; // SECCION NO CRITICA
    }
}

// Propieades de la SC
// 1 - Exclusión mutua: A lo sumo un proceso está en su SC
// 2 - Ausencia de Deadlock (Livelock): si 2 o más procesos tratan de entrar a sus SC, al menos uno tendrá éxito.
// 3 - Ausencia de Demora Innecesaria: si un proceso trata de entrar a su SC y los otros están en sus SNC o terminaron, el primero no está impedido de entrar a su SC.
// 4 - Eventual Entrada: un proceso que intenta entrar a su SC tiene posibilidades de hacerlo (eventualmente lo hará).

// La unica propiedad que no se cumple es la propiedad 3, ya que si SC1 pone turno en 2 y se 
// mete en su seccion no critica, deja que entre SC2 pero si SC2 termina y quiere entrar denuevo
// a su SC mientras que SC1 esta en su seccion no critica, ocurre la demora innecesaria por esperar
// a que el otro proceso termine y me deje pasar devuelta.
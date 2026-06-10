// INCISO A

Process Persona[id: 0..P-1] {
    int basura;

    Empleado!pedido(id);

    Empleado?usalo(basura);
    usarSimulador();

    Empleado!termine(id);

}

Process Empleado {
    int id_persona;
    int basura;

    for i = 1 to P {
        Persona[*]?pedido(id_persona);

        Persona[id_persona]!usalo(1);

        Persona[id_persona]?termine(basura);
    }

}

// -----------------------------------------------------------------
// INCISO B

Process Persona[id: 0..P-1] {
    int basura;

    Empleado!pedido(id);

    Empleado?usalo(basura);
    usarSimulador();

    Empleado!termine(id);

}

Process Empleado {
    int id_persona;
    int basura;

    for i = 0 to P-1 {
        Persona[i]?pedido(id_persona);

        Persona[i]!usalo(1);

        Persona[i]?termine(basura);
    }

}

// -----------------------------------------------------------------
// INCISO C

Process Persona[id: 0..P-1] {
    int basura;

    Admin!pedido(id);

    Empleado?usalo(basura);

    usarSimulador();

    Empleado!termine(id);

}

Process Empleado {
    int id_persona;
    int basura;
    boolean seguir = true;

    for i = 1 to P {
        Admin!simVacio(1);

        Admin?siguientePersona(id_persona);

        Persona[id_persona]!usalo(1);

        Persona[id_persona]?termine(basura);
    }
}

Process Admin {
    cola cola;
    int pasaron = 0;
    int pidieron = 0;
    int id_persona_guardar;
    int id_persona_pasar;
    int basura;

    do (pidieron < P); Persona[*]?pedido(id_persona_guardar) ->
        Insertar(cola, id_persona_guardar);
        pidieron++;
    [] (pasaron < P and not empty(cola)); Empleado?simVacio(basura) ->
        Sacar(cola, id_persona_pasar);
        Empleado!siguientePersona(id_persona_pasar);
        pasaron++;
    od
}

// -----------------------------------------------------------------

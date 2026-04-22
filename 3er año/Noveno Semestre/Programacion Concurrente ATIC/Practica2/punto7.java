// INCISO A
sem mutex = 1;

Process Persona {
    P(mutex);
        Imprimr(documento);
    V(mutex);
}

// INCISO B - Orden de llegada - Passing de baton
sem mutex = 1;
Cola cola;
sem turno[0..N-1] = 0;
int libre = 1;

Process Persona[id: 0..N-1] {
    P(mutex);
        if (libre == 1) {
            libre = 0;
            V(turno[id]);
        }
        else {
            push(id, cola);
        }
    V(mutex);

    P(turno[id]);
        Imprimir(documento);

    P(mutex);
        if (empty(cola)) {
            libre = 1;
        }
        else {
            pop(cola, id_sig);
            V[turno[id_sig]];
        }
    V(mutex);
}

// INCISO C - Proximo es id + 1
sem turno[0..N-1] = 0;
sem turno[0] = 1;

Process Persona[id: 0..N-1] {
    P(turno[id]);
        Imprimir(documento);
    if (id < N-1) {
        V(turno[id+1]);
    }
}

// INCISO D - Coordinador para inciso B.

sem mutex = 1;
Cola cola;
sem turno[0..N-1] = 0;
int libre = 1;
sem termine = 0;

Process Persona[id: 0..N-1] {
    P(mutex);
        if (libre == 1) {
            libre = 0;
            V(turno[id]);
        }
        else {
            push(id, cola);
        }
    V(mutex);

    P(turno[id]);
        Imprimir(documento);
    V(termine);
}

Process Coordinador {
    int id_sig;
    while true {
        P(termine);
            P(mutex);
                if (empty(cola)) {
                    libre = 1;
                }
                else {
                    pop(cola, id_sig);
                    V(turno[id_sig]);
                }
            V(mutex);
    }
}

// INCISO E - 5 impresoras con coordinador.

sem mutex = 1;
Cola cola;
sem turno[0..N-1] = 0;
sem termine = 0;
Cola impresoras_libres[0..4];

Process Persona[id: 0..N-1] {
    P(mutex);
        push(id, cola);
    V(mutex);

    V(hayGente);

    P(turno[id]);
        pop(impresoras_id)
        Imprimir(impresora_asig, documento);
    V(impresoras);
}

Process Coordinador {
    int id_sig;
    while true {
        P(hayGente);
            P(impresoras)
                P(mutex);
                    pop(cola, id_sig);
                    V(turno[id_sig]);
                V(mutex);
    }
}
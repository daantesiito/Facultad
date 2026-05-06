// 1. Resolver con SEMÁFOROS los problemas siguientes:
// a) En una estación de trenes, asisten P personas que deben realizar una carga de su tarjeta SUBE en la terminal disponible.
// La terminal es utilizada en forma exclusiva por cada persona de acuerdo con el orden de llegada.
// Implemente una solución utilizando únicamente procesos Persona.
// Nota: la función UsarTerminal() le permite cargar la SUBE en la terminal disponible.

sem mutex = 1;
int libre = 1;
int esperando = 0;
sem espera[P] = ([P], 0);
cola cola;

Process Persona[id: 0..P-1]
    int id_sig;    

    P(mutex);
        if (libre == 0) {
            Insertar(cola, id);
            esperando++;
            V(mutex);
            P(espera[id]);
        } else {
            libre = 0;
            V(mutex);
        }
    
    UsarTerminal();
    
    P(mutex);
        if (esperando > 0) {
            Sacar(cola, id_sig);
            esperando--;
            V(espera[id_sig]);
        } else {
            libre = 1;
        }
    V(mutex);

end Process;

// b) Resuelva el mismo problema anterior pero ahora considerando que hay T terminales disponibles.
// Las personas realizan una única fila y la carga la realizan en la primera terminal que se libera.
// Recuerde que sólo debe emplear proceso Persona.
// Nota: la función UsarTerminal(i) le permite cargar la SUBE en la terminal i.

sem mutex = 1;
int terminales_libres = T;
int esperando = 0;
sem espera[P] = ([P], 0);
cola cola;
cola terminales;
int vector_terminales[T];

Process Persona[id: 0..P-1]
    int id_sig;    

    P(mutex);
        if (terminales_libres == 0) {
            Insertar(cola, id);
            esperando++;
            V(mutex);

            P(espera[id]);

            mi_terminal = vector_terminales[id];
        } else {
            terminales_libres--;
            Sacar(terminales, mi_terminal);
            V(mutex);
        }
    
    UsarTerminal(mi_terminal);
    
    P(mutex);
        if (esperando > 0) {
            Sacar(cola, id_sig);
            esperando--;
            vector_terminales[id_sig] = mi_terminal;
            V(espera[id_sig]);
        } else {
            terminales_libres++;
            Insertar(terminales, mi_terminal);
        }
    V(mutex);

end Process;

// Resolver con MONITORES el siguiente problema.
// En una elección estudiantil, se utiliza una máquina para voto electrónico.
// Existen N Personas que votan y una Autoridad de Mesa que les da acceso a la máquina de acuerdo con el orden de llegada, aunque ancianos y embarazadas tienen prioridad sobre el resto.
// La máquina de voto sólo puede ser usada por una persona a la vez.
// Nota: la función Votar() permite usar la máquina.

Monitor Mesa
    int esperando = 0;
    cola colaOrdenada;
    cond despertar_autoridad;
    cond esperar_turno[N];
    cond mesa_libre;

    Procedure votar(id: int in; edad: int in) {
        Insertar(colaOrdenada, id, edad);
        esperando++;
        signal(despertar_autoridad);

        wait(esperar_turno[id]);
    }

    Procedure salir() {
        signal(mesa_libre);
    }

    Procedure dar_acceso() {
        int id_usar;

        while (esperando == 0) {
            wait(despertar_autoridad);
        }

        wait(mesa_libre);
        
        Sacar(colaOrdenada, id_usar);
        esperando--;
        signal(esperar_turno[id_usar]);
    }

end Monitor

Process Persona[id: 0..N-1]
    int edad;

    Mesa.votar(id, edad);

    votar();

    Mesa.salir();

end Process;

Process Autoridad

    for (int i: 0; i < N; i++) {
        Mesa.dar_acceso();
    }

end Process;
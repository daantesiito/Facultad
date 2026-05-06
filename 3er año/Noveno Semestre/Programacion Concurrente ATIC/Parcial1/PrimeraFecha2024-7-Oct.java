// 1. Se debe simular el uso de un sistema virtual de venta de entradas para un evento musical.
// El sistema cuenta con C cajeros virtuales que atienden indefinidamente.
// Sin embargo, como la venta de entradas comienza a una hora determinada, sólo atienden a partir del aviso de un Timer.
// Una vez que reciben dicho aviso, los cajeros atienden de acuerdo con el orden de llegada de los compradores.
// La atención consiste en recibir la solicitud del comprador (datos para el pago) y responderle si pudo comprar (o no) junto al comprobante de la operación.
// Para este evento se cuenta con E entradas y N compradores, donde cada comprador puede solicitar a lo sumo una entrada.
// Resuelva usando SEMÁFOROS.

cola cola;
sem mutex_Comprador[N]; ([N], 0);
text comprobante[N];
text resultado[N];
sem mutex_prender = 1;
sem mutexCajeros = 0;
sem mutexHayCompra = 0;
sem mutex = 1;
sem mutex_cola = 1;
sem mutex_entradas = 1;
int esperando = 0;
int entradas = E;

Process Timer

    Delay(hora);

    for (int i: 0; i < N; i++)
        V(mutexCajeros);

end Process

Process Cajero[id: 0..N-1]
    int id_comp;
    text datos_comp;
    bool res;

    P(mutexCajeros);

    while (true) {
        P(mutexHayCompra);
        
        P(mutex);
            Sacar(cola, id_comp, datos_comp);
        V(mutex);

        res = false;

        P(mutex_entradas);
            if (entradas > 0) {
                entradas--;
                res = true;
            }
        V(mutex_entradas);

        resultado[id_comp] = res;

        if (res) {
            comprobante[id_comp] = generarComprobante();
        } else {
            comprobante[id_comp] = "No hay mas entradas";
        }

        V(mutex_Comprador[id_comp]);
    }

end Process

Process Comprador[id: 0..N-1]
    text datos;
    text res;
    text comp;

    P(mutex);
        Insertar(cola, id, datos);
        V(mutexHayCompra);
    V(mutex);

    P(mutex_Comprador[id]);

    res = resultado[id];
    comp = comprobante[id];

end Process

// 2. Existen N personas que desean acceder a un mirador al borde del lago Nahuel Huapi en Bariloche.
// Como el mirador es angosto, sólo puede ser usado por una persona a la vez.
// Resuelva con MONITORES los dos casos siguientes:
// a. El acceso al mirador es por orden de llegada.
// b. El acceso al mirador es por orden de llegada, pero dando prioridad a los mayores de 60 años.

// INCISO A

Monitor Mirador

    int libre = 1;
    cond cola;
    int esperando = 0;

    Procedure Pasar() {
        if (libre == 0) {
            esperando++;
            wait(cola);
        } else {
            libre = 0;
        }
    }

    Procedure Salir() {
        if (esperando > 0) {
            esperando--;
            signal(cola);
        } else {
            libre = 1;
        }
    }

end Monitor

Process Persona[id: 0..N-1]

    Mirador.Pasar();

    UsarMirador();

    Mirador.Salir();

end Process

// INCISO B

Monitor Mirador

    int libre = 1;
    cond espera[N];
    cola colaOrdenada;
    int esperando = 0;

    Procedure Pasar(id: int in; edad: int in) {
        if (libre == 0) {
            esperando++;
            InsertarOrdenado(colaOrdenada, id, edad)
            wait(espera[id]);
        } else {
            libre = 0;
        }
    }

    Procedure Salir() {
        int id_usar;

        if (esperando > 0) {
            esperando--;
            Sacar(colaOrdenada, id_usar)
            signal(espera[id_usar]);
        } else {
            libre = 1;
        }
    }

end Monitor

Process Persona[id: 0..N-1]
    int edad;

    Mirador.Pasar(id, edad);

    UsarMirador();

    Mirador.Salir();

end Process
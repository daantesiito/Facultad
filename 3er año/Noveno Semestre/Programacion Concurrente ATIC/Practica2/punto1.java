// Un sistema operativo mantiene 5 instancias de un recurso almacenadas en una cola.
// Además, existen P procesos que necesitan usar una instancia del recurso. Para eso, deben
// sacar la instancia de la cola antes de usarla. Una vez usada, la instancia debe ser encolada
// nuevamente.

sem instancias = 5;
sem mutex = 1;

Cola cola;

Process Proceso[id: 0..P-1] {
    int recurso;

    P(instancias);

        P(mutex);
            recurso = Sacar(cola);
        V(mutex);

        // Usa recurso

        P(mutex);
            Agregar(cola, recurso);
        V(mutex);

    V(instancias);

}
// Un sistema de control cuenta con 4 procesos que realizan chequeos en forma
// colaborativa. Para ello, reciben el historial de fallos del día anterior (por simplicidad, de
// tamaño N). De cada fallo, se conoce su número de identificación (ID) y su nivel de
// gravedad (0=bajo, 1=intermedio, 2=alto, 3=crítico). Para cada item realice una solución
// adecuada a lo pedido:
// a. Se debe imprimir en pantalla los ID de todos los errores críticos (no importa el orden).
// b. Se debe calcular la cantidad de fallos por nivel de gravedad, debiendo quedar los
// resultados en un vector global.
// c. Ídem b) pero cada proceso debe ocuparse de contar los fallos de un nivel de gravedad
// determinado.

// INCISO A
int fallos[0..N-1];

Process Proceso[id: 0..3] {
    int tamaño = N/3;
    int inicio = tamaño * id;
    int termina = inicio + tamaño;
    for (int i=inicio; i<termina; i++) {
        if (fallos[i] == 3) {
            Imprimir(i);
        }
    }
}

// INCISO B
sem mutex = 1;
int fallos[0..N-1];
int totalGravedad[0..3];

Process Proceso[id: 0..3] {
    int tamaño = N/3;
    int inicio = tamaño * id;
    int termina = inicio + tamaño;
    int contadorLocal[4];(4,0)
    for (int i=inicio; i<termina; i++) {
        int gravedad = fallos[i];
        contadorLocal[gravedad]= contadorLocal[gravedad] + 1;
    }

    P(mutex);
        for (int i=0; i<4; i++) {
            totalGravedad[i] = totalGravedad[i] + contadorLocal[i];
        }
    V(mutex);
}

// INCISO C
int fallos[0..N-1];
int totalGravedad[0..3];

Process Proceso[id: 0..3] {
    int tamaño = N/3;
    int inicio = tamaño * id;
    int termina = inicio + tamaño;
    for (int i=inicio; i<termina; i++) {
        if (fallos[i] == id);
            totalGravedad[id] = totalGravedad[id] + 1;
    }
}
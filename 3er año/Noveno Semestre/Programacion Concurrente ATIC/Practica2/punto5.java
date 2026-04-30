sem mutex = 1;
sem barrera = 0;
int llegaron = 0;
int puntajes[0..9];
int terminaron[0..9];
sem espera_puntaje[1..10];

Process Alumno[id: 0..49] {
    
    tarea = elegir();

    P(mutex);
        llegaron = llegaron + 1;
        if (llegaron == 50)
            for (i=0; i<50; i++)
                V(barrera);
    V(mutex);

    P(barrera);

    hacer(tarea);

    P(mutex_tarea);
        terminaron[tarea] = terminaron[tarea] + 1;
        if (terminaron[tarea] == 5)
            P(mutex_cola);
                push(cola, tarea);
            V(mutex_cola);
            V(mutex_profe);
    V(mutex_tarea);

    P(espera_puntaje[tarea]);
}

Process Profesor {

    for (i=0; i<10; i++) {
        P(mutex_profe);
            P(mutex_cola);
                pop(cola, tarea_corregir);
            V(mutex_cola);
            
            corregir(tarea_corregir);
            
            puntajes[tarea_corregir] = orden;
            orden = orden + 1;

            for (j=0; j<5; j++) {
                V(espera_puntaje[tarea_corregir]);
            }
            
    }
}


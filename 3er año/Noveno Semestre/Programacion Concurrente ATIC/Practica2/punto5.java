sem mutex = 1;
sem barrera = 0;
int llegaron = 0;

Process Alumno[id: 0..49] {
    
    tarea = elegir();

    P(mutex);
        llegaron = llegaron + 1;
        if (llegaron == 50)
            V(barrera);
    V(mutex);

    P(barrera);
    V(barrera);

}


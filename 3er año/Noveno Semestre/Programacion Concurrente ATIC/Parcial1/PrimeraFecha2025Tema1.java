// 1. Resolver con SEMÁFOROS el siguiente problema.
// Se tiene un vector A de 1.000.000 de números, del cual se debe obtener el promedio de sus valores utilizando 10 procesos Worker.  
// Al terminar todos los procesos deben imprimir el resultado.
// Nota: maximizar concurrencia; únicamente se pueden usar los 10 procesos Worker.

int vector[1000000];
int sumaTotal = 0;
int terminados = 0;

sem mutexSuma = 1;
sem mutex = 1;        
sem barrera = 0;      

Process Worker[id: 0..9] { 
    int sumaLocal = 0;
    int tamaño = 1000000 / 10;
    int inicio = id * tamaño;
    int final = inicio + tamaño;

    for (int i = inicio; i < final; i++) {
        sumaLocal = sumaLocal + vector[i];
    }
    
    P(mutexSuma);
        sumaTotal = sumaTotal + sumaLocal;
    V(mutexSuma);

    P(mutex);
        terminados++;
        if (terminados == 10) {
            for (int i = 0; i < 10; i++) {
                V(barrera);
            }
        }
    V(mutex);

    P(barrera);

    Imprimir(sumaTotal / 1000000);

end Process

// 2. Resolver con SEMÁFOROS la siguiente situación.
// A una acopiadora de cereales llegan 20 camiones que deben descargar su cereal.
// Los camiones se descargan de a uno por vez, y de acuerdo con orden de llegada.
// Una vez que el camión llegó, espera a que llegue su turno para comenzar a descargar su cereal.  
// Nota: sólo se pueden usar procesos que representen a los camiones; cada camión descarga sólo una vez; la descarga del camión se simula por medio de la función DESCARGAR() llamada por el camión.

int esperando = 0;
sem mutex = 1;
sem mutexPaso[20] = ([20], 0);
int libre = 1;
cola cola;


Process Camion[id: 0..19]
    int id_pasar;
    
    P(mutex);
        if (libre == 1) {
            libre = 0;
            V(mutexPaso[id]); 
        } else {
            esperando++;
            Insertar(cola, id);
        }
    V(mutex);
    
    P(mutexPaso[id]); 
        Descargar();

    P(mutex);
        if (esperando > 0) {
            Sacar(cola, id_pasar);
            V(mutexPaso[id_pasar]);
        } else {
            libre = 1;
        }
    V(mutex);

end Process

// 3. Resolver con MONITORES el siguiente problema.
// En una cátedra hay un profesor, un auxiliar y 100 alumnos.
// Cada alumno continuamente hace consultas que pueden ser de dos tipos: TEÓRICAS o PRÁCTICAS; cada vez que tiene una consulta para hacer se la envía por mail al docente correspondiente y espera a que este le envíe la respuesta.
// El profesor sólo atiende consultas TEÓRICAS y el auxiliar sólo consultas PRÁCTICAS; cada uno resuelve sus consultas de acuerdo con orden de llegada.
// Nota: maximizar concurrencia; el alumno sabe de qué tipo es cada consulta; los procesos NO deben terminar.

Monitor Consultas[id: 0..1] {
    cola colaPedidos;
    int esperando = 0;
    
    cond despertarDocente;    
    cond colaAlumnos[100];
    text respuestas[100];      

    Procedure HacerConsulta(id: in int, consulta: in text, respuesta: out text) {
        Insertar(colaPedidos, id, consulta);
        esperando++;
        signal(despertarDocente);

        wait(colaAlumnos[id]);

        respuesta = respuestas[id];
    }

    Procedure BuscarConsulta(id: out int, consulta: out text) {
        while (esperando == 0) {
            wait(despertarDocente);
        }
        esperando--;
        Sacar(colaPedidos, id, consulta);
    }

    Procedure ResponderConsulta(id: in int, consulta: in text, respuesta: in text) {
        respuestas[id] = respuesta;
        signal(colaAlumnos[id]);
    }

} // Fin Monitor

Process Alumno[id: 0..99] {
    int tipo;
    text consulta;
    text respuesta;

    while (true) {
        consulta = generarConsulta();
        tipo = consulta.tipo; // Supongamos que devuelve 0 (Teoría) o 1 (Práctica)
        Consultas[tipo].HacerConsulta(id, consulta, respuesta);
    }
}

Process Profesor {
    int id;          
    text consulta;    
    text respuesta;

    while (true) {
        Consultas[0].BuscarConsulta(id, consulta); 
        
        respuesta = Responder(consulta); 
        
        Consultas[0].ResponderConsulta(id, consulta, respuesta); 
    }
}

Process Auxiliar {
    int id;           
    text consulta;    
    text respuesta;

    while (true) {
        Consultas[1].BuscarConsulta(id, consulta); 
        
        respuesta = Responder(consulta); 
        
        Consultas[1].ResponderConsulta(id, consulta, respuesta); 
    }
}
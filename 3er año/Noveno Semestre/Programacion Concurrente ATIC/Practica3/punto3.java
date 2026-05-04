// 3.  Existen N personas que deben fotocopiar un documento. La fotocopiadora sólo puede ser 
// usada  por  una  persona  a  la  vez.  Analice  el  problema  y  defina  qué  procesos,  recursos  y 
// monitores serán necesarios/convenientes, además de las posibles sincronizaciones requeridas 
// para resolver el problema. Luego, resuelva considerando las siguientes situaciones: 
// a. Implemente  una  solución  suponiendo  no  importa el  orden  de  uso.  Existe  una  función 
// Fotocopiar() que simula el uso de la fotocopiadora.  
// b. Modifique la solución de (a) para el caso en que se deba respetar el orden de llegada. 
// c. Modifique la solución de (a) para el caso en que se deba dar prioridad de acuerdo con la 
// edad de cada persona (cuando la fotocopiadora está libre la debe usar la persona de mayor 
// edad entre las que estén esperando para usarla). 
// d. Modifique la solución de (a) para el caso en que se deba respetar estrictamente el orden 
// dado por el identificador del proceso (la persona X no puede usar la fotocopiadora hasta 
// que no haya terminado de usarla la persona X-1). 
// e. Modifique la solución de (b) para el caso en que además haya un Empleado que le indica 
// a cada persona cuando debe usar la fotocopiadora. 
// f. Modificar la solución (e) para el caso en que sean 10 fotocopiadoras. El empleado le indica 
// a la persona cuál fotocopiadora usar y cuándo hacerlo. 

// INCISO A

Monitor Impresora
    
    Procedure usar();
        Fotocopiar();

end Monitor;

Procedure Persona[id: 0..N-1] 

    Impresora.usar();

end Procedure;

// INCISO B

Monitor Impresora 

    cond cola;
    int libre = 1;
    int esperando = 0;

    Procedure usar() {
        if (libre == 0) {
            esperando++;
            wait(cola);
        } else {
            libre--;
        }
    }

    Procedure dejar() {
        if (esperando > 0) {
            esperando--;
            signal(cola);
        } else {
            libre++;
        }
    }

end Monitor;

Procedure Persona[id: 0..N-1]

    Impresora.usar();
    // Usar impresora
    Impresora.dejar();

end Procedure;

// INCISO C

Monitor Impresora 

    cond espera[N];
    colaOrdenada cola;
    int libre = 1;
    int esperando = 0;
    int id_usar;

    Procedure usar(id, edad) {
        if (libre == 0) {
            esperando++;
            insertar(cola, id, edad)
            wait(espera[id]);
        } else {
            libre--;
        }
    }

    Procedure dejar() {
        if (esperando > 0) {
            esperando--;
            sacar(cola, id_usar);
            signal(espera[id_usar]);
        } else {
            libre++;
        }
    }

end Monitor;

Process Persona[id: 0..N-1]

    int edad;

    Impresora.usar(id, edad);
    // Usar impresora
    Impresora.dejar();

end Process;

// INCISO D

Monitor Impresora 

    cond espera[N];
    int turno = 0;

    Procedure usar(id) {
        if (id != turno)
            wait(espera[id])

    Procedure dejar() {
        turno++;
        if (turno < N)
            signal(espera[turno]);
    }

end Monitor;

Process Persona[id: 0..N-1]

    Impresora.usar(id);
    // Usar impresora
    Impresora.dejar();

end Process;

// INCISO E

Monitor Impresora 

    cond colaEspera;
    cond empleadoDormido;
    int esperando = 0;
    int libre = 1;

    Procedure solicitar_turno() {
        esperando++;
        signal(empleadoDormido);
        wait(colaEspera);
    }

    Procedure dejar_impresora() {
        libre = 1;
        signal(empleadoFin);
    }

    Procedure dar_turno() {
        while (esperando == 0) {
            wait(empleadoDormido);
        } 
        while (libre == 0) {
            wait(empleadoFin);
        }
        esperando--;
        libre = 0;
        signal(colaEspera);
    }

end Monitor;

Process Empleado

    while true
        Impresora.dar_turno();

end Process

Process Persona[id: 0..N-1]

    Impresora.usar();
    // Usar impresora
    Impresora.dejar();

end Process;
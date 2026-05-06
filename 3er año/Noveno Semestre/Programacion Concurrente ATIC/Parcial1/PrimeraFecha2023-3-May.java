// 1. Resolver con SEMAFOROS el siguiente problema.
// Para un experimento se tiene una red con 15 controladores de temperatura y dos módulos centrales.
// Los controladores cada cierto tiempo toman la temperatura mediante la función medir() 
// y la envían para que alguna de las centrales le indique qué debe hacer (número de 1 a 10), y luego realiza esa acción mediante la función actuar().
// Las centrales atienden los pedidos de los controladores de acuerdo al orden de llegada, 
// usando la función determinar() para determinar la acción que deberá hacer ese controlador (número de 1 a 10).
// Nota: el tiempo que espera cada controlador para tomar nuevamente la temperatura empieza a contar después de haber ejecutado la función actuar().

sem mutexCola = 1;
sem esperarAccion[15] = ([15], 0);
sem esperarTemperaturas = 0;
int acciones[0..14];
cola cola;
time tiempo = X;

Process Controlador[id: 0..14]
    int temperatura;
    int mi_accion;

    temperatura = medir();

    P(mutexCola);
        Insertar(cola, id, temperatura);
    V(mutexCola);

    V(hayTemperaturas);

    P(esperarAccion[id]);

    mi_accion = acciones[id];

    actuar(mi_accion);

    Delay(tiempo);

end Process;

Process Central[id: 0..1]
    int temperatura_medida;
    int id_usar;

    while (true) {
        P(hayTemperaturas);

        P(mutexCola);
            Sacar(cola, id_usar, temperatura_medida);
        V(mutexCola);

        acciones[id_usar] = determinar(temperatura_medida);

        V(esperarAccion[id_usar]);
    }

end Process;

// 2. Resolver con MONITORES el siguiente problema.
// Hay una boletería virtual que vende en forma online E entradas para un partido de fútbol a P personas (P > E) de acuerdo con el orden de llegada.
// Cuando la boletería atiende a una persona, si aún quedan entradas disponibles le envía el número de entrada vendida, sino le indica que no hay más entradas.
// Nota: suponga que existe la función vender() que simula la venta de la entrada.

Monitor AdminBoleteria
    cola cola;
    int esperando = 0;
    cond hayCompra;
    cond esperaVenta[P] = ([P], 0);
    text entradas[P];

    Procedure comprar_entrada(id_usar: int in; mi_entrada: text out) {
        Insertar(cola, id_usar);
        esperando++;
        signal(hayCompra);

        wait(esperaVenta[id_usar]);

        mi_entrada = entradas[id_usar];
    }

    Procedure hay_compra(id: int out) {
        while (esperando == 0) {
            wait(hayCompra);
        }
        esperando--;
        Sacar(cola, id);
    }

    Procedure vender_entrada(id_usar: int in; entrada_vendida: text in) {
        entradas[id_usar] = entrada_vendida;
        signal(esperaVenta[id_usar]);
    }

end Monitor;

Process Persona[id: 0..P-1]
    text entrada;

    AdminBoleteria.comprar_entrada(entrada);

end Process;

Process Boleteria
    int id_usar;
    text entrada;

    for (int i = 0; i < P; i++) {
        AdminBoleteria.hay_compra(id_usar);

        if (entradas_disp > 0) {
            entrada = vender();
            entradas_disp--;
        } else {
            entrada = "no hay mas";
        }

        AdminBoleteria.vender_entrada(id_usar, entrada);
    }

end Process;
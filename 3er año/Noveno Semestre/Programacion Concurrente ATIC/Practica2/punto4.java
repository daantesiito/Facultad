
// INCISO A
sem libres = N; --> contenedores libres
sem mutex = 1; --> semafoto para SC
sem listos = 0; --> paquetes listos

Cola contenedores;

Process Preparador {
    P(libres); --> hay contenedor libre
        P(mutex); --> bloquea SC
            Insertar(contenedores, paquete);
        V(mutex);        
    V(listos); --> suma 1 en listo asi habilita a entregador 
}

Process Entregador {
    P(listos); --> si hay listos entro
        P(mutex);
            paquete = Sacar(contenedores, paquete);
        V(mutex);
    V(libres); --> libero contenedor

    Entregar(paquete);
}

// INCISO B --> misma solucion porque soy capo

sem libres = N; --> contenedores libres
sem mutex = 1; --> semafoto para SC
sem listos = 0; --> paquetes listos

Cola contenedores;

Process Preparador[id: 0..P-1] {
    P(libres); --> hay contenedor libre
        P(mutex); --> bloquea SC
            Insertar(contenedores, paquete);
        V(mutex);        
    V(listos); --> suma 1 en listo asi habilita a entregador 
}

Process Entregador[id: 0..E-1] {
    P(listos); --> si hay listos entro
        P(mutex);
            paquete = Sacar(contenedores, paquete);
        V(mutex);
    V(libres); --> libero contenedor

    Entregar(paquete);
}

int cant = 0; 
int pri_ocupada = 0;
int pri_vacia = 0;
int buffer[N];

Process Productor::
{ while (true)
    { produce elemento
     <await (cant < N); cant++>
     buffer[pri_vacia] = elemento;
     pri_vacia = (pri_vacia + 1) mod N;
    }
}

Process Consumidor::
{ while (true)
    { <await (cant > 0); cant-- >
     elemento = buffer[pri_ocupada];
     pri_ocupada = (pri_ocupada + 1) mod N;
     consume elemento
    }
}


-----------------------------------------------
// Corregido: Entra primero el Productor ya que en Consumidor cant es 0.
// Luego en el productor se suma en 1 cant y esto habilita a entrar al Consumidor
// En el Consumidor se intenta leer en el buffer pero tambien el Productor escribe en el buffer al mismo tiempo.

int cant = 0; 
int pri_ocupada = 0;
int pri_vacia = 0;
int buffer[N];

Process Productor::
{ while (true)
    { produce elemento
     <await (cant < N); 
     buffer[pri_vacia] = elemento;
     pri_vacia = (pri_vacia + 1) mod N;
     cant++ >
    }
}

Process Consumidor::
{ while (true)
    { <await (cant > 0); 
     elemento = buffer[pri_ocupada];
     pri_ocupada = (pri_ocupada + 1) mod N;
     consume elemento
     cant-- >
    }
}

// Otra solucion es poner el cierre de la seccion critica una linea mas abajo que el cant del await. 
// Ejemplo:
Process Productor::
{ while (true)
    { produce elemento
     <await (cant < N); cant++
     buffer[pri_vacia] = elemento; >
     pri_vacia = (pri_vacia + 1) mod N;
    }
}

----------------------------------------------

// Agregamos exclusion mutua con pasaP y pasaC, haciendo que entren 1 a la vez
// y liberandose cuando salen.

int cant = 0; 
int pri_ocupada = 0;
int pri_vacia = 0;
int buffer[N];

int pasaP = 1;
int pasaC = 1;

Process Productor::
{ while (true)
    { produce elemento
     <await (cant < N and pasaP > 0);
        pasaP--
        buffer[pri_vacia] = elemento;
        pri_vacia = (pri_vacia + 1) mod N;
        pasaP++;
        cant++;
        >
    }
}

Process Consumidor::
{ while (true)
    { <await (cant > 0 and pasaC > 0);>
        pasaC--
        elemento = buffer[pri_ocupada];
        pri_ocupada = (pri_ocupada + 1) mod N;
        pasaC++;
        cant--;
        >
    consume elemento
    }
}

// Otra solucion sin usar pasaP y pasaC es como la primera solucion del inciso A.
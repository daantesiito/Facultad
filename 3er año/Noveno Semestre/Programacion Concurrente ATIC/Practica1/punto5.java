// INCISO A
int libre = 1;

Process Persona[id:0..N] {
    <await libre == 1; libre = libre - 1;>
        Imprimir(documento);
    <libre = libre + 1;>
}

// INCISO B
int siguiente = -1;
int cola[];

Process Persona[id:0..N] {
    <if (siguiente = -1) {
        siguiente = id;
    }
    else {
        Agregar(cola, id);
    }>
    <await siguiente == id;>
        Imprimir(documento);
    <if (Vacio(cola)) {
        siguiente = -1;
    }
    else {
        siguiente = Sacar(cola, id);
    }>
}

// INCISO C
int siguiente = -1;
int cola[];

Process Persona[id:0..N] {
    <if (siguiente = -1) {
        siguiente = id;
    }
    else {
        AgregarOrdenado(cola, id);
    }>
    <await siguiente == id;>
        Imprimir(documento);
    <if (Vacio(cola)) {
        siguiente = -1;
    }
    else {
        siguiente = Sacar(cola, id);
    }>
}

// INCISO D
int siguiente = 0;

Process Persona[id:0..N-1] {
    <await siguiente == id;>
        Imprimir(documento);
    <siguiente = siguiente + 1;>
}

// INCISO E
int siguiente = -1;
int cola[];
bool libre = true;

Process Persona[id:0..N] {
    <if (libre) {
        libre = false;
        siguiente = id;
    }
    else {
        Agregar(cola, id);
    }>
    <await siguiente == id;>
    
        Imprimir(documento);
    
    <libre = true;>
}

Process Coordinador {
    while true {
        <await libre == true;>
        <if !Vacio(cola) {
            siguiente = Sacar(cola);
            libre = false;
        }>
    }
}
// Realice una solución concurrente de grano grueso 
// (utilizando <> y/o <await B; S>) para el
// siguiente problema. Un sistema operativo mantiene 5 instancias 
// de un recurso almacenadas
// en una cola, cuando un proceso necesita usar una instancia 
// del recurso la saca de la cola, la
// usa y cuando termina de usarla la vuelve a depositar. 

int idUso;
int recurso;
int cola[N];
int cont[1..5];
bool listo = false;

Process Instancia[id: 1..5]
{
    bool usalo = false;
    while (true)
    {
        // esperar SO
        <await (saco and cont[id] > 0); 
        cont[id] = 0;
        idUso = id; >
        usalo = true;
        // uso de recurso
        <await (listo); 
        cont[id] = 1;
        listo = false; >
        usalo = false;
    }
}

Process Proceso
{
    bool saco = false;

    while (true)
    {
        saco = true;
        <await (usalo and cont[id] <= 5); 
        recurso = cola[id];
        //uso de recurso
        listo = true; >
        saco = false;
    }
}

----------------------------------------------------------

int cola[1..5]
int ini = 1;
int fin = 1;
int cant = 5;

Process Instancia
{
    int recurso;
    while (true)
    {
        <await (cant > 0);
        // pop
        recurso = cola[ini];
        ini = (ini mod 5) + 1; // el mod es para resetear el ciclo al llegar a 5, (5 mod 5 = 1)
        cant--; >

        //uso recurso

        <await (cant < 5);
        // push
        cola[fin] = recurso
        fin = (fin mod 5) + 1;
        cant++; >
    }
}
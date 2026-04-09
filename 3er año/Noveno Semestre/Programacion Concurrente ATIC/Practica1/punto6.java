// Realice una solución concurrente de grano grueso (utilizando <> y/o <await B; S>) para el
// siguiente problema. En un examen final hay P alumnos y 3 profesores. Cuando todos los
// alumnos han llegado comienza el examen. Cada alumno resuelve su examen, lo entrega y
// espera a que alguno de los profesores lo corrija y le indique la nota. Los profesores corrigen
// los exámenes respectando el orden en que los alumnos van entregando.

int colaResueltos[];
int nota[0..P-1];
int llegada = 0;

Process Alumno[id: 0..P-1]; {
    <llegada = llegada + 1;>

    <await llegada == P;>

    Resolver();

    <Agregar(colaResueltos,id);>

    <await nota[id] != -1;>
}

Process Profesor[id: 0..2]; {
    int alumno;

    while true
        <await !Vacio(colaResueltos); alumno = Sacar(colaResueltos)>
        nota[alumno] = Corregir();
}
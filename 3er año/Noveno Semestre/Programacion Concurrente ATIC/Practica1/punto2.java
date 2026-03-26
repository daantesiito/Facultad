// 2. Realice una solución concurrente de grano grueso (utilizando <> y/o <await B; S>) para el siguiente problema. 
// Dado un numero N verifique cuantas veces aparece ese número en un arreglo de longitud M.
// Escriba las pre-condiciones que considere necesarias.

int num = 10;
int total = 0;
int ar[1..M];

process Contador
{ 
    for i:= 1 to M do {
        if (num = ar[i]) {
            <total += 1>;
        }
    }
}

// No esta bien y no se como hacerlo.
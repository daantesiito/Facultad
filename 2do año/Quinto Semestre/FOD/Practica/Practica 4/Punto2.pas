program ej2;
const
    M = 4; {orden del árbol}
type
    alumnos = record
        nYa: string;
        dni: integer;
        legajo: integer;
        ingreso: integer;
    end;

    TNodo = record
        cant_datos: integer;
        claves: array [1..M-1] of integer; {se guardan los DNI para usar como clave}
        datos: array [1..M-1] of longint; {se guarda la referencia al registro de alumno en el archivo alumnos}
        hijos: array [1..M] of ^TNodo;
    end;

    TArchivoDatos  = file of alumnos;

    arbolB = file of TNodo;	

{

B.

N = (M-1) * A + M * B + (M-1) * C

512 = (M-1) * 64 + M * 8 + (M-1) * 4
512 = 64M - 64 + 8M + 4M - 4
512 = 76M - 68
580 = 76M
580/76 = M
7,63 = M
8 = M

M = 8
B = 32bits --> 4 bytes / 64bits --> 8 bytes
C = 1 integer --> 4 bytes
A = 1 registro --> 64 bytes
N = 1 nodo --> 512 bytes

C.

NO ENTENDI

D.

Para buscar el alumno con dni 12345678, habria que empezar por la raiz y fijarse en las claves del nodo. Si encuentra el alumno con ese dni, termina.
Si no lo encuentra ahi, sigue al nodo hijo correspondiente y se fija si alguna de las claves. Asi sucesivamente hasta encontrarlo.

E.

Si se desea buscar por numero de legajo, la clave original de DNI no serviria por lo tanto se tendria que buscar el legajo en el registro,
entrando al archivo de registros con la referencia en datos, y buscando ahi.
----- lo de arriba tiene un problema, si hay muchos registros, buscar el legajo en cada registro uno por uno puede ser muy lento.
Se podria crear un nuevo arbol b, con el nuevo indice basado en el legajo.

F.




}
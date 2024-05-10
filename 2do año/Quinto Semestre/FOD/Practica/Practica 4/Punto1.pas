program ej1;
const
    M = 4;
type
    alumnos = record
        nYa: string;
        dni: integer;
        legajo: integer;
        ingreso: integer;
    end;

    TNodo = record
        cant_datos: integer;
        datos: array [1..M-1] of alumnos;
        hijos: array [1..M] of ^TNodo;
    end;

    arbolB = file of TNodo;
{

B. 

N = (M-1) * A + M * B + C

512 = (M-1) * 64 + M * 8 + 4
512 = 64M -64 + 8M + 4
512 = 72M - 60
572 = 72M
572/72 = M
7,9444444 = M

M = 8
B = 32bits --> 4 bytes / 64bits --> 8 bytes
C = 1 integer --> 4 bytes
A = 1 registro --> 64 bytes
N = 1 nodo --> 512 bytes

C.  

- LA CANTIDAD DE DATOS EN EL NODO ES DE M-1
- MIENTRAS MAS GRANDE EL M, MAS ANCHO EL ARBOL Y MAS TIEMPO DE EJECUCION Y MEMORIA REQUERIDA.

D. 

Usaria el DNI como clave, pero tambien se podria usar el legajo ya que ambos son unicos para cada alumno.

E. 

PROCESO DE BUSQUEDA DE UN ARBOL B - MEJOR CASO --> 1 LECTURA 

EMPEZAR POR EL NODO RAIZ Y CHEQUEAR LOS ELEMENTOS.
EN ESTE CASO SE ENCUENTRA EL ELEMENTO Y TERMINA

PROCESO DE BUSQUEDA DE UN ARBOL B - PEOR CASO --> H LECTURAS

EMPEZAR POR EL NODO RAIZ Y CHEQUEAR LOS ELEMENTOS.
AL NO ENCONTRARSE SE DEBERIA ACCEDER AL NODO HIJO CORRESPONDIENTE
HASTA ENCONTRAR EL NODO HOJA CON MAYOR NIVEL.

F.

PARA ESTE CASO, LAS CANTIDAD DE LECTURAS SERIA LA MISMA YA QUE SE DEBE ENTRAR AL REGISTRO DE LA MISMA MANERA QUE BUSCANDOLO POR DNI

}
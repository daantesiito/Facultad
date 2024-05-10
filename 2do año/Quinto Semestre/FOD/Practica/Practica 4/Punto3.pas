program ej3;
const
    N = 4; // Orden del árbol B+
type
    alumno = record
        nYa: string;
        dni: integer;
        legajo: integer;
        ingreso: integer;
    end;

    nodo = record
        claves: array[1..N-1] of integer; // Claves del nodo
        hijos: array[1..N] of ^nodo;      // Punteros a los hijos
        numClaves: integer;               // Número de claves en el nodo
        esHoja: boolean;                  // Indicador de si el nodo es una hoja
        datos: array[1..N-1] of ^alumno;  // Punteros a registros de datos (solo en nodos hoja)
        sig: ^nodo;                       // Puntero al siguiente nodo hoja (solo en nodos hoja)
    end;

    ArchivoAlumnos = file of alumno;
    Indice = ^nodo;
{

A.

Los elementos se organizan similar a los arboles b, solo que los nodos hojas, tienen las claves y punteros al registro de alumno.
En cambio los nodos internos tienen claves y punteros a los nodos hijos.

B.

La principal caracteristica es que todos los nodos hijos estan enlazados y los nodos internos tienen copias de algunos valores de los hijos.
Esto sucede ya que al ser de acceso indexado los elementos estan todos en las hojas y no es necesario recorrer los nodos internos.
Los nodos internos solo estan para dividir los nodos hijos con los valores copiados de estos.

D.

E.



}
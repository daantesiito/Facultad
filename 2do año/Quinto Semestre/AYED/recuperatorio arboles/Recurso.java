//Dado un árbol que representa una estructura de directorios como la que muestra la imagen, implementar un
//método que reciba un nivel y retorne una lista con las imágenes encontradas en ese nivel.
//Modelar el recurso para representar las carpetas y los archivos.

import java.util.LinkedList;
import java.util.List;
import java.util.Queue;


public class Recurso {
    private string nombre;
    private string tipo;

    public Recurso() {
        this.nombre = nombre;
        this.tipo = tipo;
    }

    // getters y setters

    public boolean esImagen(){
        // puede ser jpg, png, etc
    }
}

// BUSCAR IMAGEN DE UN NIVEL CON COLA

public class BuscarImagenCola {
    
    public static List<Recurso> buscarImagenes(GeneralTree<Recurso> arbol, int nivel_pedido) {
        List<Recurso> lista = new LinkedList<Recurso>();
        Queue<GeneralTree<Recurso>> cola = new Queue<GeneralTree<Recurso>>();
        GeneralTree<Recurso> nodo;
        cola.enqueue(arbol);
        cola.enqueue(null);
        int nivelAct = 0;
        while (!cola.isEmpty() && nivel <= nivel_pedido) {
            nodo = queue.dequeue();
            if (nodo != null) {
                Recurso rec = nodo.getData();
                if (nivel == nivel_pedido) {
                    lista.add(rec);
                }
                if (rec.hasChildren() && nivel <= nivel_pedido) {
                    List<GeneralTree<Recurso>> children = rec.getChildren();
                    for (GeneralTree<Recurso> child: children) {
                        cola.enqueue(child);
                    }
                }
            }
            else {
                if (!cola.isEmpty()) {
                    nivel++;
                    cola.enqueue(null);
                }
            }

        }
        return lista;
    }

}

// BUSCAR UN CAMINO DONDE HAYA UNA IMAGEN - RECURSIVO

public class BuscarImagenRecursivo {

    public List<Recurso> buscar(GeneralTree<Recurso> arbol) {
        List<Recurso> lista = new LinkedList<Recurso>();
        // Inicia el camino con el nodo raíz
        lista.add(arbol.getData());

        // Si se encuentra una imagen, retorna el camino
        if (buscarRecursivo(arbol, lista)) {
            return lista;
        } else {
            return null; // No se encontró ninguna imagen en el árbol
        }
    }

    private boolean buscarRecursivo(GeneralTree<Recurso> nodo, List<Recurso> camino) {
        Recurso rec = nodo.getData();

        // Si el recurso actual es una imagen, hemos encontrado el camino
        if (rec.esImagen()) {
            return true;
        }

        List<GeneralTree<Recurso>> children = nodo.getChildren();

        // Itera sobre los hijos del nodo actual
        for (GeneralTree<Recurso> child : children) {
            // Añade el recurso del hijo al camino
            camino.add(child.getData());

            // Llama recursivamente y retorna si se encuentra una imagen
            if (buscarRecursivo(child, camino)) {
                return true;
            }

            // Si no se encontró, remueve el último recurso añadido (retrocede)
            camino.remove(camino.size() - 1);
        }

        // Si ningún hijo contiene una imagen, retorna false
        return false;
    }
}


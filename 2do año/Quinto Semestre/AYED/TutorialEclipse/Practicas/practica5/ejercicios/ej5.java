import java.util.*;

public class BancoItau {

    // Método principal para encontrar los jubilados
    public List<Persona> encontrarJubilados(Graph<Persona> grafo, int rango, String empleadoNombre) {
        
        // Lista para almacenar los jubilados encontrados
        List<Persona> jubilados = new LinkedList<>();
        
        // Busca el vértice del empleado en el grafo
        Vertex<Persona> empleado = grafo.search(empleadoNombre);
        
        // Verifica que el empleado existe en el grafo
        if (empleado != null) {
            // Array para marcar los nodos visitados
            boolean[] marcas = new boolean[grafo.getSize()];
            // Array para mantener la distancia de cada nodo desde el nodo inicial
            int[] distancias = new int[grafo.getSize()];
            Arrays.fill(distancias, Integer.MAX_VALUE); // Inicializa las distancias con valor máximo
            
            // Inicia el BFS para encontrar los jubilados en el rango dado
            bfs(empleado, grafo, marcas, jubilados, distancias, rango);
        }
        
        return jubilados;
    }
    
    // BFS para explorar el grafo y encontrar los jubilados en el rango
    private void bfs(Vertex<Persona> empleado, Graph<Persona> grafo, boolean[] marcas, List<Persona> jubilados, int[] distancias, int rango) {
        
        Queue<Vertex<Persona>> cola = new Queue<Vertex<T>>();
        
        // Encola el empleado inicial y marca su distancia como 0
        cola.enqueue(empleado);
        distancias[empleado.getPosition()] = 0;
        marcas[empleado.getPosition()] = true;
        
        while (!cola.isEmpty()) {
            Vertex<Persona> actual = cola.dequeue();
            int distanciaActual = distancias[actual.getPosition()];
            
            // Si la distancia actual es menor al rango y la persona es un jubilado que no ha recibido su jubilación
            if (distanciaActual < rango && actual.getData().esJubilado() && !actual.getData().haPercibidoJubilacionMes()) {
                jubilados.add(actual.getData());
                // Limitar la cantidad de jubilados a 40
                if (jubilados.size() == 40) {
                    break;
                }
            }
            
            // Explora los vecinos del nodo actual
            for (Edge<Persona> arista : grafo.getEdges(actual)) {
                Vertex<Persona> vecino = arista.getTarget();
                if (!marcas[vecino.getPosition()]) {
                    // Marca el vecino como visitado
                    marcas[vecino.getPosition()] = true;
                    // Añade el vecino a la cola y registra su distancia
                    cola.enqueue(vecino);
                    distancias[vecino.getPosition()] = distanciaActual + 1;
                }
            }
        }
    }
}

/* Explicación del Código
Método Principal encontrarJubilados:

Parámetros: Recibe el grafo de personas, el rango (grado de separación) y el nombre del empleado.

Inicialización:
Busca el vértice del empleado en el grafo y verifica que exista.
Crea un array marcas para llevar el registro de los nodos visitados.
Crea un array distancias para mantener las distancias de cada nodo desde el nodo inicial.

BFS: Llama al método bfs para realizar la búsqueda de los jubilados.

Método bfs:

Inicialización:
Utiliza una cola (Queue) para manejar los nodos que se deben explorar.
Encola el empleado inicial y establece su distancia como 0.

Exploración:
Mientras haya nodos en la cola, procesa uno por uno.
Si un vecino no ha sido visitado, se encola, se marca y se registra su distancia.
Se verifica si es un jubilado y si no ha recibido su jubilación del mes, y si es así, se añade a la lista de jubilados.
Si se alcanza el límite de 40 jubilados, se detiene la búsqueda.
Control de Distancia y Jubilados:

Solo se añaden a la lista los jubilados que están dentro del rango dado y que no han recibido su jubilación.
Se limita la cantidad de jubilados a un máximo de 40 para cumplir con las especificaciones.

Consideraciones
Modelado de Persona: Asegúrate de que la clase Persona tenga métodos esJubilado() y haPercibidoJubilacionMes().
Grafo de Personas: Asegúrate de que el grafo pueda manejar nodos de tipo Persona y permita buscar por nombre.
Eficiencia: Este algoritmo es eficiente y directo para resolver el problema de encontrar los jubilados dentro de un rango específico.*/

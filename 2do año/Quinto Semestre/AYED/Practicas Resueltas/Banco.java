public class Banco {

    public List<Jubilados> percepciones(Graph<Persona> grafo, String empleado, int distancia) {
        List<Jubilados> lista = new LinkedList<Jubilados>();
        if (!grafo.isEmpty()) {
            Vertex<Persona> emp = this.buscarEmpleado(grafo, empleado);
            if (emp != null) {
                lista = bfs(emp,grafo,distancia,lista, new boolean[grafo.size()]);
            }
        }
        return lista;
    } 

    private Vertex<Persona> buscarEmpleado(Graph<Persona> grafo, String empleado) {

        List<Vertex<Persona>> vertices = grafo.getVertices();

        Iterator<Vertex<Persona>> it = vertices.iterator();

        Vertex<Persona> empleadoEncontrado = null;

        boolean sigo = true;

        while (it.hasNext() && (sigo)) {
            if (it.next().getData().getNombre().equals(empleado)) {
                empleadoEncontrado = it.next();
                sigo = false;
            }
        }
        return empleadoEncontrado;
    }

    private List<Jubilados> bfs(Vertex<Persona> emp,Graph<Persona> grafo, int distancia, List<Jubilados> lista, boolean[] marcas) {

        Queue<Vertex<Persona>> cola = new Queue<Vertex<Persona>>();
        marcas[emp.getPosition()] = true;
        cola.enqueue(emp);
        cola.enqueue(null);

        while (!cola.isEmpty() && distancia > 0 && lista.getSize() < 40) {
            Vertex<Persona> vertice = cola.dequeue();
            if (vertice != null) {
                List<Edge<Persona>> ady = grafo.getEdges(vertice);
                Iterator<Edge<Persona>> it = ady.iterator();
                while (it.hasNext() && distancia > 0 && lista.getSize() < 40) {
                    Vertex<Persona> destino = it.next().getTarget();
                    int posDestino = destino.getPosition();
                    if (!marcas[posDestino]) {
                        marcas[posDestino] = true;
                        cola.enqueue(destino);
                        if (destino.getData().cumple()) {
                            lista.add(destino.getData().getNombre(), destino.getData().getDomicilio());
                        }
                    }
                }
            }
            else if (!cola.isEmpty()) {
                distancia--;
                cola.enqueue(null);
            }
        }
        return lista;
    }
}
//Dado un árbol general compuesto por personajes, donde
//puede haber dragones, princesas y otros, se denominan
//nodos accesibles a aquellos nodos tales que a lo largo
//del camino del nodo raíz del árbol hasta el nodo (ambos
//inclusive) no se encuentra ningún dragón.
//Implementar un método que devuelva una lista con un camino desde la raíz a una Princesa sin
//pasar por un Dragón –sin necesidad de ser el más cercano a la raíz-. Asuma que existe al menos
//un camino accesible.

public class Personaje {
    private string nombre;
    private string tipo;

    // getters y setters
    public Personaje() {
        this.nombre = nombre;
        this.tipo = tipo;
    }

    public boolean esDragon() {
        return this.getTipo().equals("Dragon");
    }

    public boolean esPrincesa() {
        return this.getTipo().equals("Princesa");
    }
}

public class EncontrarALaPrincesa {

    public List<Personaje> buscar(GeneralTree<Personaje> arbol) {

        List<Personaje> lista = new LinkedList<Personaje>();

        lista.add(arbol.getData());

        List<Personaje> camino =  new LinkedList<Personaje>();

        buscar(arbol,lista,camino);

        return camino;
    }

    private static void buscar(GeneralTree<Personaje> arbol, LinkedList<Personaje> lista, LinkedList<Personaje> camino) {

        Personaje p = arbol.getData();

        if (p.esPrincesa()) {
            camino.addAll(lista);
        }

        if (camino.isEmpty()) {
            List<GeneralTree<Personaje>> children = arbol.getChildren();
            for (GeneralTree<Personaje> child: children) {
                if (!child.getData().esDragon()) {
                    lista.add(child.getData());
                    buscar(child,lista,camino);
                    lista.remove(lista.size() - 1);
                }
            }
        }

    }

}
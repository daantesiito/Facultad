package tp2.ejercicio1;
import java.util.*;


public class BinaryTree <T> {
	
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());
	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}

	public int contarHojas() {
	    int cont = 0;
	    
	    if (isEmpty()) {
	        return 0;
	    } else if (isLeaf()) {
	        return 1;
	    } else {
	        if (hasLeftChild()) {
	            cont += this.getLeftChild().contarHojas();
	        }
	        if (hasRightChild()) {
	            cont += this.getRightChild().contarHojas();
	        }
	    }
	    return cont;
	}
    	
	public BinaryTree<T> espejo() {
	    BinaryTree<T> arbolEspejo = new BinaryTree<>();
	    
	    construirArbolEspejo(arbolEspejo, this);
	    
	    return arbolEspejo;
	}
	
	
    public void construirArbolEspejo(BinaryTree<T> arbolEspejo, BinaryTree<T> arbolOriginal){
    	if (!arbolOriginal.isEmpty()) arbolEspejo.setData(arbolOriginal.getData());
    	else {
    		if (arbolOriginal.hasLeftChild()) {
                arbolEspejo.addRightChild(new BinaryTree<>(arbolOriginal.getLeftChild().getData()));
    			arbolOriginal.getLeftChild().construirArbolEspejo(arbolEspejo, arbolOriginal);
    		}
    		if (arbolOriginal.hasRightChild()) {
                arbolEspejo.addLeftChild(new BinaryTree<>(arbolOriginal.getRightChild().getData()));
    			arbolOriginal.getRightChild().construirArbolEspejo(arbolEspejo, arbolOriginal);
    		}
    	}
    }

    public void entreNiveles(int n, int m) {
        // Inicialización de la cola para el recorrido por niveles
        Queue<BinaryTree<T>> queue = new LinkedList<>();
        queue.offer(this); // Agregamos el nodo raíz a la cola
        int currentLevel = 0; // Variable para rastrear el nivel actual

        // Bucle principal para el recorrido por niveles
        while (!queue.isEmpty()) {
            int size = queue.size(); // Tamaño actual de la cola (número de nodos en el nivel actual)
            currentLevel++; // Incrementamos el nivel actual

            // Si el nivel actual está dentro del rango [n, m], imprimimos los nodos
            if (currentLevel >= n && currentLevel <= m) {
                System.out.println("Nivel " + currentLevel + ":");
                for (int i = 0; i < size; i++) {
                    BinaryTree<T> current = queue.poll(); // Obtenemos y eliminamos el primer nodo de la cola
                    System.out.print(current.getData() + " "); // Imprimimos el dato del nodo

                    // Si tiene hijos, los agregamos a la cola para procesarlos en el siguiente nivel
                    if (current.hasLeftChild()) {
                        queue.offer(current.getLeftChild());
                    }
                    if (current.hasRightChild()) {
                        queue.offer(current.getRightChild());
                    }
                }
                System.out.println(); // Salto de línea después de imprimir los nodos del nivel
            } else if (currentLevel > m) {
                break; // Si ya hemos alcanzado el nivel m, salimos del bucle
            } else {
                // Si el nivel actual es menor que n, simplemente eliminamos los nodos de ese nivel de la cola
                for (int i = 0; i < size; i++) {
                    BinaryTree<T> current = queue.poll(); // Obtenemos y eliminamos el primer nodo de la cola
                    // Si tiene hijos, los agregamos a la cola para procesarlos en niveles posteriores
                    if (current.hasLeftChild()) {
                        queue.offer(current.getLeftChild());
                    }
                    if (current.hasRightChild()) {
                        queue.offer(current.getRightChild());
                    }
                }
            }
        }
    }

		
}


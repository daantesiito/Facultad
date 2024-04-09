package practica2.tp2.ejercicio1;
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
	
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	
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
        
        Queue<BinaryTree<T>> queue = new LinkedList<>();
        queue.offer(this); 
        int currentLevel = 0; 

        
        while (!queue.isEmpty()) {
            int size = queue.size(); 
            currentLevel++; 

            
            if (currentLevel >= n && currentLevel <= m) {
                System.out.println("Nivel " + currentLevel + ":");
                for (int i = 0; i < size; i++) {
                    BinaryTree<T> current = queue.poll(); 
                    System.out.print(current.getData() + " "); 

                    
                    if (current.hasLeftChild()) {
                        queue.offer(current.getLeftChild());
                    }
                    if (current.hasRightChild()) {
                        queue.offer(current.getRightChild());
                    }
                }
                System.out.println(); 
            } else if (currentLevel > m) {
                break; 
            } else {
                
                    BinaryTree<T> current = queue.poll(); 
                    
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


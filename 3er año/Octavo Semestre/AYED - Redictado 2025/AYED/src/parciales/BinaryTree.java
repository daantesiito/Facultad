package parciales;

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
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
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
		return this.contarHojasLoop();
	}
	
	private int contarHojasLoop() {
		if (this.isEmpty())
			return 0;
		if (this.isLeaf())
			return 1;
		int hojas = 0;
		if (this.hasLeftChild())
			hojas += this.getLeftChild().contarHojasLoop();
		if (this.hasRightChild())
			hojas += this.getRightChild().contarHojasLoop();
		return hojas;
	}
    	 
    public BinaryTree<T> espejo(){
    	BinaryTree<T> arbolEspejo = new BinaryTree<T>();
    	if (this.isEmpty())
    		return null;
    	
    	arbolEspejo.setData(this.getData());
    	
    	if (this.hasLeftChild())
    		arbolEspejo.addRightChild(this.getLeftChild().espejo());
    	if (this.hasRightChild())
    		arbolEspejo.addLeftChild(this.getRightChild().espejo());    	
    	return arbolEspejo;
    }

	// 0<=n<=m
    public void entreNiveles(int n, int m) {
        if (n > m || this.isEmpty()) 
        	return;

        Queue<BinaryTree<T>> cola = new Queue<BinaryTree<T>>();
        int nivel = 0;

        cola.enqueue(this);
        cola.enqueue(null); 

        while (!cola.isEmpty() && nivel <= m) {
            BinaryTree<T> dato = cola.dequeue();

            if (dato != null) { 
                if (nivel >= n) {
                    System.out.println(dato.getData()); 
                }
                if (dato.hasLeftChild())  
                	cola.enqueue(dato.getLeftChild());
                if (dato.hasRightChild()) 
                	cola.enqueue(dato.getRightChild());
            } else {
                // fin de nivel
                nivel++;
                if (!cola.isEmpty() && nivel <= m) {
                    cola.enqueue(null); 
                }
            }
        }
    }

//		
		
   }


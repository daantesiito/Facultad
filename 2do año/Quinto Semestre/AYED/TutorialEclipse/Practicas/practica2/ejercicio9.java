import practica2.tp2.ejercicio1.BinaryTree;

public class dosDatos(int suma, int resta) {
	
	public BinaryTree<dosDatos> sumAndDif(BinaryTree<Integer> arbol) {
		
		BinaryTree<dosDatos> nuevo = new BinaryTree<dosDatos>();
		
		if (arbol.isEmpty()) 
			sumAndDiff(arbol,nuevo,arbol.getData(), 0); // la primer variable es el arbol en si, la tercera variable es el dato dentro.
		
		return nuevo;
			
	}
	
	private static void sumAndDiff(BinaryTree<Integer> arbol, BinaryTree<dosDatos> nuevo, int suma, int resta) {
		nuevo.setData(dosDatos(suma,arbol.getData() - resta));
		
		if (arbol.hasLeftChild()) {
			arbol.addLeftChild(new a);
			sumAndDiff(arbol.getLeftChild(), nuevo.getLeftChild(), suma + arbol.getLeftChild().getData(), arbol.getData());
			
			
		}
	}

	
	
}
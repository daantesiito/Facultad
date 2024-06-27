package practica_3;

import java.util.ArrayList;
import java.util.List;

public class Parcial_15_06_24 {
	
	private GeneralTree<Integer> arbol;
	
	public Parcial_15_06_24 (GeneralTree<Integer> ar) {
		this.arbol = ar;
	}
	
	public List<Integer> camino(int num){
		List<Integer> caminoPri    = new ArrayList<>();
		List<Integer> caminoActual = new ArrayList<>();
		
		if(!this.arbol.isEmpty()) {
			caminoPri.add(this.arbol.getData());
			return camino(caminoPri,caminoActual,arbol,num);
		}
		return caminoPri;
	}

	private List<Integer> camino(List <Integer> caminoPri, List <Integer> caminoActual, GeneralTree<Integer> arbol, int num){
	
		if(arbol.isLeaf()) {
			caminoActual.add((Integer) arbol.getData());
			if(caminoPri.size()<caminoActual.size()) {
				caminoPri.clear();
				caminoPri.addAll(caminoActual);
			}
			return caminoPri;
		}
		else {
			List<GeneralTree<Integer>> hijos = arbol.getChildren();
			caminoActual.add((Integer) arbol.getData());
			if(hijos.size() >= num) {
				for(int i=0; i<hijos.size(); i++) {
					camino(caminoPri,caminoActual,hijos.get(i),num);
					caminoActual.remove(caminoActual.size() - 1);
				}
			}	
		}
		return caminoPri;
	}
	
	public GeneralTree<Integer> getArbol(){
		return this.arbol;
	}
	
	public static void main (String[] arg) {
		GeneralTree<Integer> one     = new GeneralTree<>(2); 
		GeneralTree<Integer> two     = new GeneralTree<>(9);  
		GeneralTree<Integer> three   = new GeneralTree<>(10);
		GeneralTree<Integer> four    = new GeneralTree<>(7);
		GeneralTree<Integer> five    = new GeneralTree<>(12);
		GeneralTree<Integer> six     = new GeneralTree<>(5);
		GeneralTree<Integer> seven   = new GeneralTree<>(6);
		GeneralTree<Integer> eight   = new GeneralTree<>(17); 
		GeneralTree<Integer> nine    = new GeneralTree<>(21);
		GeneralTree<Integer> ten     = new GeneralTree<>(13); 
		GeneralTree<Integer> eleven  = new GeneralTree<>(8);
		GeneralTree<Integer> twelve  = new GeneralTree<>(20);
		GeneralTree<Integer> thirteen= new GeneralTree<>(15); 
		
		one.addChild(two); // 2
		one.addChild(three);//10
		one.addChild(four);//7
		
		two.addChild(five);//12
		two.addChild(six);//5
				
		four.addChild(seven);//7
				
		five.addChild(eight);//17
		
		six.addChild(nine);//21
		six.addChild(ten);//13
		six.addChild(eleven);//8
		
		seven.addChild(twelve);//20
		seven.addChild(thirteen);//15
		
		
		Parcial_15_06_24 ejer = new Parcial_15_06_24(one);
		List<Integer> lista = ejer.camino(2); 
		for (int i=0; i<lista.size(); i++) {
			System.out.print("Los números del 1° camino son : " + "  " + lista.get(i) );
			//Debería devolver "one=2", "two=9", "six=5", "nine=21".
		}
	}	
}
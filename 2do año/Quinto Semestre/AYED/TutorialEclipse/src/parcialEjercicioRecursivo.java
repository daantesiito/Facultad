import java.util.List;

public class parcialEjercicioRecursivo {

    public static List<Integer> resolver(GeneralTree<Integer> arbol) {
        int puntaje = 0;
        int puntajeMax = 0;
        int nivel = 0;
        List<Integer> listaAct = new LinkedList<Integer>();
        List<Integer> listaMax = new LinkedList<Integer>();
        if (arbol != null) {
            recursividavidubi(arbol,puntaje,puntajeMax,listaAct,listaMax,nivel);
        }
        return listaMax;
    }

    private static void recursividavidubi(GeneralTree<Integer> arbol, int puntaje, int puntajeMax, List<Integer> listaAct, List<Integer> listaMax, int nivel) {
        int dato = arbol.getData();
        puntaje += dato * nivel;
        if (dato == 1) {
            listaAct.add(dato);
        }
        if (!arbol.isLeaf()) {
            for (GeneralTree<Integer> h: arbol.getChildren()) {
                recursividavidubi(h,puntaje,puntajeMax,listaAct,listaMax,nivel+1);
            }
        } else {
            if (puntaje > puntajeMax) {
                puntajeMax = puntaje;
                listaMax.clear();
                listaMax.addAll(listaAct);
            }
        }
        if (dato == 1) {
            listaAct.remove(listaAct.size()-1);
        }
        puntaje -= dato * nivel;
    }
}

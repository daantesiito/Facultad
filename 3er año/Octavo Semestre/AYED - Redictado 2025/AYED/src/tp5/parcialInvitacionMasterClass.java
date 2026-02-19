package tp5;

import java.util.LinkedList;
import java.util.List;

import parciales.Queue;

public class parcialInvitacionMasterClass {

    public LinkedList<UsuarioParcialBFS> invitacionMasterClass(Graph<String> red, String usuario, int distancia, int limite) {
        LinkedList<UsuarioParcialBFS> listaInvitados = new LinkedList<UsuarioParcialBFS>();
        boolean[] marcas = new boolean[red.getSize()];
        Vertex<String> origen = red.search(usuario);
        int distRecorrida = 0;
        if (usuario != null) {
            bfs(red, origen, distancia, limite, marcas, listaInvitados, distRecorrida);
        }
        return listaInvitados;
    }

    private void bfs(Graph<String> red, Vertex<String> origen, int distancia, int limite, boolean[] marcas, LinkedList<UsuarioParcialBFS> listaInvitados, int distRecorrida) {
        Queue<Vertex<String>> cola = new Queue<Vertex<String>>();
        marcas[origen.getPosition()] = true;
        cola.enqueue(origen);
        cola.enqueue(null);
        while (!cola.isEmpty() && limite > 0 && distancia > distRecorrida) {
        	Vertex<String> dato = cola.dequeue();
        	if (dato != null) {
        		 List<Edge<String>> ady = red.getEdges(dato);
        		 for (Edge<String> a : ady) {
        			 if (!marcas[a.getTarget().getPosition()]) {
            			 marcas[a.getTarget().getPosition()] = true;
            			 cola.enqueue(a.getTarget());
            			 UsuarioParcialBFS user = new UsuarioParcialBFS(a.getTarget().getData(), distRecorrida + 1);
            			 listaInvitados.add(user);
            			 limite -= 1;
        			 }
        		 }
        	}
        	else {
        		if (!cola.isEmpty()) {
        			cola.enqueue(null);
        			distRecorrida += 1;
        		}
        	}
        }
    }

}
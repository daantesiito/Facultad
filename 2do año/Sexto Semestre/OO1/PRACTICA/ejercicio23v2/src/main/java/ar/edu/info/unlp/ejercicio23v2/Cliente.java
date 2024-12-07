package ar.edu.info.unlp.ejercicio23v2;

import java.util.ArrayList;

public class Cliente extends Usuario{

    private ArrayList<Pedido> pedidos;

    public Cliente(String nombre, String direccion) {
        super(nombre,direccion);
        this.pedidos = new ArrayList<Pedido>();
    }

    public Pedido crearPedido(FormaDePago pago, FormaDeEnvio envio, Producto producto, int cantSolicitada) {
        if (this.hayStock(producto, cantSolicitada)) {
            Pedido pedido = new Pedido(this,pago,envio,producto,cantSolicitada);
            this.pedidos.add(pedido);
            producto.descontarStock(cantSolicitada);
            return pedido;
        }
        return null;
    }

    private boolean hayStock(Producto producto, int cantSolicitada) {
        return producto.getCantUnidadesDisp() > cantSolicitada;
    }

    private Bag<String> prodPorCat() {
        Bag<String> bag = new BagImpl<>();
        this.pedidos.stream().forEach(p -> p.categoriaProducto(bag));
        return bag;
    }

}

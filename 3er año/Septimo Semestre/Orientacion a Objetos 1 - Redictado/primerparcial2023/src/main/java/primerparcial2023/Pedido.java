package primerparcial2023;

import java.time.LocalDate;
import java.util.ArrayList;

public class Pedido {

    private LocalDate fecha;
    private ArrayList<ItemPedido> itemsPedidos;

    public Pedido() {
        this.fecha = LocalDate.now();
        this.itemsPedidos = new ArrayList<ItemPedido>();
    }

    public ItemPedido altaProducto(Producto producto, double cantidad) {
        ItemPedido item = new ItemPedido(cantidad, producto);
        this.itemsPedidos.add(item);
        return item;
    }

    public double cantProductos(Producto producto) {
        return this.itemsPedidos.stream().mapToDouble(i -> i.getCantProducto(producto)).count();
    }
}